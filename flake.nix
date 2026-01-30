{
  description = "A very basic flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-25.11";
  };

  outputs = { self, nixpkgs, global } @inputs:
  let
  pkgs = nixpkgs.legacyPackages.x86_64-linux;
  in {
    nixosConfigurations.${global.hostName} = nixpkgs.lib.nixosSystem {

      specialArgs = { 
        inherit inputs;

        global = {
          hostName = "nixy";
          mainUser = "nyxSeal";
          gitUsername = "nyxSeal";
          gitEmail = "litigate_putdown.zigzagged008@slmails.com";
        };

      };

      modules = [
        ./configuration.nix
      ];

    };    
  };
}
