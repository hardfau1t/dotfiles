{ config, ... }: {
  programs.bash.sessionVariables = {
    # applications
    BROWSER = "zen";
    CM_LAUNCHER = "fuzzel";
    EDITOR = "nvim";
    FZF_DEFAULT_COMMAND = "rg --hidden -l \"\"";
    MANPAGER = "sh -c 'col -bx |bat -l man -p'";
    MANROFFOPT = "-c";
    READER = "zathura";
    SYSTEMD_EDITOR = "nvim";
    TERMINAL = "alacritty";

    # application config export
    CHEAT_CONFIG_PATH = "${config.home.homeDirectory}/.config/cheat/conf.yml";
    MOZ_ENABLE_WAYLAND = 1;
    MPC_FORMAT = "%position% \t- %title% \t- %file%";
    MP_RATER_USE_TAGS = 1;
    STARSHIP_CACHE = "${config.xdg.cacheHome}/starship";
    STARSHIP_LOG = "error";

    IGNOREOF = 100;
    LANG = "en_IN.UTF-8";
    LC_CTYPE = "en_IN.UTF-8";
    QT_QPA_PLATFORM = "wayland";
    #export TERM = "tmux-256color"
    HISTSIZE = 10000;
    LIBSEAT_BACKEND = "logind";
    SAVEHIST = 10000;

    XCURSOR_SIZE = 32;
    XCURSOR_THEME = "bibata";

    # uses all cores for compilation
    MAKEFLAGS = "\${MAKEFLAGS} -j $(( $(nproc) - 1 ))";

    CARGO_HOME = "${config.home.homeDirectory}/.local/share/cargo/";
    RUSTUP_HOME = "${config.home.homeDirectory}/.local/share/rustup";
    LEDGER_FILE = "${config.home.homeDirectory}/.local/share/hledger/main.ledger";

    # aws-cli files to config
    AWS_SHARED_CREDENTIALS_FILE = "${config.xdg.configHome}/aws/credentials";
    AWS_CONFIG_FILE = "${config.xdg.configHome}/aws/config";

    #android studio
    ANDROID_HOME = "${config.xdg.dataHome}/android";
    #gdb
    GDBHISTFILE = "${config.xdg.configHome}/gdb/.gdb_history";
    #gef
    GEF_RC = "${config.xdg.configHome}/gef/.gef.rc";
    #go
    GOPATH = "${config.xdg.dataHome}/go";
    #ipython
    IPYTHONDIR = "${config.xdg.configHome}/ipython";
    #python
    PYTHONSTARTUP = "${config.xdg.configHome}/python/pythonrc";
    # node
    NODE_REPL_HISTORY = "${config.xdg.dataHome}/node_repl_history";

    CARGO_BUILD_TARGET_DIR = "${config.xdg.cacheHome}/cargo";
    # sqlite
    SQLITE_HISTORY = "${config.xdg.cacheHome}/sqlite_history";
    #docker
    DOCKER_CONFIG = "${config.xdg.configHome}/docker";
    LESSHISTFILE = "${config.xdg.cacheHome}/less/history";
    XAUTHORITY = "\${XDG_RUNTIME_DIR}/Xauthority";
    HISTFILE = "${config.xdg.stateHome}/shell_history";
    XDG_LIB_DIR = "${config.home.homeDirectory}/.local/share/lib";
  };
}
