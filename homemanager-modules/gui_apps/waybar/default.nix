{ lib, config, ... }:
lib.mkIf config.programs.waybar.enable {
  xdg.configFile."waybar" = {
    source = ./configs;
    recursive = true;
  };
  programs = {
    waybar = {
      systemd.enable = true;
      systemd.target = "graphical-session.target";
    };
  };
}
