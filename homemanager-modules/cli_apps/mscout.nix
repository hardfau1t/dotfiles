{
  lib,
  inputs,
  config,
  ...
}:
let
  mpkg = inputs.mscout.packages.x86_64-linux.default;
in
lib.mkIf config.services.mpd.enable {
  home.packages = [ mpkg ];
  systemd.user.services.mscout = {
    enable = true;
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
      WantedBy = [ "graphical.target" ];
    };
  };
}
