{
  lib,
  config,
  pkgs,
  ...
}:

{
  options.custom.gui.enable = lib.mkEnableOption "Enable gui ex. hyprland with uwsm";

  imports = [ ./hyprland ];
  config = lib.mkIf config.custom.gui.enable {
    programs.hyprland.enable = lib.mkDefault true;
    programs.uwsm.enable = true;
  };
}
