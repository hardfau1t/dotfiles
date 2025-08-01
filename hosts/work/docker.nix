{
  lib,
  config,
  ...
}:
{
  config = lib.mkIf config.virtualisation.docker.enable {
    systemd.services = {
      docker = {
        wants = builtins.filter (s: s != "network-online.target") config.systemd.services.docker.wants;
        after = builtins.filter (s: s != "network-online.target") config.systemd.services.docker.after;
      };
    };
  };

}
