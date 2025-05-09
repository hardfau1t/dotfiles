{
  pkgs,
  user,
  inputs,
  ...
}:
let
  system = "x86_64-linux";
in
{
  imports = [
    ../../homemanager-modules
  ];
  home.username = "${user.name}";
  home.homeDirectory = "/home/${user.name}";

  home.stateVersion = "24.05"; # Please read the comment before changing.

  home.packages =
    with pkgs;
    [
      yt-dlp
      wesnoth
      angband
      openvpn
      # (freecad-wayland.override { ifcSupport = true; })
    ]
     ++ [ (inputs.nixpkgs_pinned.legacyPackages.${system}.freecad-wayland.override { ifcSupport = true; }) ];

  services.mpd.enable = true;
  # wayland.windowManager.hyprland.enable = false;
  containers-storage = "/mnt/storage/podman/${user.name}/";
  gui_apps.enable = true;
  wallpapers.enable = true;
}
