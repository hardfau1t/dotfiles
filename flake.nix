{
  description = "A very basic flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-25.11";
    home-manager = {
      url = "github:nix-community/home-manager?ref=release-25.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nixpkgs_unstable.url = "github:nixos/nixpkgs";
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
      pkgs = import inputs.nixpkgs { inherit system; };
    in
    {
      homeModules = ./homemanager-modules;
      nixosModules = ./nixos-modules;

      homeManagerModules.default = ./homemanager-modules;

      homeConfigurations = {
        bare_home = home-manager.lib.homeManagerConfiguration {
          extraSpecialArgs = {
            unstable = unstable_packages;
          };
          pkgs = pkgs;
          modules = [
            ./minimal_home.nix
          ];
        };
      };
    };
}
