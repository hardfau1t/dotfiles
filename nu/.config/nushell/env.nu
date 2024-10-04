
# Directories to search for scripts when calling source or use
let config_path = ($nu.home-path | path join ".config/nushell")
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
$env.XDG_DATA_HOME = ([$env.HOME, .local/share ] | path join)
$env.XDG_STATE_HOME = ([$env.HOME,.local/state ] | path join)
$env.XDG_CONFIG_HOME = ([$env.HOME, .config ] | path join )
$env.XDG_LIB_DIR = ([$env.HOME, .local/share/lib ] | path join )
$env.XDG_CURRENT_DESKTOP = "Hyprland"
$env.XDG_CACHE_DIR = ([$env.HOME, .cache ] | path join )
$env.XDG_SESSION_TYPE = "wayland"


# applications
$env.CM_LAUNCHER = "fuzzel"
$env.BROWSER = "firefox"
$env.TERMINAL = "alacritty"
$env.READER = "zathura"
$env.MANPAGER = "sh -c 'col -bx |bat -l man -p'"
$env.MANROFFOPT = "-c"
$env.FZF_DEFAULT_COMMAND = 'rg --hidden -l ""'
$env.EDITOR = "nvim"
$env.SYSTEMD_EDITOR = "nvim"

# application config export
$env.GRIM_DEFAULT_DIR = ([$env.HOME, Pictures/grim/ ] | path join )
$env.STARSHIP_CACHE = ([$env.HOME, .starship/cache ] | path join )
$env.STARSHIP_LOG = "error"
$env.CHEAT_CONFIG_PATH = ([$env.HOME, .config/cheat/conf.yml ] | path join )
$env.MOZ_ENABLE_WAYLAND = 1
$env.MPC_FORMAT = "%position% \t- %title% \t- %file%"
$env.MP_RATER_USE_TAGS = 1
$env.PASSWORD_STORE_DIR = ([$env.HOME, .config/password-store ] | path join )
$env.GNUPGHOME = ([$env.HOME, .config/gnupg ] | path join )
#android studio
$env.ANDROID_HOME = ([$env.XDG_DATA_HOME, android] | path join)
#gdb
$env.GDBHISTFILE = ([$env.XDG_CONFIG_HOME, gdb/.gdb_history] | path join)
#gef
$env.GEF_RC = ([$env.XDG_CONFIG_HOME, gef/.gef.rc] | path join)
#go
$env.GOPATH = ([$env.XDG_DATA_HOME, go] | path join)
#ipython
$env.IPYTHONDIR = ([$env.XDG_CONFIG_HOME, ipython] | path join)
#python
$env.PYTHONSTARTUP = ([$env.XDG_CONFIG_HOME, python/pythonrc] | path join )
# node
$env.NODE_REPL_HISTORY = ([$env.XDG_DATA_HOME, node_repl_history] | path join)
#cargo
$env.CARGO_HOME = ([$env.XDG_DATA_HOME, cargo] | path join)
$env.CARGO_BUILD_TARGET_DIR = ([$env.XDG_CACHE_DIR, cargo] | path join)
# rustup
$env.RUSTUP_HOME = ([$env.XDG_DATA_HOME, rustup] | path join)
# sqlite
$env.SQLITE_HISTORY = ([$env.XDG_CACHE_DIR, sqlite_history] | path join)
#docker
$env.DOCKER_CONFIG = ([$env.XDG_CONFIG_HOME, docker ] | path join)


if "XDG_RUNTIME_DIR" in $env { 
$env.XAUTHORITY = ([$env.XDG_RUNTIME_DIR, Xauthority] | path join)
}
$env.LESSHISTFILE = ([$env.XDG_CACHE_DIR, less/history] | path join)
$env.QT_QPA_PLATFORM = "wayland"
$env.IGNOREOF = 100
$env.LANG = "en_IN.UTF-8"
$env.LC_CTYPE = "en_IN.UTF-8"
$env.HISTFILE = ([$env.XDG_STATE_HOME, shell_history] | path join)
#export TERM = "tmux-256color"
$env.HISTSIZE = 10000
$env.SAVEHIST = 10000
$env.LIBSEAT_BACKEND = "logind"

$env.XCURSOR_THEME = "bibata"
$env.XCURSOR_SIZE = 32

# uses all cores for compilation
$env.MAKEFLAGS = $"($env | get -i MAKEFLAGS) -j((nproc | into int) - 1)"

$env.PROMPT_INDICATOR_VI_INSERT = { || "" }
$env.PROMPT_INDICATOR_VI_NORMAL = { || "" }
$env.PROMPT_MULTILINE_INDICATOR = { || "" }
$env.EDITOR = "nvim"
$env.MPD_HOST = $"($env.XDG_RUNTIME_DIR)/mpd.socket"
$env.MSCOUT_USE_TAGS = "true"
$env.CARGO_HOME = ("~/.local/share/cargo/" | path expand)
$env.RUSTUP_HOME = ("~/.local/share/rustup" | path expand)

# aws-cli files to config
$env.AWS_SHARED_CREDENTIALS_FILE = $"($env.XDG_CONFIG_HOME)/aws/credentials"
$env.AWS_CONFIG_FILE = $"($env.XDG_CONFIG_HOME)/aws/config"

$env.MPD_DIR =  $"($env.HOME)/Music"

let STARSHIP_INIT_DIR = ([$env.XDG_CACHE_DIR, starship] | path join)
let STARSHIP_INIT = ([$STARSHIP_INIT_DIR, init.nu] | path join)
# check first here then source in config.nu
if not ($STARSHIP_INIT | path exists) {
    if ( which starship | length) > 0 {
        mkdir $STARSHIP_INIT_DIR
        starship init nu | save $STARSHIP_INIT
    } else {
        print -e "Install starship"
    }
}
