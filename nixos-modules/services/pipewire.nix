{
  lib,
  config,
  ...
}:
{
  config = lib.mkIf config.services.pipewire.enable {
    services.pipewire = {
      pulse.enable = true;
      alsa.enable = true;
    };
  };

}
