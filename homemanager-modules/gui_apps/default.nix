{
  lib,
  config,
  osConfig,
  pkgs,
  inputs,
  ...
}:
let
  zen = inputs.zen-browser.packages.x86_64-linux.specific;
in
{
  imports = [
    ./dunst
    ./waybar
    # ./zen.nix
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
    ] ++ [zen];
  };
}
