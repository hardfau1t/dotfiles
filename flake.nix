{
  description = "A very basic flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-25.05";
    home-manager = {
      url = "github:nix-community/home-manager?ref=release-25.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nixpkgs_pinned_freecad.url = "github:nixos/nixpkgs?ref=dda3dcd3fe03e991015e9a74b22d35950f264a54";
    nixpkgs_unstable.url = "github:nixos/nixpkgs";
    mscout = {
      url = "github:hardfau1t/mscout";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    zen-browser = {
      url = "github:youwen5/zen-browser-flake";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    angband = {
      url = "github:hardfau1t/angband";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    {
      self,
      nixpkgs,
      home-manager,
      nixpkgs_unstable,
      ...
    }@inputs:
    let
      system = "x86_64-linux";
      unstable_packages = import nixpkgs_unstable { system = system; };
    in
    {
      nixosConfigurations = {
        work = nixpkgs.lib.nixosSystem {
          specialArgs = {
            inherit inputs;
            unstable = unstable_packages;
          };
          modules = [
            ./hosts/work/configuration.nix
            ./nixos-modules
          ];
        };
        thinkpad = nixpkgs.lib.nixosSystem {
          specialArgs = {
            inherit inputs;
            unstable = unstable_packages;
          };
          modules = [
            ./hosts/thinkpad/configuration.nix
            ./nixos-modules
          ];
        };
      };

      homeManagerModules.default = ./homemanager-modules;

      homeConfigurations = {
        bare_home = home-manager.lib.homeManagerConfiguration {
          pkgs = unstable_packages;
          modules = [
            ./hosts/bare_home/home.nix
          ];
        };
      };
    };
}
