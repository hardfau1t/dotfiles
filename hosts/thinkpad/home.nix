{
  pkgs,
  user,
  angband,
  ...
}:
{
  imports = [
    ../../homemanager-modules
  ];
  home.username = "${user.name}";
  dots_dir = "/home/${user.name}/.dots/";
  home.homeDirectory = "/home/${user.name}";

  home.stateVersion = "24.05"; # Please read the comment before changing.

  home.packages = with pkgs; [
    gmetronome
    wesnoth
    # custom_freecad
  ]
    ++ [angband]
  ;

  services.mpd.enable = true;
  # wayland.windowManager.hyprland.enable = false;
  containers-storage = "/mnt/storage/podman/${user.name}/";
  gui_apps.enable = true;
  audio.enable = true;
  wallpapers.enable = true;
}
