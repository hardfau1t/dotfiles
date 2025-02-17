{
  pkgs,
  user,
  config,
  ...
}:
let
  custom_freecad = pkgs.freecad-wayland.overrideAttrs {
    buildInputs = pkgs.freecad-wayland.buildInputs ++ [ pkgs.python311Packages.ifcopenshell ];
  };
in
{
  imports = [
    ../../homemanager-modules
  ];
  home.username = "${user.name}";
  home.homeDirectory = "/home/${user.name}";

  home.stateVersion = "24.05"; # Please read the comment before changing.

  home.packages = with pkgs; [
    yt-dlp
    wesnoth
    angband
    # custom_freecad
  ];

  services.mpd.enable = true;
  # wayland.windowManager.hyprland.enable = false;
  containers-storage = "/mnt/storage/podman/${user.name}/";
  gui_apps.enable = true;
  wallpapers.enable = true;
}
