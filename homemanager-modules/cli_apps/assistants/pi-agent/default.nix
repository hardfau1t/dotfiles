{
  config,
  lib,
  pkgs,
  ...
}:
{
  options = {
    custom.assistants.pi-agent.enable = lib.mkEnableOption "Enable coding assistants";
  };
  config = lib.mkIf config.custom.assistants.pi-agent.enable {
    home.packages = [pkgs.pi-coding-agent];
  };
}
