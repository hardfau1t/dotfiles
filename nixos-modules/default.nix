{
  pkgs,
  lib,
  config,
  ...
}:
{
  imports = [
    ./services
    ./applications
    ./gui
  ];
  options = {
    host_name = lib.mkOption {
      type = lib.types.str;
      default = "nixos";
      description = "host name for the system";
    };
    main_user = lib.mkOption {
      type = lib.types.str;
      description = "main user of this system";
    };
  };
  config = {

    time.timeZone = "Asia/Kolkata";

    # Select internationalisation properties.
    i18n.defaultLocale = "en_IN";
    custom.gui.enable = true;

    documentation = {
      dev.enable = true;
      man = {
        cache = {
          enable = false;
          generateAtRuntime = true;
        };
        man-db.enable = true;
      };
      nixos.includeAllModules = true;
    };

    networking = {
      hostName = config.host_name;
      firewall = {
        enable = false;
      };
      wireless = {
        iwd.enable = lib.mkDefault true;
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
        enable = false;
      };
    };
    systemd = {
      network = {
        enable = true;
        wait-online.enable = false;
      };
    };

    programs = {
      nano.enable = false;
      nix-ld = {
        enable = true;
        libraries = with pkgs; [
          stdenv.cc.cc
          libpulseaudio
          gtk3
          alsa-lib
          libX11
          libxcb
          libXext
          libXrandr
          libXcomposite
          libXcursor
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
      bandwhich.enable = true;
    };
    environment = {
      etc.hosts.enable = false;
      localBinInPath = true;
      systemPackages = with pkgs; [
        android-tools
        brightnessctl
        eza
        ffmpeg
        file
        gcc
        iw
        jmtpfs
        lsof
        man-pages
        man-pages-posix
        neovim
        nethogs
        tcpdump
        unzip
        usbutils
        wget
      ];
    };
    fonts.packages = with pkgs; [
      nerd-fonts.symbols-only
      maple-mono.NF
    ];

    nix.settings.experimental-features = [
      "nix-command"
      "flakes"
    ];
    # Some programs need SUID wrappers, can be configured further or are
    # started in user sessions.
    # programs.mtr.enable = true;
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
    boot = {
      initrd.systemd.network.wait-online = {
        enable = false;
        timeout = 0;
      };

    };
  };
}
