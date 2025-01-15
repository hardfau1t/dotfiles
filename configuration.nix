# Edit this configuration file to define what should be installed on
# your system. Help is available in the configuration.nix(5) man page, on
# https://search.nixos.org/options and in the NixOS manual (`nixos-help`).

{ pkgs, inputs, ... }:

{
  imports = [
    # Include the results of the hardware scan.
    ./hardware-configuration.nix
    inputs.home-manager.nixosModules.default
  ];

  # Use the systemd-boot EFI boot loader.
  boot = {
    loader = {
      systemd-boot.enable = true;
      efi.canTouchEfiVariables = true;
    };
    tmp.cleanOnBoot = true;
  };

  # Pick only one of the below networking options.
  networking = {
    hostName = "nixos"; # Define your hostname.
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

  # Set your time zone.
  time.timeZone = "Asia/Kolkata";

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_IN";
  # console = {
  #   font = "Lat2-Terminus16";
  #   keyMap = "us";
  #   useXkbConfig = true; # use xkb.options in tty.
  # };
  users.groups = {
    gireesh = {
      gid = 1001;
    };
  };

  users.users.gireesh = {
    isNormalUser = true;
    uid = 1000;
    extraGroups = [
      "gireesh"
      "wheel"
      "video"
      "audio"
      "mpd"
      "docker"
      "ollama"
    ];
    shell = pkgs.nushell;
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
    hyprland.enable = true;
    hyprland.xwayland.enable = false;
    light.enable = true;
    hyprlock.enable = true;
  };
  services = {
    tlp.enable = true;
    sshd.enable = true;
    devmon.enable = true;
    printing.enable = true;
    libinput.enable = true;

    ollama = {
      enable = true;
      acceleration = "rocm";
      user = "ollama";
    };

    pipewire = {
      enable = true;
      pulse.enable = true;
    };

    minidlna = {
      enable = true;
      settings = {
        media_dir = [
          "/home/gireesh/Videos/demon-slayer"
          "/home/gireesh/Videos/haikyu"
          "/home/gireesh/Videos/attock-on-titan"
          "/media/"
          "/media/attack-on-titan"
        ];
      };
      openFirewall = true;
    };
    logind = {
      lidSwitchExternalPower = "ignore";
      lidSwitchDocked = "ignore";
    };
    _3proxy = {
      enable = true;
      services = [
        {
          type = "socks";
          auth = [ "strong" ];
          acl = [
            {
              rule = "allow";
              users = [ "test1" ];
            }
          ];
        }
      ];
      usersFile = "/etc/3proxy.passwd";
    };

  };

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
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

  home-manager = {
    extraSpecialArgs = {inherit inputs;};
    users = {
      "gireesh" = import ./home.nix;
    };
  };

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

  # This option defines the first version of NixOS you have installed on this particular machine,
  # and is used to maintain compatibility with application data (e.g. databases) created on older NixOS versions.
  #
  # Most users should NEVER change this value after the initial install, for any reason,
  # even if you've upgraded your system to a new NixOS release.
  #
  # This value does NOT affect the Nixpkgs version your packages and OS are pulled from,
  # so changing it will NOT upgrade your system - see https://nixos.org/manual/nixos/stable/#sec-upgrading for how
  # to actually do that.
  #
  # This value being lower than the current NixOS release does NOT mean your system is
  # out of date, out of support, or vulnerable.
  #
  # Do NOT change this value unless you have manually inspected all the changes it would make to your configuration,
  # and migrated your data accordingly.
  #
  # For more information, see `man configuration.nix` or https://nixos.org/manual/nixos/stable/options#opt-system.stateVersion .
  system.stateVersion = "24.05"; # Did you read the comment?

  fileSystems = {
    "/home" = {
      device = "/dev/sda2";
      fsType = "ext4";
    };
    "/boot" = {
      device = "/dev/nvme0n1p6";
      fsType = "vfat";
      options = [ "rw" ];
    };
  };
  swapDevices = [
    {
      device = "/swapfile";
      size = 6 * 1024;
    }
  ];
  fonts.packages = with pkgs; [
    (nerdfonts.override { fonts = [ "NerdFontsSymbolsOnly" ]; })
    maple-mono-NF
  ];
  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];
  hardware.bluetooth.enable = true;
  hardware.bluetooth.powerOnBoot = true;
  powerManagement.cpuFreqGovernor = "ondemand";
  virtualisation.docker.enable = true;
}
