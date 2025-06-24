{ lib, config, ... }:
lib.mkIf config.programs.waybar.enable {
  xdg.configFile."waybar" = {
    source = config.lib.file.mkOutOfStoreSymlink "${config.dots_dir}/homemanager-modules/gui_apps/waybar/configs";
    recursive = true;
  };
  programs = {
    waybar = {
      systemd.enable = true;
      systemd.target = "graphical-session.target";
    };
  };
}
