{
  description = "The default flake used in all configurations";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

  };



  outputs = { self, nixpkgs, home-manager, ...  } @inputs:
  let
  pkgs = nixpkgs.legacyPackages.x86_64-linux;

  

  in {

    nixosConfigurations."${hostName}" = nixpkgs.lib.nixosSystem {
 
      specialArgs = { 
        inherit inputs;
      };

      modules = [
        ./

        home-manager.nixosModules.home-manager
        {
          home-manager = {
            useGlobalPkgs = true;
            useUserPackages = true;
            home = {
              username = "${mainUser}";
              homeDirectory = "/home/${mainUser}";
              stateVersion = "25.11";
            };
            programs.home-manager.enable = true;
            #users."${mainUser}" = import ./../home-manager/home.nix;
          };
        }
      ];

    };

  };



}
