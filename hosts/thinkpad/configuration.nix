# Edit this configuration file to define what should be installed on
# your system. Help is available in the configuration.nix(5) man page, on
# https://search.nixos.org/options and in the NixOS manual (`nixos-help`).

{
  pkgs,
  inputs,
  config,
  ...
}:
let
  main_user = "gireesh";
in
{
  imports = [
    # Include the results of the hardware scan.
    ./hardware-configuration.nix
    ../../nixos-modules
    inputs.home-manager.nixosModules.default
  ];
  inherit main_user;

  # Use the systemd-boot EFI boot loader.
  boot = {
    loader = {
      systemd-boot.enable = true;
      efi.canTouchEfiVariables = true;
    };
    tmp.cleanOnBoot = true;
  };

  # Pick only one of the below networking options.
  services = {
    tlp.enable = true;
    sshd.enable = true;
    devmon.enable = true;
    printing.enable = true;
    libinput.enable = true;

    ollama.enable = false;

    pipewire.enable = true;
    home-assistant.enable = true;

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

  };
  users.groups = {
    ${main_user} = {
      gid = 1000;
    };
  };

  users.users.${main_user} = {
    isNormalUser = true;
    uid = 1000;
    extraGroups = [
      "${main_user}"
      "wheel"
      "video"
      "audio"
      "mpd"
      "podman"
    ];
    shell = pkgs.nushell;
  };

  home-manager = {
    extraSpecialArgs = {
      inherit inputs;
      user = config.users.users.${main_user};
    };
    useGlobalPkgs = true;
    backupFileExtension = "bkp";
    users = {
      ${main_user} = import ./home.nix;
    };
  };

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
    device = "/dev/VG_0/home";
    fsType = "ext4";
  };
 "/drives/storage" = {
    device = "/dev/VG_0/storage";
    fsType = "ext4";
  };
    "/boot" = {
      device = "/dev/sdb1";
      fsType = "vfat";
      options = [ "rw" ];
    };
  };
  swapDevices = [
    {
      device = "/swapfile";
      size = 4 * 1024;
    }
  ];
  fonts.packages = with pkgs; [
    nerd-fonts.symbols-only
    maple-mono-NF
  ];
  virtualisation = {
    # docker = {
    #   enable = true;
    #   daemon.settings = {
    #     data-root = "/mnt/storage/docker";
    #   };
    # };
    #podman = {
    #  enable = true;
    #  defaultNetwork.settings.dns_enabled = true;
    #  dockerCompat = true;
    #  dockerSocket.enable = true;
    #};
  };
}
