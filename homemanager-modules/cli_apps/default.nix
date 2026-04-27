{
  lib,
  config,
  pkgs,
  unstable,
  ...
}:
{
  imports = [
    ./mpd.nix
    ./playerctl.nix
    ./podman
    ./mscout.nix
    ./git.nix
    ./opencode
  ];
  options = {

  };
  config = lib.mkIf config.cli_apps.enable {
    home.packages =
      with pkgs;
      [
        autotools-language-server
        aria2
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
        moreutils # for vipe
        nethogs
        nil
        nixfmt-rfc-style
        nmap
        nodePackages.vscode-json-languageserver

        pkg-config
        ripgrep
        ruff
        rustup
        socat
        sqlite
        starship
        taplo
        tealdeer
        tokei
        uv
        vhdl-ls
        yaml-language-server
        zenity
        zip
        nerd-fonts.symbols-only
        maple-mono.NF
        noto-fonts
      ]
      ++ (with unstable; [
        lua-language-server
        lua51Packages.lua # for neovim
        lua51Packages.luarocks # for neovim
        (neovim.override {
          extraMakeWrapperArgs = ''--suffix LD_LIBRARY_PATH : "${pkgs.stdenv.cc.cc.lib}/lib"'';
        })
        ty
        tree-sitter # for neovim
        protols
        zellij
        yt-dlp
        ani-cli
      ]);
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
