{ lib, config, ... }:
{
  config = lib.mkIf config.programs.nushell.enable {
    programs.nushell = {
      configFile.source = ./config.nu;
      envFile.source = ./env.nu;
      loginFile.source = ./login.nu;
    };
    xdg.configFile."nushell/libs" = {
      source = ./libs;
      recursive = true;
    };
  };
}
