{ lib, config, ... }:
{
  imports = [
    ./nushell
    ./mpd.nix
    ./podman
  ];
  options = {

  };
  config = lib.mkIf config.cli_apps.enable {
    programs = {
      nushell.enable = lib.mkDefault true;
      carapace.enable = lib.mkDefault true;
    };
    services = {
      mpd.enable = lib.mkDefault false;
      udiskie.enable = lib.mkDefault true;
    };
    xdg.enable = true;
    # this is required, otherwise udiskie will not start
    systemd.user.targets.tray = {
      Unit = {
        Description = "Home Manager System Tray";
        Requires = [ "graphical-session-pre.target" ];
      };
    };
  };
}
