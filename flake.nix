{
  description = "A very basic flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-25.11";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };



  outputs = { self, nixpkgs, home-manager, ...  } @inputs:
  let
  pkgs = nixpkgs.legacyPackages.x86_64-linux;

  # CHANGE THESE VALUES TO APPLY SYSTEMWIDE
  hostName = "nixy";
  mainUser = "nyxSeal";
  gitUsername = "nyxSeal";
  gitEmail = "litigate_putdown.zigzagged008@slmails.com";
  
  in {

    nixosConfigurations.hostName = nixpkgs.lib.nixosSystem { # replace nixy for hostName if different

      specialArgs = { 
        inherit inputs;

        global = {
          hostName = hostName;
          mainUser = mainUser;
          gitUsername = gitUsername;
          gitEmail = gitEmail;
        };

      };

      modules = [
        ./configuration.nix
      ];

    };

    homeConfigurations.mainUser = home-manager.lib.homeManagerConfiguration {
      inherit pkgs;

      modules = [
        ./home.nix
      ];
    };

  };



}
