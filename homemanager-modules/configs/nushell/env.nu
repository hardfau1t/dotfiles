
# Directories to search for scripts when calling source or use
let config_path = ($nu.home-dir | path join ".config/nushell")
# By default, <nushell-config-dir>/scripts is added
$env.NU_LIB_DIRS = [
    ($config_path |  path join 'libs')
]

# Directories to search for plugin binaries when calling register
#
# By default, <nushell-config-dir>/plugins is added
$env.NU_PLUGIN_DIRS = [
    ($config_path | path join 'plugins')
]


# xdg-exports


$env.PROMPT_INDICATOR_VI_INSERT = { || "" }
$env.PROMPT_INDICATOR_VI_NORMAL = { || "" }
$env.PROMPT_MULTILINE_INDICATOR = { || "" }

let STARSHIP_INIT_DIR = ([$env.XDG_CACHE_HOME, "starship"] | path join)
let STARSHIP_INIT = ([$STARSHIP_INIT_DIR, "init.nu"] | path join)
if not ($STARSHIP_INIT | path exists) {
    if ( which starship | length) > 0 {
        mkdir $STARSHIP_INIT_DIR
        starship init nu | save $STARSHIP_INIT
    } else {
        print -e "Install starship"
    }
}
