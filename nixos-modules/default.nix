{
  pkgs,
  lib,
  config,
  ...
}:
{
  imports = [
    ./services
  ];
  options = {
    host_name = lib.mkOption {
      type = lib.types.str;
      default = "nixos";
    };
    main_user = lib.mkOption {
      type = lib.types.str;
    };
  };
  config = {

    time.timeZone = "Asia/Kolkata";

    # Select internationalisation properties.
    i18n.defaultLocale = "en_IN";
    # Configure network proxy if necessary
    # networking.proxy.default = "http://user:password@proxy:port/";
    # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

    console = {
      keyMap = "dvorak";
    };
    networking = {
      hostName = config.host_name; # Define your hostname.
      firewall = {
        enable = true;
        allowedTCPPorts = [
          22
          8080
        ];
      };
      wireless = {
        iwd.enable = true;
        userControlled = {
          enable = true;
        };
        networks = {
          ap2 = {
            psk = "jatre123";
          };
          vlabs = {
            psk = "Vayavay@2024_BGM@#12345#";
          };
        };
      };
      useNetworkd = true;
      nftables = {
        enable = true;
      };
    };
    systemd = {
      network = {
        enable = true;
      };
    };

    programs = {
      nano.enable = false;
      nix-ld = {
        enable = true;
        libraries = with pkgs; [
          libpulseaudio
        ];
      };
      gnupg.agent = {
        enable = true;
        pinentryPackage = pkgs.pinentry-gtk2;
        settings = {
          max-cache-ttl = 86400;
          default-cache-ttl = 900;
        };
      };
      adb.enable = true;
      bandwhich.enable = true;
      firefox = {
        enable = true;
        languagePacks = [
          "en-US"
          "kn"
        ];
      };
      light.enable = true;
      uwsm = {
        enable = true;
        waylandCompositors = {
          hyprland = {
            prettyName = "Hyprland";
            binPath = "/run/current-system/sw/bin/Hyprland";
          };
        };
      };
    };
    environment = {
      systemPackages = with pkgs; [
        eza
        ffmpeg
        file
        gcc
        git
        neovim
        nixfmt-rfc-style
        nushell
        unzip
        wget
      ];
    };

    nix.settings.experimental-features = [
      "nix-command"
      "flakes"
    ];
    # Some programs need SUID wrappers, can be configured further or are
    # started in user sessions.
    # programs.mtr.enable = true;
    programs.hyprland = {
      enable = true;
      withUWSM = true;
    };
    programs.hyprlock.enable = true;
    # programs.gnupg.agent = {
    #   enable = true;
    #   enableSSHSupport = true;
    # };

    # List services that you want to enable:

    # Enable the OpenSSH daemon.
    # services.openssh.enable = true;

    # system.copySystemConfiguration = true;
    hardware.bluetooth.enable = true;
    hardware.bluetooth.powerOnBoot = true;
    powerManagement.cpuFreqGovernor = "ondemand";
    boot.initrd.systemd.network.wait-online.timeout = 5;
  };
}
