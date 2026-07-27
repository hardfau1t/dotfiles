{
  config,
  lib,
  unstable,
  ...
}:
let
  pi = unstable.pi-coding-agent;
in
{
  options = {
    custom.assistants.pi-agent.enable = lib.mkEnableOption "Enable coding assistants";
  };
  config = lib.mkIf config.custom.assistants.pi-agent.enable {
    home.packages = with unstable; [
      pi-coding-agent
      nodejs
      eslint
    ];
    xdg.configFile."pi/settings.json".source =
      config.lib.file.mkOutOfStoreSymlink "${config.dots_dir}/homemanager-modules/cli_apps/assistants/pi-agent/settings.json";
    xdg.configFile."pi/models.json".source =
      config.lib.file.mkOutOfStoreSymlink "${config.dots_dir}/homemanager-modules/cli_apps/assistants/pi-agent/models.json";
    home.sessionVariables = {
      PI_CODING_AGENT_DIR = "${config.xdg.configHome}/pi";
      PI_CODING_AGENT_SESSION_DIR = "${config.xdg.stateHome}/pi";
      PI_PACKAGE_DIR = "${pi}/lib/node_modules/pi-monorepo/";
    };
  };
}
