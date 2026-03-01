{

  description = "Flake to rebuild configuration with main user configs";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
  };


  outputs = { pkgs, lib, config, ... }: {

    nixosConfigurations."${hostName.option}" = nixpkgs.lib.nixosSystem {

     modules = {
       ./defaults.nix
     };

  }






}
