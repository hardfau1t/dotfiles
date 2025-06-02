{
  description = "A very basic flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nixpkgs_pinned.url = "github:nixos/nixpkgs?ref=dda3dcd3fe03e991015e9a74b22d35950f264a54";
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
      packages = nixpkgs.legacyPackages.${system};
    in
    {
      nixosConfigurations = {
        vayavya = nixpkgs.lib.nixosSystem {
          specialArgs = { inherit inputs; };
          modules = [
            ./hosts/vayavya/configuration.nix
            ./nixos-modules
          ];
        };
        thinkpad = nixpkgs.lib.nixosSystem {
          specialArgs = { inherit inputs; };
          modules = [
            ./hosts/thinkpad/configuration.nix
            ./nixos-modules
          ];
        };
      };

      homeManagerModules.default = ./homemanager-modules;

      homeConfigurations = {
        bare_home = home-manager.lib.homeManagerConfiguration {
          pkgs = packages;
          modules = [
            ./hosts/bare_home/home.nix
          ];
        };
      };
    };
}
