{
  config,
  lib,
  pkgs,
  ...
}:
lib.mkIf config.audio.enable {
  services = {
    playerctld.enable = true;
    mpris-proxy.enable = true;
  };
  programs.mpv.scripts = [ pkgs.mpvScripts.mpris ];
}
