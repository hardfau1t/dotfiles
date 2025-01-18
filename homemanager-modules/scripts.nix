{ lib, config, ... }:
{
  config = lib.mkIf config.scripts.enable {

    home.file = {
      ".local/bin" = {
        source = ./scripts;
        recursive = true;
        executable = true;
      };
    };
  };
}
