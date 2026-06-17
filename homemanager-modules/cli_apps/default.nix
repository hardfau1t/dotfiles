{
  lib,
  config,
  pkgs,
  ...
}:
{
  imports = [
    ./git.nix
    ./mpd.nix
    ./mscout.nix
    ./opencode
    ./openssl.nix
    ./playerctl.nix
    ./podman
    ./typst.nix
  ];
  options = {

  };
  config = lib.mkIf config.cli_apps.enable {
    home.packages = with pkgs; [
      ani-cli
      aria2
      autotools-language-server
      bash-language-server
      bat
      bottom
      carapace
      clang-tools
      dos2unix
      dust
      eza
      fd
      fzf
      gdb
      gnumake
      lemminx
      lua-language-server
      lua51Packages.lua # for neovim
      lua51Packages.luarocks # for neovim
      maple-mono.NF
      moreutils # for vipe
      nerd-fonts.symbols-only
      nethogs
      nil
      nixfmt-rfc-style
      nmap
      noto-fonts
      pkg-config
      protols
      ripgrep
      ruff
      rustup
      socat
      sqlite
      starship
      taplo
      tealdeer
      tokei
      tree-sitter # for neovim
      ty
      uv
      vhdl-ls
      vscode-json-languageserver
      yaml-language-server
      yt-dlp
      zellij
      zenity
      zip

      (neovim.override {
        extraMakeWrapperArgs = ''--suffix LD_LIBRARY_PATH : "${pkgs.stdenv.cc.cc.lib}/lib"'';
      })
    ];
    programs = {
      nushell = {
        enable = true;
        plugins = with pkgs.nushellPlugins; [
          formats
          polars
          semver
        ];
      };
      password-store = {
        enable = true;
        package = pkgs.pass.withExtensions (exts: [ exts.pass-otp ]);
        settings = {
          PASSWORD_STORE_DIR = "$XDG_CONFIG_HOME/password-store";
        };
      };

    };
    home = {
      sessionVariables = {
        CARGO_HOME = "${config.xdg.dataHome}/cargo";
        RUSTUP_HOME = "${config.xdg.dataHome}/rustup";
      };
      sessionPath = [
        "$CARGO_HOME/bin"
        "$RUSTUP_HOME/bin"
      ];
    };
    services = {
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
