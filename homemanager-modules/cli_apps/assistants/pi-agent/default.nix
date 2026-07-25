{
  config,
  lib,
  unstable,
  ...
}:
# let
#   pi = pkgs.pi-coding-agent.overrideAttrs (
#     final: prev: rec {
#       version = "0.82.0";
#       src = pkgs.fetchFromGitHub {
#         owner = "earendil-works";
#         repo = "pi";
#         tag = "v${version}";
#         hash = "sha256-oKm0nyGmRY6rlQGMODB8DteMTVUUMroy/YXPphoxrvY=";
#       };
#       npmDeps = pkgs.fetchNpmDeps {
#         inherit src;
#         # Use a fake hash here first, let the build fail to get the real one
#         hash = "sha256-3oqrN/uguYfkUHlfmKGxnLIvUo484IMGlydz6p9o/Dw="; 
#       };
#     }
#   );
# in
{
  options = {
    custom.assistants.pi-agent.enable = lib.mkEnableOption "Enable coding assistants";
  };
  config = lib.mkIf config.custom.assistants.pi-agent.enable {
    home.packages = with unstable; [
      pi-coding-agent
      nodejs
    ];
  };
}
