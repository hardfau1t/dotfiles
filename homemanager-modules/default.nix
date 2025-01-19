{ lib, ... }:
{
  imports = [
    ./gui_apps
    ./xdg.nix
    ./scripts.nix
    ./wallpaper
    ./cli_apps
  ];
  options = {
    gui_apps.enable = lib.mkEnableOption "Enable gui applicaions, not required if you just use ssh";
    cli_apps.enable = lib.mkEnableOption "Enable cli applicaions";
    scripts.enable = lib.mkEnableOption "Enable custom scripts, which will get placed in ~/.local/bin";
    wallpapers.enable = lib.mkEnableOption "place wallpapers in specific path so that other applications can find it";
  };
  config = {
    gui_apps.enable = lib.mkDefault true;
    cli_apps.enable = lib.mkDefault true;
    scripts.enable = lib.mkDefault true;
    wallpapers.enable = lib.mkDefault true;
  };
}
