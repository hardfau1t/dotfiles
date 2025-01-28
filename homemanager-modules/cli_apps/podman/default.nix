{ lib, config, osConfig ? {}, ... }:
{
  options = {
    containers-storage = lib.mkOption {
      type = lib.types.str;
    };
  };
  config = lib.mkIf (osConfig ? virtualisation.podman.enable && config ? containers-storage ) {
    xdg.configFile."containers/storage.conf".text = ''
      [storage]
      driver = "overlay"
      graphroot = "${config.containers-storage}"
    '';
  };
}
