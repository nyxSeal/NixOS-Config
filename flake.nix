{
  description = "A very basic flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-25.11";
  };

  outputs = { self, nixpkgs }:
  let
  pkgs = nixpkgs.legacyPackages.x86_64-linux;
  in {
    nixosConfigurations.nixy = nixpkgs.lib.nixosSystem {
      specialArgs = { inherit inputs; };

      modules = [
        ./configuration.nix
      ];

    };    
  };
}
