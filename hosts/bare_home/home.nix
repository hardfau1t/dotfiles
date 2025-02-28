{
  ...
}:
let
  user = "";
in
{
  imports = [
    ../../homemanager-modules
  ];
  home.username = "${user}";
  home.homeDirectory = "/home/${user}";

  home.stateVersion = "24.05"; # Please read the comment before changing.

  gui_apps.enable = false;
  wallpapers.enable = false;
}
