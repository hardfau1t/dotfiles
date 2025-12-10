
export def wait-for [host: string] {
    let syms = [ '/' '|' '\' '-' ]
    mut i = 0
    loop {
        let start = date now
        let resp = (do -i {ping -c 1 -W 1 -q $host }| complete)
        let end = date now
        if $resp.exit_code == 0 {
            (notify-send -t 5000 $"($host)" "up" | complete )| null
            do -i {mpv /usr/share/sounds/freedesktop/stereo/complete.oga} | complete | null
            return
        }
        if $resp.exit_code == -1 {
            print "SIGINT: exiting"
            return
        }
        print -n $"\r[($syms | get $i)] Waiting for ($host)\e[0J"
        if $resp.exit_code == 2 {
            print -n $": ($resp.stderr | str replace "\n" '')\e[0J"
        }
        $i = ($i + 1) mod 4
        sleep (1sec - ($end - $start))
    }
}

use std

export def mr [] {
    #--------------------
    let current_song = ([$env.MPD_DIR,(mpc current -f "%file%")] | path join )
    ^mv $current_song $"($env.HOME)/tmp"
    mpc rescan
    mpc next
    notify-send "mpd" $"'($current_song | path basename)' moved to ~/tmp" -t 5000
}

export def est [] {
    let init =  (cat /sys/class/power_supply/BAT0/energy_now | into int) / ( cat /sys/class/power_supply/BAT0/energy_full | into int)
        let init_time = (date now)
        while (true) {
            sleep 1min
                let bat_now = (cat /sys/class/power_supply/BAT0/energy_now | into int) / ( cat /sys/class/power_supply/BAT0/energy_full | into int)
                let diff_bat = $init - $bat_now
                let diff_time = ((date now) - $init_time ) / 1sec
                let rat = $diff_bat / $diff_time
                let remain = $bat_now / ($rat * 3600)
                print $"[(date now )] Remaining time ($remain) hours"
        }
}

const TITLE_REGEX = '(\(.*\)|\[.*\]|[^\x00-\x7f]|[\\/^%!$\|])'

def confirm-download [ title: string dir: path ] {
    let results = fd . -t f $dir | lines | par-each { |song | 
        {name: $song, rating: ($song 
            | path basename 
            | str replace -ra $TITLE_REGEX '' 
            | path parse
            | get stem
            | str distance $title)
        }
    }
        | sort-by rating 
        | first 5 
        | where rating <= 10
    if ($results | is-empty) {
        std log info "No such similar songs found, Continuing to download"
            return true
    } else if ($results.0.rating == 0) {
        std log error $"($title) exact similar song already exists"
            return false
    } else {
        print $"for '($title)', matching results"
            print $results
            return ((input -n 1 "Above similar songs exists, Do you want to Continue? [Y/n]" | str downcase) != 'n')
    }
}

def get-youtube-song [unparsed_link: string output_dir: path = "./"] {
    let link = ($unparsed_link | url parse | update params {where key == v } | reject query| url join)
    if $link == null {
        print -e $"Failed to parse link '($unparsed_link)'"
        return ""
    }
    std log info $"Downloading from youtube: `($link)`"
    try {
        let metadata = (yt-dlp --default-search 'ytsearch' --dump-json --skip-download $'($link)' | from json)
# replace all contents within () and [] and any special characters
	let title = $metadata.title | str replace -ra $TITLE_REGEX ''
	let title =  if (input -n 1 $"Title:'($title)'\nDo you want to modify it?[y/N]" | str downcase) == 'y' {
            ($title | vipe)
        } else {
            $title
        }
	if (confirm-download $title $output_dir) {
                print $"downloading ($link)"
                yt-dlp --embed-thumbnail --embed-metadata -x --audio-format mp3 --no-embed-info-json --default-search 'ytsearch' -o $"($output_dir)/($title).mp3" $"($link)"
		return $"($title).mp3"
	}
    } catch { |error|
        std log warning $"couldn't download ($link): ($error)"
    }
    return ""
}

export def get-song [
    --add(-a)          # add the song to current queue
    link: string
] {
    if "MPD_DIR" not-in $env {
        print -e "Failed to get $env.MPD_DIR, is it set?"
        return
    }
    let MusicDownloadDir = $"($env.MPD_DIR)/temp/"
    let host = $link | url parse | get host
    # let ret = if $host =~ '^(https://)?(music|www)\.youtube\.com/watch\?v=[\w-]+' {
    let ret = if $host =~ 'youtube.com' {
        std log debug "Downloading from youtube"
        let title = (get-youtube-song $link $MusicDownloadDir)
        if $title != "" and $add {
            std log info $"adding ($title) to current queue"
            mpc update -w
            mpc add $"($MusicDownloadDir | path join $title | path relative-to $env.MPD_DIR)"
        }
    } else {
        std log error $"Failed to get the provider for the link: '($link)'"
        1
    }
    if $ret == 1 {
        std log error "Download Failed"
    }
}

export def "journal sync" [] {
    cd ~/.personal/
    if ( git status --porcelain -uall | is-not-empty) {
        git add .
        git commit -m $"(date now | format date  "%d-%m-%Y")"
    }
    try {
        git pull
    } catch {
        print -e "failed to pull remote changes, manually pull and then push the changes"
    }
    git push
}

export def tty-size [] {
    # stty size | parse "{rows} {cols}" | get 0 | format pattern 'stty rows {rows} cols {cols}' | str trim | wl-copy
}

export def bsource [pth: string ] {
    exec bash -c $"'source ($pth) && exec nu'"
}

export def notif [wait: duration ...params] {
    systemd-run --on-active ($wait | format duration sec | split row ' ' | get 0 ) --user notify-send ...$params
}

export def copy-remote [remote_id: string] {
    ssh $remote_id cat /tmp/clip | wl-copy
}

def retry [
    --dur(-d): duration = 2sec, # time between retries
    command: closure, # command to run
] {
    loop {
        let till = (date now) + $dur
        clear
        do $command | print
        sleep ($till - (date now))
    }
}

# print clock of given timezones
export def clock [ ] {
    let timezones = $in | default ["utc"]
    clear
    loop {
        clear
        ansi green
        $timezones | each {|timezone|
            print $"(ansi yellow)(date now| date to-timezone $timezone| format date '%Y-%m-%d %H:%M:%S')(ansi reset)  ($timezone)"
        }
        ansi reset
        sleep 1sec
    }
}


# find nearby random mac which is not in your current network
export def random-mac [
    ifname: string, # name of the interface to scan
    --set(-s), # set the mac address to that interface
    --no-scan, # don't scan network continue with current
] {
    let ip_info = ^ip -j a show dev $ifname
        | from json 
        | first 
    let mac = $ip_info.address
    let addresses = $ip_info.addr_info
        | where family == inet and scope == global 
    let addresses = $addresses | each {|addr|
        if not $no_scan {
        echo $"($addr.local)/($addr.prefixlen)"
            nmap -sn $"($addr.local)/($addr.prefixlen)" | ignore # just ping all interfaces
        }
        # get all neighbours
        ip -j n show dev $ifname
        | from json 
        | get lladdr
        | compact
        | each {|neigh| {
            addr: $neigh,
            distance: ($neigh | str distance $mac)
            }} 
        | sort-by  distance 
        | insert new_addr {|row| $row.addr 
            | split column ':'  
            | update column6 {|oct| 
                ((($oct.column6 | into int -r 16 ) + 1 ) mod 256 | format number | get lowerhex  | str substring 2..)
                | into string
            } 
            | transpose -i 
            | get column0 
            | str join ':'
        }  
    } | flatten
    let existing_addr = $addresses | get addr | default []
    let new_addr = $addresses.new_addr | where $it not-in existing_addr | first
    if $set {
        print -e $'replacing old mac ($mac) with new ($new_addr)'
        sudo ip link set dev $ifname addr $new_addr
    }
    $new_addr
}

# download content from seedr with proper filename
def seedr [ link: string ] {
    let title = $link | url parse | get path | split row '/' | last | url decode
    wget -O $title $link
}

def "nix search" [ 
    --full(-f), # show all results
    key: string 
] {
    ^nix search nixpkgs $key --json
    | from json
    | transpose name desc
    | update name { str substring 28.. }
    | sort-by {
        get name
        | str distance $key
    }
    | if not $full { first 5 } else {}
}
