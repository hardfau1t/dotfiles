{
  pkgs,
  user,
  config,
  ...
}:
let
  custom_freecad = pkgs.freecad-wayland.overrideAttrs {
    buildInputs = pkgs.freecad-wayland.buildInputs ++ [ pkgs.python311Packages.ifcopenshell ];
  };
in
{
  imports = [
    ../../homemanager-modules
  ];
  # Home Manager needs a bit of information about you and the paths it should
  # manage.
  home.username = "${user.name}";
  home.homeDirectory = "/home/${user.name}";

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
    bash-language-server
    bat
    bottom
    clang-tools
    cliphist
    dust
    eww
    eza
    fd
    # custom_freecad
    fuzzel
    fzf
    gnumake
    grim
    hledger
    hyprpaper
    imagemagick
    imv
    libiconv
    libnotify
    lua-language-server
    maple-mono
    moreutils # for vipe
    mpc-cli
    mpv
    neovim
    nil
    nixfmt-rfc-style
    nodePackages.vscode-json-languageserver
    nushellPlugins.polars
    openssl
    obs-studio
    pass
    pinentry-gtk2
    pkg-config
    pyright
    python312Packages.ipython
    python314
    ripgrep
    showmethekey
    slurp
    sqlite
    starship
    stow
    taplo
    tealdeer
    tokei
    wesnoth
    wl-clipboard
    yt-dlp
    zellij
    nerd-fonts.symbols-only
    maple-mono-NF
    # # It is sometimes useful to fine-tune packages, for example, by applying
    # # overrides. You can do that directly here, just don't forget the
    # # parentheses. Maybe you want to install Nerd Fonts with a limited number of
    # # fonts?

    # # You can also create simple shell scripts directly inside your
    # # configuration. For example, this adds a command 'my-hello' to your
    # # environment:
    # (pkgs.writeShellScriptBin "my-hello" ''
    #   echo "Hello, ${config.home.username}!"
    # '')
  ];

  # Home Manager is pretty good at managing dotfiles. The primary way to manage
  # plain files is through 'home.file'.

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
  #  /etc/profiles/per-user/${main_user}/etc/profile.d/hm-session-vars.sh
  #
  home.sessionVariables = {
    # EDITOR = "emacs";
  };

  programs = {
    waybar = {
      enable = true;
      systemd.enable = true;
      systemd.target = "graphical-session.target";
    };
  };
  services.mpd.enable = true;
  # wayland.windowManager.hyprland.enable = false;
  containers-storage = "/mnt/storage/podman";
}
