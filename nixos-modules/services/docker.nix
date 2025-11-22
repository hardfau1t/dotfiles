{
  lib,
  config,
  ...
}:
lib.mkIf config.virtualisation.podman.enable {
  config.virtualisation = {
    oci-containers.backend = "docker";
  };
}
