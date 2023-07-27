
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

$env.PROMPT_INDICATOR_VI_INSERT = { || "" }
$env.PROMPT_INDICATOR_VI_NORMAL = { || "" }
$env.PROMPT_MULTILINE_INDICATOR = { || "" }
$env.EDITOR = "nvim"
$env.MSCOUT_USE_TAGS = "true"
$env.CARGO_HOME = ("~/.local/share/cargo/" | path expand)
$env.RUSTUP_HOME = ("~/.local/share/rustup" | path expand)

$env.MPD_DIR =  $"($env.HOME)/Music"
$env.WGPU_BACKEND = gl

if not ("~/.cache/starship/init.nu" | path exists) {
    if ( which starship | length) > 0 {
        mkdir "~/.cache/starship"
        starship init nu | save "~/.cache/starship/init.nu"
    } else {
        print -e "Install starship"
    }
}
