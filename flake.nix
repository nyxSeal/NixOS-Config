{
  description = "A very basic flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-25.11";

    # if adding another input: make sure to add 'inputs.nixpkgs.follows = "nixpkgs";'
    # this sacrifices a bit of reproducibility for not having to download another branch
    # you can change "nixpkgs" at the end for any of the inputs (for example, if you had an input named 'unstable' that linked to the unstable branch, you could link an input to the unstable branch instead of stable)
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
