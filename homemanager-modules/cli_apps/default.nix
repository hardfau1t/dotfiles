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
  ];
  options = {

  };
  config = lib.mkIf config.cli_apps.enable {
    home.packages =
      with pkgs;
      [
        autotools-language-server
        ani-cli
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
        lua-language-server
        lua51Packages.lua # for neovim
        lua51Packages.luarocks # for neovim
        moreutils # for vipe
        neovim
        nethogs
        nil
        nixfmt-rfc-style
        nmap
        nodePackages.vscode-json-languageserver

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
        uv
        vhdl-ls
        yaml-language-server
        yt-dlp
        zellij
        zenity
        zip
        nerd-fonts.symbols-only
        maple-mono.NF
        noto-fonts
      ]
      ++ [ unstable.nushellPlugins.polars ];
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
