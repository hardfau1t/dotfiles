{
  lib,
  ...
}:
{

  imports = [
    ./ollama.nix
    ./pipewire.nix
    ./homeassistant.nix
  ];
  config = {
    services = {
      tlp.enable = lib.mkDefault true;
      sshd.enable = lib.mkDefault true;
      devmon.enable = true;
      printing.enable = true;
      libinput.enable = true;

      ollama.enable = lib.mkDefault false;
      logind = {
        lidSwitchExternalPower = "ignore";
        lidSwitchDocked = "ignore";
      };
    };
  };
}
