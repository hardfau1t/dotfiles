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
  };

}
