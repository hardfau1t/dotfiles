{
  user,
  config,
  lib,
  pkgs,
  ...
}:
lib.mkIf config.services.mpd.enable {
  services = {
    mpd = {
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
  };
  home.packages = [ pkgs.mpc-cli ];
}
