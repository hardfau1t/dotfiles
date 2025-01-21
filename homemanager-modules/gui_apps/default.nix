{ lib, config, osConfig, ... }:
{
  imports = [];
  options = { };
  config = lib.mkIf config.gui_apps.enable {
    services.hyprpaper.enable = lib.mkDefault osConfig.programs.hyprland.enable;
  };
}
