
# Directories to search for scripts when calling source or use
let config_path = ($nu.home-path | path join ".config/nushell")
#

# By default, <nushell-config-dir>/scripts is added
let-env NU_LIB_DIRS = [
    ($config_path |  path join 'libs')
]

# Directories to search for plugin binaries when calling register
#
# By default, <nushell-config-dir>/plugins is added
let-env NU_PLUGIN_DIRS = [
    ($config_path | path join 'plugins')
]

let-env PROMPT_INDICATOR_VI_INSERT = { || "" }
let-env PROMPT_INDICATOR_VI_NORMAL = { || "" }
let-env PROMPT_MULTILINE_INDICATOR = { || "" }
let-env EDITOR = "nvim"
let-env MSCOUT_USE_TAGS = "true"
let-env CARGO_HOME = ("~/.local/share/cargo/" | path expand)
let-env RUSTUP_HOME = ("~/.local/share/rustup" | path expand)

let-env MPD_DIR =  $"($env.HOME)/Music"
let-env WGPU_BACKEND = gl
