#!/usr/bin/nu

const IGNORE_FILES = [ install.nu Readme.md screeshot.png ]

def main [] {
    if (which stow | length) <= 0 {
        print -e "Stow not found."
        exit 1
    }
    let apps = (ls | where name not-in $IGNORE_FILES ).name
    for app in $apps {
        let op = (input --numchar 1 $"install ($app) y/N/s/a/r/?: ")
        print ""
        match $op {
            'y' => {print -e $"installing ($app)"} ,
            's' => {exit 0} ,
            'a' => {print -e "todo install all" },
            '?' => {
                    print -e "y: yes"
                    print -e "n: no [default]"
                    print -e "r: reinstall"
                    print -e "s: skip rest"
                    print -e "a: install rest"
                    print -e "?: this help"
                }
            _ => {print -e $"Skipped ($app)"}
        }
    }

}
