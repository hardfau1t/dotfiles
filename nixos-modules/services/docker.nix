{
  lib,
  config,
  ...
}:
lib.mkIf config.virtualisation.docker.enable {
  config.virtualisation = {
    oci-containers.backend = "docker";
  };
}
