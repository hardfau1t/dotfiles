{
  lib,
  config,
  ...
}:
{

  imports = [
    ./ollama.nix
    ./pipewire.nix
    ./homeassistant.nix
    ./networkd.nix
  ];
  options.services.systemd-networkd.log_level = lib.mkOption {
    type = lib.types.str;
    default = "info";
    description = "set systemd-networkd log level";
  };
  config = {
    virtualisation.podman.enable = lib.mkDefault (!config.virtualisation.docker.enable);
    services = {
      tlp.enable = lib.mkDefault true;
      sshd.enable = lib.mkDefault true;
      pipewire.enable = lib.mkDefault true;
      devmon.enable = lib.mkDefault true;
      printing.enable = lib.mkDefault true;
      libinput.enable = lib.mkDefault true;

      ollama.enable = lib.mkDefault false;
      logind = {
        lidSwitchExternalPower = "ignore";
        lidSwitchDocked = "ignore";
      };
    };
  };
}
