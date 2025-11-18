{
  pkgs,
  user,
  unstable,
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

  home.packages =
    with pkgs;
    [
      glab
      kicad
      openvpn
      projectlibre
      remmina
      thunderbird
    ]
    ++ [ angband ]
    ++ [ unstable.freecad ];

  services.mpd.enable = true;
  # wayland.windowManager.hyprland.enable = false;
  containers-storage = "/mnt/storage/podman/${user.name}/";
  gui_apps.enable = true;
  wallpapers.enable = true;
  audio.enable = true;
}
