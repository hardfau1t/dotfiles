{
  lib,
  config,
  unstable,
  ...
}:

{
  options.programs.opencode.apiKeys = {
    go = lib.mkOption {
      type = lib.types.str;
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
      settings = {
        model = "opencode-go/glm-5";
        autoupdate = false;
        permission.bash = {
          "*" = "ask";
          "git log *" = "allow";
          "git status *" = "allow";
          "git show *" = "allow";
          "grep *" = "allow";
          "head *" = "allow";
          "tail *" = "allow";
          "wc *" = "allow";
          "echo *" = "allow";
        };
        watcher.ignore = [ ".git/**" ];
      };
    };
    xdg.configFile."opencode/tui.json".source = ./tui.json;

    home.sessionVariables = {
      OPENCODE_CONFIG = "${config.xdg.configHome}/opencode/config.json";
    }
    // lib.optionalAttrs (config.programs.opencode.apiKeys.go != null) {
      OPC_GO_API_KEY = config.programs.opencode.apiKeys.go;
    };
  };
}
