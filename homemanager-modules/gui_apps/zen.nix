{ pkgs, ... }:
let
  zen_src = builtins.fetchurl {
    url = "https://github.com/zen-browser/desktop/releases/download/1.11.1b/zen-x86_64.AppImage";
    sha256 = "00qs7swb38iifw9v86iarax20i46ini7jwsm2x2533862pcnv1k8";
  };
  zen = pkgs.writeShellScriptBin "zen" ''
    appimage-run ${zen_src} $@
  '';

in
{
  config.home.packages = with pkgs; [
    appimage-run
    zen
  ];

}
