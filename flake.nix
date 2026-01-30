{
  description = "A very basic flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-25.11";
  };

  outputs = { self, nixpkgs } @inputs:
  let
  pkgs = nixpkgs.legacyPackages.x86_64-linux;
  in {
    nixosConfigurations.nixy = nixpkgs.lib.nixosSystem { # replace nixy for hostName if different

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
