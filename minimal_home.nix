{
  pkgs, ...
}:
let
  user = "";
in
{
  imports = [
    ./homemanager-modules
  ];
  home.username = "${user}";
  home.homeDirectory = "/home/${user}";
  dots_dir = "/home/${user}/.dots/";

  home.stateVersion = "24.05"; # Please read the comment before changing.

  gui_apps.enable = false;
  wallpapers.enable = false;
    home.packages = with pkgs; [
      home-manager
    ];
}
