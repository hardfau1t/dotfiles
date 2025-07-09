{
  lib,
  config,
  ...
}:
{
  config = lib.mkIf config.services.ollama.enable {
    services.ollama = {
      acceleration = "rocm";
      user = "ollama";
      home = "/mnt/storage/ollama";
    };
    users.users.${config.main_user}.extraGroups = ["ollama"];
  };

}
