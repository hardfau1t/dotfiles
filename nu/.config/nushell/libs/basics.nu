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
    let mpd_dir = $"($env.HOME)/storage/music"
    #--------------------
    let current_song = ([$mpd_dir,(mpc current -f "%file%")] | path join )
    mv $current_song $"($env.HOME)/tmp"
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
        return 1
    }
    std log info $"Downloading from youtube: ($links.0)"
    try {
        yt-dlp --embed-thumbnail --embed-metadata -x --audio-format mp3 --no-embed-info-json $links.0
    } catch {
        std log warning $"couldn't download ($links.0)"
        return 1
    }
    return $links.0
}

export def get-song [link: string] {
    if not "MUSIC_DIR" in $env {
        print -e "Failed to get $env.MUSIC_DIR, is it set?"
        return
    }
    cd $"($env.MUSIC_DIR)/temp"
    let ret = if $link =~ '^(https://)?(music|www)\.youtube\.com/watch\?v=\w+' {
        std log debug "matched link to youtube"
        get-youtube-song $link
    } else {
        std log error $"Failed to get the provider for the link: '($link)'"
        1
    }
    if $ret == 1 {
        std log error "Download Failed"
    }
    mpc update
}
