{ lib, config, osConfig, ... }:
{
  imports = [./dunst];
  options = { };
  config = lib.mkIf config.gui_apps.enable {
    services.hyprpaper.enable = lib.mkDefault osConfig.programs.hyprland.enable;
    services.dunst.enable = lib.mkDefault osConfig.programs.hyprland.enable;
  };
}
