{ lib, config, ... }:
{
  imports = [ ./nushell ];
  options = {

  };
  config = lib.mkIf config.cli_apps.enable {
    programs = {
      nushell.enable = lib.mkDefault true;
      carapace.enable = lib.mkDefault true;
    };
    xdg.enable = true;
  };
}
