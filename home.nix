{ config, pkgs, ... }:
{
  # Home Manager needs a bit of information about you and the paths it should
  # manage.
  home.username = "gireesh";
  home.homeDirectory = "/home/gireesh";

  # This value determines the Home Manager release that your configuration is
  # compatible with. This helps avoid breakage when a new Home Manager release
  # introduces backwards incompatible changes.
  #
  # You should not change this value, even if you update Home Manager. If you do
  # want to update the value, then make sure to first check the Home Manager
  # release notes.
  home.stateVersion = "24.05"; # Please read the comment before changing.

  # The home.packages option allows you to install Nix packages into your
  # environment.
  home.packages = with pkgs; [
    alacritty
    angband
    aria2
    bat
    bottom
    cliphist
    dunst
    dust
    eww
    eza
    fd
    fuzzel
    freecad-wayland
    fzf
    gnumake
    grim
    hledger
    imv
    libnotify
    libiconv
    lua-language-server
    maple-mono
    mpc-cli
    mpv
    neovim
    nil
    nodePackages.vscode-json-languageserver
    nushellPlugins.polars
    nixfmt-rfc-style
    openssl
    pass
    pinentry-gtk2
    python312Packages.ipython
    pyright
    pkg-config
    ripgrep
    showmethekey
    sqlite
    slurp
    starship
    stow
    taplo
    tealdeer
    wl-clipboard
    zellij
    # # It is sometimes useful to fine-tune packages, for example, by applying
    # # overrides. You can do that directly here, just don't forget the
    # # parentheses. Maybe you want to install Nerd Fonts with a limited number of
    # # fonts?
    # (pkgs.nerdfonts.override { fonts = [ "FantasqueSansMono" ]; })

    # # You can also create simple shell scripts directly inside your
    # # configuration. For example, this adds a command 'my-hello' to your
    # # environment:
    # (pkgs.writeShellScriptBin "my-hello" ''
    #   echo "Hello, ${config.home.username}!"
    # '')
  ];

  xdg = {
    enable = true;
    configFile = {
      "starship.toml".source = ./configs/starship.toml;
      "bat" = {
        source = ./configs/bat;
        recursive = true;
      };
      "ipython/profile_default/ipython_config.py".text = ''
        c = get_config()  #noqa
        c.TerminalIPythonApp.display_banner = False
        c.InteractiveShell.pdb = False
        c.InteractiveShell.quiet = False
        c.TerminalInteractiveShell.editing_mode = 'vi'
        c.TerminalInteractiveShell.extra_open_editor_shortcuts = True
        c.TerminalInteractiveShell.quiet = True
      '';
      "nvim" = {
        source = ./configs/nvim;
        recursive = true;
      };
      "xkb" = {
        source = ./configs/xkb;
        recursive = true;
      };
      "eww" = {
        source = ./configs/eww;
        recursive = true;
      };
      "hypr" = {
        source = ./configs/hypr;
        recursive = true;
      };
      # ".config/starship.toml".source = ./configs/starship.toml;
      "zellij" = {
        source = ./configs/zellij;
        recursive = true;
      };
      "nushell/libs" = {
        source = ./configs/nushell/libs;
        recursive = true;
      };
      "alacritty" = {
        source = ./configs/alacritty;
        recursive = true;
      };
    };
  };

  # Home Manager is pretty good at managing dotfiles. The primary way to manage
  # plain files is through 'home.file'.
  home.file = {
    # # Building this configuration will create a copy of 'dotfiles/screenrc' in
    # # the Nix store. Activating the configuration will then make '~/.screenrc' a
    # # symlink to the Nix store copy.
    # ".screenrc".source = dotfiles/screenrc;

    # # You can also set the file content immediately.
    # ".gradle/gradle.properties".text = ''
    #   org.gradle.console=verbose
    #   org.gradle.daemon.idletimeout=3600000
    # '';
  };

  # Home Manager can also manage your environment variables through
  # 'home.sessionVariables'. These will be explicitly sourced when using a
  # shell provided by Home Manager. If you don't want to manage your shell
  # through Home Manager then you have to manually source 'hm-session-vars.sh'
  # located at either
  #
  #  ~/.nix-profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  ~/.local/state/nix/profiles/profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  /etc/profiles/per-user/gireesh/etc/profile.d/hm-session-vars.sh
  #
  home.sessionVariables = {
    # EDITOR = "emacs";
  };

  # Let Home Manager install and manage itself.
  programs = {
    home-manager.enable = true;
    nushell = {
      enable = true;
      configFile.source = ./configs/nushell/config.nu;
      envFile.source = ./configs/nushell/env.nu;
      loginFile.source = ./configs/nushell/login.nu;
    };
    carapace.enable = true;
  };
  services = {
    mpd = {
      musicDirectory = "/media/loud/music";
      enable = true;
      network.port =6600;
      extraConfig = ''
        bind_to_address  "/run/user/1000/mpd.socket"
        bind_to_address "any"
        '';
    };
  };
}
