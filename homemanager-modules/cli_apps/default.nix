{
  lib,
  config,
  pkgs,
  ...
}:
{
  imports = [
    ./nushell
    ./mpd.nix
    ./podman
    ./mscout.nix
  ];
  options = {

  };
  config = lib.mkIf config.cli_apps.enable {
    home.packages = with pkgs; [
      aria2
      bash-language-server
      bat
      bottom
      clang-tools
      dust
      eza
      fd
      fzf
      gnumake
      lua-language-server
      maple-mono
      moreutils # for vipe
      neovim
      nil
      nixfmt-rfc-style
      nodePackages.vscode-json-languageserver
      nushellPlugins.polars
      openssl
      pass
      pkg-config
      pyright
      python312Packages.ipython
      python312
      ripgrep
      ruff
      rustup
      sqlite
      starship
      stow
      taplo
      tealdeer
      tokei
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
    programs = {
      nushell.enable = lib.mkDefault true;
      carapace.enable = lib.mkDefault true;

    };
    services = {
      mpd.enable = lib.mkDefault false;
      udiskie.enable = lib.mkDefault true;
    };
    xdg.enable = true;
    # this is required, otherwise udiskie will not start
    systemd.user.targets.tray = {
      Unit = {
        Description = "Home Manager System Tray";
        Requires = [ "graphical-session-pre.target" ];
      };
    };
  };
}
