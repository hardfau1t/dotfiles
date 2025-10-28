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
      logind = {
        lidSwitchExternalPower = "ignore";
        lidSwitchDocked = "ignore";
      };
    };
  };
}
