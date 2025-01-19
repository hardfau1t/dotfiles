{ lib, config, ... }:
{
  imports = [
    ./nushell
    ./mpd.nix
  ];
  options = {

  };
  config = lib.mkIf config.cli_apps.enable {
    programs = {
      nushell.enable = lib.mkDefault true;
      carapace.enable = lib.mkDefault true;
    };
    services.mpd.enable = lib.mkDefault false;
    xdg.enable = true;
  };
}
