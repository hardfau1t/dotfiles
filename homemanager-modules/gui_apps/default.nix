{ lib, config, ... }:
{
  imports = [ ./hyprland];
  options = { };
  config = lib.mkIf config.gui_apps.enable {
    wayland.windowManager.hyprland.enable = lib.mkDefault true;
    services.hyprpaper.enable = lib.mkDefault config.wayland.windowManager.hyprland.enable;
  };
}
