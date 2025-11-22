{
  pkgs,
  lib,
  config,
  ...
}:
let
  jlink = (
    pkgs.segger-jlink.overrideAttrs (
      final: prev: rec {
        version = "788";
        hash = "sha256-jifoR7Ac9ChkRB6CvpY1Hv9BhzTV7EA59log1v52YSM=";
        platform = "x86_64";
        url = "https://www.segger.com/downloads/jlink/JLink_Linux_V${version}_x86_64.tgz";
        src = pkgs.fetchurl {
          inherit url;
          inherit hash;
          curlOpts = "--data accept_license_agreement=accepted";
        };
        installPhase = prev.installPhase + ''
          mkdir -p $out/etc/
          mv $out/lib/udev $out/etc
        '';
      }
    )
  );
in
{

  options = {
    custom.jlink.enable = lib.mkEnableOption "custom install of jlink with udev";
  };

  config = lib.mkIf config.custom.jlink.enable {
    nixpkgs.config = {
      allowUnfree = true;
      permittedInsecurePackages = [ "segger-jlink-qt4-810" ];
      segger-jlink.acceptLicense = true;
    };
    services = {
      udev.packages = [ jlink ];
    };
  };
}
