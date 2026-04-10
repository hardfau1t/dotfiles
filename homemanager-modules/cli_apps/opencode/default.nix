{
  lib,
  config,
  unstable,
  ...
}:

{
  options.programs.opencode.apiKeys = {
    go = lib.mkOption {
      type = lib.types.nullOr lib.types.str;
      default = null;
      description = "API key for OpenCode Go";
      example = "sk-xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx";
    };
  };

  config = lib.mkIf config.programs.opencode.enable {
    programs.opencode = {
      package = unstable.opencode;
      enableMcpIntegration = true;
      agents = { };
      commands = { };
      rules = "";
      settings = {
        model = "opencode-go/glm-5";
        autoupdate = false;
        permission.bash = "ask";
        watcher.ignore = [ ".git/**" ];
      };
    };
    xdg.configFile."opencode/tui.json".source = ./tui.json;

    home.sessionVariables = {
      OPENCODE_CONFIG = "${config.xdg.configHome}/opencode/config.json";
      OPC_GO_API_KEY = config.programs.opencode.apiKeys.go;
    };
  };
}
