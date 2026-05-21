{
  lib,
  config,
  pkgs,
  ...
}:
{
  options = {
    custom.openssl.enable = lib.mkEnableOption "Enable openssl library for development and adds it to pkg-config";
  };
  config = lib.mkIf config.custom.openssl.enable {
    home = {
      packages = [ pkgs.openssl ];
      sessionVariables = {
        PKG_CONFIG_PATH = "${lib.getDev pkgs.openssl}/lib/pkgconfig";
      };
    };
  };
}
