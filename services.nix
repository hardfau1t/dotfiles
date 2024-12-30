{ ... }:
{
  services = {
    mpd = {
      musicDirectory = "/run/media/gireesh/loud/music";
      enable = true;
      network.port = 6600;
      extraConfig = ''
        bind_to_address  "/run/user/1000/mpd.socket"
        bind_to_address "any"
          audio_output {
            type "pipewire"
            name "My PipeWire Output"
          }
      '';
    };
    udiskie.enable = true;
  };
}
