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
  dots_dir = "/home/${user.name}/.dots/";
  home.homeDirectory = "/home/${user.name}";

  home.stateVersion = "24.05"; # Please read the comment before changing.

  home.packages =
    with pkgs;
    [
      thunderbird
      projectlibre
      openvpn
      # (freecad-wayland.override { ifcSupport = true; })
    ]
    ++ [inputs.angband.packages.${system}.angband-gcu]
     ++ [ (inputs.nixpkgs_pinned_freecad.legacyPackages.${system}.freecad-wayland.override { ifcSupport = true; }) ];

  services.mpd.enable = true;
  # wayland.windowManager.hyprland.enable = false;
  containers-storage = "/mnt/storage/podman/${user.name}/";
  gui_apps.enable = true;
  wallpapers.enable = true;
}
