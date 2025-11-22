{ lib, config, ... }:
lib.mkIf config.networking.useNetworkd {
  systemd.services."systemd-networkd" = {
    serviceConfig = {
      Environment = "SYSTEMD_LOG_LEVEL=${config.services.systemd-networkd.log_level}";
    };
  };
}
