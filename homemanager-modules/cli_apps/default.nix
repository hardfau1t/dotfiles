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
      pkg-config
      pyright
      (python312.withPackages (ps: [
        ps.ipython
      ]))
      ripgrep
      ruff
      rustup
      socat
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
    home.sessionVariables = {
      LD_LIBRARY_PATH = pkgs.lib.makeLibraryPath [ pkgs.openssl ];
    };
    programs = {
      nushell.enable = lib.mkDefault true;
      carapace.enable = lib.mkDefault true;
      password-store = {
        enable = true;
        package = pkgs.pass.withExtensions (exts: [ exts.pass-otp ]);
        settings = {
          PASSWORD_STORE_DIR = "$XDG_CONFIG_HOME/password-store";
        };
      };

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
