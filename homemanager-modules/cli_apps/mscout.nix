{
  lib,
  inputs,
  config,
  pkgs,
  ...
}:
let
  mpkg = inputs.mscout.packages.${pkgs.system}.default;
in
lib.mkIf config.services.mpd.enable {
  home.packages = [ mpkg ];
  systemd.user.services.mscout = {
    Unit = {
      Description = "My Rust Application Service";
      After = [
        "network.target"
        "mpd.service"
      ];
    };

    Service = {
      ExecStart = "${mpkg}/bin/mscout -p \${XDG_RUNTIME_DIR}/mpd.socket --use-tags -vv listen -a \${HOME}/.local/bin/handle_mscout ";
      Restart = "on-failure";
      RestartSec = 5;
    };

    Install = {
      WantedBy = [ "graphical-session.target" ];
    };
  };
}
