{ pkgs, ... }:
let
  zen_src = builtins.fetchurl {
    url = "https://github.com/zen-browser/desktop/releases/latest/download/zen-x86_64.AppImage";
    sha256 = "16k37ngl4qpqwwj6f9q8jpn20pk8887q8zc0l7qivshmhfib36qq";
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
