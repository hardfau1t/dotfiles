{
  pkgs,
  user,
  inputs,
  ...
}:
let
  system = "x86_64-linux";
  custom_freecad = pkgs.freecad-wayland.overrideAttrs {
    buildInputs = pkgs.freecad-wayland.buildInputs ++ [ pkgs.python311Packages.ifcopenshell ];
  };
in
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
    yt-dlp
    wesnoth
    # custom_freecad
  ]
    ++ [inputs.angband.packages.${system}.angband-gcu]
  ;

  programs = {
    waybar = {
      enable = true;
      systemd.enable = true;
      systemd.target = "graphical-session.target";
    };
  };
  services.mpd.enable = true;
  # wayland.windowManager.hyprland.enable = false;
  containers-storage = "/mnt/storage/podman/${user.name}/";
  gui_apps.enable = true;
  audio.enable = true;
  wallpapers.enable = true;
}
