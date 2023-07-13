# vim: set filetype=nu:

export def wait-for [host: string] {
    let syms = [ '/' '|' '\' '-' ]
    mut i = 0
    loop {
        let resp = (do -s {ping -c 1 -W 1 -q $host }| complete)
        if $resp.exit_code == 0 {
            (notify-send -t 5000 $"($host)" "up" | complete )| null
            do -i {mpv /usr/share/sounds/freedesktop/stereo/complete.oga} | complete | null
            return
        }
        if $resp.exit_code == -1 {
            print "SIGINT: exiting"
            return
        }
        print -n $"\r[($syms | get ($i mod 4))] Waiting for ($host)"
        if $resp.exit_code == 2 {
            print -n $"($resp.stderr | str replace '\n' '')"
        }
        $i = $i + 1
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




def get-youtube-song [link: string] {
    let links = ($link | parse -r 'youtube\.com/watch\?v=(?<link>[\w-]+)' | get link)
    if ($links | length) != 1 {
        print -e $"Failed to parse link '($link)', found ($links | length) valid link matches"
        return ""
    }
    std log info $"Downloading from youtube: ($links.0)"
    try {
        let metadata = (yt-dlp --dump-json --skip-download $link | from json)
        yt-dlp --embed-thumbnail --embed-metadata -x --audio-format mp3 --no-embed-info-json $link -o $"($metadata.title).mp3"
        return $"($metadata.title).mp3"
    } catch {
        std log warning $"couldn't download ($links.0)"
    }
    return ""
}

export def get-song [link: string] {
    let MusicDownloadDir = "temp/"
    if not "MPD_DIR" in $env {
        print -e "Failed to get $env.MPD_DIR, is it set?"
        return
    }
    cd $"($env.MPD_DIR)/($MusicDownloadDir)"
    let ret = if $link =~ '^(https://)?(music|www)\.youtube\.com/watch\?v=[\w-]+' {
        std log debug "matched link to youtube"
        let title = (get-youtube-song $link)
        if $title != "" {
            mpc update -w
            mpc add $"($MusicDownloadDir | path join $title)"
        }
    } else {
        std log error $"Failed to get the provider for the link: '($link)'"
        1
    }
    if $ret == 1 {
        std log error "Download Failed"
    }
}

export def commit-pass [] {
    cd ~/.dots/personal/
    git add .
    git commit -m $"(date now | date format "%d-%m-%Y")"
    git push
    cd -
}

export def tty-size [] {
    stty size | parse "{rows} {cols}" | get 0 | format 'stty rows {rows} cols {cols}' | str trim | std clip
}

export def bsource [pth: string ] {
    exec bash -c $"'source ($pth) && exec nu'"
}
