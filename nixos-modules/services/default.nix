{
  ...
}:
{

  imports = [
    ./ollama.nix
    ./pipewire.nix
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
