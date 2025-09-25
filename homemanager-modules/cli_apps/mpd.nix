{
  user,
  config,
  lib,
  pkgs,
  ...
}:
lib.mkIf config.audio.enable {
  services = {
    mpd = {
      enable = true;
      musicDirectory = "/run/media/${user.name}/loud/music";
      network.port = 6600;
      extraConfig = ''
        bind_to_address  "/run/user/${toString user.uid}/mpd.socket"
        bind_to_address "any"
          audio_output {
            type "pipewire"
            name "My PipeWire Output"
          }
      '';
    };
    mpdris2 = {
      enable = true;
      multimediaKeys = true;
      notifications = true;
    };
  };
  home.packages = [ pkgs.mpc-cli ];
}
