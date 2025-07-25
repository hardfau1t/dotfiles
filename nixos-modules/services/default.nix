{
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
      nix-serve = {
        enable = true;
        secretKeyFile = "/var/cache-prive-key.pem";
      };
    };
  };
}
