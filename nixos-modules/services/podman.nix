{
  lib,
  config,
  ...
}:
lib.mkIf config.virtualisation.podman.enable {
  config.virtualisation = {
    oci-containers.backend = "podman";
    podman = {
      defaultNetwork.settings.dns_enabled = lib.mkDefault true;
      dockerCompat = lib.mkDefault true;
      dockerSocket.enable = lib.mkDefault true;
    };
  };
}
