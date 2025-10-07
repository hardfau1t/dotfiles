{
  lib,
  config,
  pkgs,
  ...
}:
lib.mkIf config.services.dunst.enable {
  xdg.configFile."dunst/dunstrc".source =
    config.lib.file.mkOutOfStoreSymlink "${config.dots_dir}/homemanager-modules/gui_apps/dunst/dunstrc";
  home.packages = [
    pkgs.sound-theme-freedesktop
    # this script is used in dustrc to play the sound everytime notification is recieved
    (pkgs.writeShellScriptBin "play-notification-sound" "pw-play ${pkgs.sound-theme-freedesktop}/share/sounds/freedesktop/stereo/complete.oga")
  ];
}
