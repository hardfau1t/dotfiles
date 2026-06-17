{
  config,
  lib,
  pkgs,
  ...
}:

let
  typst = pkgs.rustPlatform.buildRustPackage (finalAttrs: {
    pname = "typst";
    version = "0.14.2";
    src = pkgs.fetchFromGitHub {
      owner = "typst";
      repo = "typst";
      rev = "64720d459129f4e5561c3bd0519bdfaef034b208";
      hash = "sha256-BCt/sBy57ESs5W/Q9nyXm9J9RvHzFWKxfJbJ6p/WVjI=";
      leaveDotGit = true;
      postFetch = ''
        cd $out
        git rev-parse HEAD > COMMIT
        rm -rf .git
      '';
    };

    cargoHash = "sha256-m0Uiax21Ggbe472SSRq24vnx/m9iLh9FbwU0CTXueBo=";

    nativeBuildInputs = [
      pkgs.installShellFiles
      pkgs.pkg-config
    ];

    buildInputs = [
      pkgs.openssl
    ];

    env = {
      GEN_ARTIFACTS = "artifacts";
      OPENSSL_NO_VENDOR = true;
      TYPST_COMMIT_SHA = "64720d4";
    };

    # Fix for "Found argument '--test-threads' which wasn't expected, or isn't valid in this context"
    postPatch = ''
      substituteInPlace tests/src/tests.rs --replace-fail \
        'ARGS.num_threads' \
        'ARGS.test_threads'
      substituteInPlace tests/src/args.rs --replace-fail \
        'num_threads' \
        'test_threads'
    '';

    postInstall = ''
      installManPage crates/typst-cli/artifacts/*.1
      installShellCompletion \
        crates/typst-cli/artifacts/typst.{bash,fish} \
        --zsh crates/typst-cli/artifacts/_typst
    '';

    cargoTestFlags = [ "--workspace" ];

    doInstallCheck = true;
    nativeInstallCheckInputs = [ pkgs.versionCheckHook ];
    versionCheckProgramArg = "--version";

    passthru = {
      updateScript = pkgs.nix-update-script { };
      packages = pkgs.callPackage ./typst-packages.nix { };
      withPackages = pkgs.callPackage ./with-packages.nix { };
    };

    meta = {
      changelog = "https://github.com/typst/typst/releases/tag/v${finalAttrs.version}";
      description = "New markup-based typesetting system that is powerful and easy to learn";
      homepage = "https://github.com/typst/typst";
      license = lib.licenses.asl20;
      mainProgram = "typst";
      maintainers = with lib.maintainers; [
        kanashimia
        RossSmyth
      ];
    };
  });

in
{
  options.custom.typst.enable = lib.mkEnableOption "Enable typst and its echo system";

  config = lib.mkIf config.custom.typst.enable {
    home.packages =
      with pkgs;
      [
        tinymist
        typship
        typstyle
      ]
      ++ [ typst ];
  };
}
