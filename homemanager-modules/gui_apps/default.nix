{
  lib,
  config,
  osConfig,
  pkgs,
  ...
}:
{
  imports = [
    ./dunst
    ./waybar
    ./zen.nix
  ];
  options = { };
  config = lib.mkIf config.gui_apps.enable {
    services.hyprpaper.enable = lib.mkDefault osConfig.programs.hyprland.enable;
    services.dunst.enable = lib.mkDefault osConfig.programs.hyprland.enable;
    programs.waybar.enable = lib.mkDefault osConfig.programs.hyprland.enable;
    home.packages = with pkgs; [
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
    ];
  };
}
