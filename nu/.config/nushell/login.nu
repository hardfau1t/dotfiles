let-env PATH = (
    ([
        "~/.local/bin",
        $"($env.CARGO_HOME)/bin"
    ]
    | path expand ) 
    | append $env.PATH
    | str join ":"
)

let-env LD_LIBRARY_PATH  = (
    [
        ($env | get -i LD_LIBRARY_PATH),
        (if (which rustup | length) >= 1 {$"($env.RUSTUP_HOME)/toolchains/(rustup default | grep -o -e '^\S\+')"}),
        "/usr/local/lib",

    ]
    | filter {|it| $it != null } 
    | str join ':' 
)

# xdg-exports
let-env XDG_DATA_HOME = ([$env.HOME, .local/share ] | path join)
let-env XDG_STATE_HOME = ([$env.HOME,.local/state ] | path join)
let-env XDG_CACHE_HOME = ([$env.HOME,.cache ] | path join)
let-env XDG_CONFIG_HOME = ([$env.HOME, .config ] | path join )
let-env XDG_LIB_DIR = ([$env.HOME, .local/share/lib ] | path join )
let-env XDG_CURRENT_DESKTOP = sway
let-env XDG_CACHE_DIR = ([$env.HOME, .cache ] | path join )
let-env XDG_SESSION_TYPE = wayland


# applications
let-env CM_LAUNCHER = fuzzel
let-env BROWSER = firefox
let-env TERMINAL = alacritty
let-env READER = zathura
let-env MANPAGER = "sh -c 'col -bx | bat -l man -p'"
let-env FZF_DEFAULT_COMMAND = 'rg --hidden -l ""'
let-env EDITOR = nvim
let-env SYSTEMD_EDITOR = nvim

# application config export
let-env GRIM_DEFAULT_DIR = ([$env.HOME, Pictures/grim/ ] | path join )
let-env STARSHIP_CACHE = ([$env.HOME, .starship/cache ] | path join )
let-env STARSHIP_LOG = error
let-env CHEAT_CONFIG_PATH = ([$env.HOME, .config/cheat/conf.yml ] | path join )
let-env MOZ_ENABLE_WAYLAND = 1
let-env MPC_FORMAT = "%position% \t- %title% \t- %file%"
let-env MP_RATER_USE_TAGS = 1
let-env PASSWORD_STORE_DIR = ([$env.HOME, .config/password-store ] | path join )
let-env GNUPGHOME = ([$env.HOME, .config/gnupg ] | path join )
#android studio
let-env ANDROID_HOME = ([$env.XDG_DATA_HOME, android] | path join)
#gdb
let-env GDBHISTFILE = ([$env.XDG_CONFIG_HOME, gdb/.gdb_history] | path join)
#gef
let-env GEF_RC = ([$env.XDG_CONFIG_HOME, gef/.gef.rc] | path join)
#go
let-env GOPATH = ([$env.XDG_DATA_HOME, go] | path join)
#ipython
let-env IPYTHONDIR = ([$env.XDG_CONFIG_HOME, ipython] | path join)
#python
let-env PYTHONSTARTUP = ([$env.XDG_CONFIG_HOME, python/pythonrc] | path join )
# node
let-env NODE_REPL_HISTORY = ([$env.XDG_DATA_HOME, node_repl_history] | path join)
#cargo
let-env CARGO_HOME = ([$env.XDG_DATA_HOME, cargo] | path join)
# rustup
let-env RUSTUP_HOME = ([$env.XDG_DATA_HOME, rustup] | path join)
# sqlite
let-env SQLITE_HISTORY = ([$env.XDG_CACHE_HOME, sqlite_history] | path join)


if "XDG_RUNTIME_DIR" in $env { 
    let-env XAUTHORITY = ([$env.XDG_RUNTIME_DIR, Xauthority] | path join)
}
let-env LESSHISTFILE = ([$env.XDG_CACHE_HOME, less/history] | path join)
let-env QT_QPA_PLATFORM = wayland
let-env IGNOREOF = 100
let-env LANG = en_IN.UTF-8
let-env LC_CTYPE = en_IN.UTF-8
let-env HISTFILE = ([$env.XDG_STATE_HOME, shell_history] | path join)
#export TERM = "tmux-256color"
let-env HISTSIZE = 10000
let-env SAVEHIST = 10000
let-env LIBSEAT_BACKEND = logind

let-env XCURSOR_THEME = bibata
let-env XCURSOR_SIZE = 32

# uses all cores for compilation
let-env MAKEFLAGS = $"($env | get -i MAKEFLAGS) -j((nproc | into int) - 1)"

source "~/.cache/starship/init.nu"
