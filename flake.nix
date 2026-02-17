{
  description = "A very basic flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    plasma-manager = {
     url = "github:nix-community/plasma-manager";
     inputs.nixpkgs.follows = "nixpkgs";
     inputs.home-manager.follows = "nixpkgs";
    };

  };



  outputs = { self, nixpkgs, home-manager, plasma-manager, ...  } @inputs:
  let
  pkgs = nixpkgs.legacyPackages.x86_64-linux;

  mainUser = "nyxSeal";

  in {

    nixosConfigurations.nixy = nixpkgs.lib.nixosSystem { # change nixy for a different host name if needed

      specialArgs = { 
        inherit inputs;

        global = {
          hostName = "nixy";
          mainUser = "${mainUser}";
          gitUsername = "nyxSeal";
          gitEmail = "litigate_putdown.zigzagged008@slmails.com";
        };

      };

      modules = [
        ./configuration.nix

        home-manager.nixosModules.home-manager
        {
          home-manager = {
            useGlobalPkgs = true;
            useUserPackages = true;
            sharedModules = [ plasma-manager.homeModules.plasma-manager ];
            users."${mainUser}" = import ./home.nix;
          };
        }
      ];

    };

  };



}
