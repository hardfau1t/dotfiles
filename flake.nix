{
  description = "A very basic flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    mscout = {
      url = "github:hardfau1t/mscout";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    { self, nixpkgs, ... }@inputs:
    let
      system = "x86_64-linux";
      packages = nixpkgs.legacyPackages.${system};
    in
    {
      nixosConfigurations.vayavya = nixpkgs.lib.nixosSystem {
        specialArgs = { inherit inputs; };
        modules = [
          ./hosts/vayavya/configuration.nix
          ./nixos-modules
        ];
      };
      homeManagerModules.default = ./homemanager-modules;

    };
}
