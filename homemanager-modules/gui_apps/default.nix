{
  lib,
  config,
  osConfig,
  pkgs,
  ...
}:
let
  zen_src = builtins.fetchurl {
    url = "https://github.com/zen-browser/desktop/releases/latest/download/zen-x86_64.AppImage";
    sha256 = "16k37ngl4qpqwwj6f9q8jpn20pk8887q8zc0l7qivshmhfib36qq";
  };
  zen = pkgs.writeShellScriptBin "zen" ''
    appimage-run ${zen_src}
  '';

in
{
  imports = [
    ./dunst
    ./waybar
  ];
  options = { };
  config = lib.mkIf config.gui_apps.enable {
    services.hyprpaper.enable = lib.mkDefault osConfig.programs.hyprland.enable;
    services.dunst.enable = lib.mkDefault osConfig.programs.hyprland.enable;
    programs.waybar.enable = lib.mkDefault osConfig.programs.hyprland.enable;
    home.packages = with pkgs; [
      appimage-run
      alacritty
      cliphist
      eww
      fuzzel
      grim
      hledger
      imagemagick
      imv
      libiconv
      libnotify
      mpv
      obs-studio
      pinentry-gtk2
      showmethekey
      slurp
      wl-clipboard
      hyprpicker
      zen
    ];
  };
}
