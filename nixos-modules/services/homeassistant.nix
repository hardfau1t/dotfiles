{
  lib,
  config,
  ...
}:
{
  config = lib.mkIf config.services.home-assistant.enable {
    services.home-assistant.config = {
    };
  };
}
