{
  lib,
  config,
  pkgs,
  ...
}:
{
  imports = [
    ./mpd.nix
    ./podman
    ./mscout.nix
  ];
  options = {

  };
  config = lib.mkIf config.cli_apps.enable {
    home.packages = with pkgs; [
      ani-cli
      aria2
      bash-language-server
      bat
      bottom
      carapace
      clang-tools
      dust
      eza
      fd
      fzf
      gdb
      gnumake
      lua-language-server
      lua51Packages.lua # for neovim
      lua51Packages.luarocks # for neovim
      moreutils # for vipe
      neovim
      nil
      nixfmt-rfc-style
      nodePackages.vscode-json-languageserver
      nushellPlugins.polars
      nushell

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
      vhdl-ls
      zellij
      zip
      nerd-fonts.symbols-only
      maple-mono.NF
      noto-fonts
    ];
    home.sessionVariables = {
      LD_LIBRARY_PATH = pkgs.lib.makeLibraryPath [ pkgs.openssl ];
    };
    programs = {
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
