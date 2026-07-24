{
  config,
  lib,
  ...
}:
{
  imports = [
    ./opencode
    ./pi-agent
  ];
  options = {
    custom.assistants.enable = lib.mkEnableOption "Enable coding assistants";
  };
  config = lib.mkIf config.custom.assistants.enable {
    custom.assistants.pi-agent.enable = lib.mkDefault true;
  };
}
