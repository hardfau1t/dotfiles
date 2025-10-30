{
  description = "A very basic flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-25.05";
    home-manager = {
      url = "github:nix-community/home-manager?ref=release-25.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };
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
      ...
    }@inputs:
    let
      system = "x86_64-linux";
      unstable_packages = import inputs.nixpkgs_unstable { inherit system; };
      angband = inputs.angband.packages.${system}.angband-gcu;
    in
    {
      nixosConfigurations = {
        work = nixpkgs.lib.nixosSystem {
          specialArgs = {
            inherit inputs angband;
            unstable = unstable_packages;
          };
          modules = [
            ./hosts/work/configuration.nix
            ./nixos-modules
          ];
        };
        thinkpad = nixpkgs.lib.nixosSystem {
          specialArgs = {
            inherit inputs angband;
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
