{
  lib,
  config,
  ...
}:

lib.mkIf config.programs.hyprland.enable {
  programs = {
    hyprland.withUWSM = true;
    hyprlock.enable = true;
    # uwsm.waylandCompositors.hyprland = {
    #   binPath = lib.getExe pkgs.hyprland;
    # };
  };
}
