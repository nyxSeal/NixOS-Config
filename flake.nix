{
  description = "A very basic flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
  };

  outputs = { self, nixpkgs }:
  let
  unstablepkg = nixpkgs.legacyPackages.x86_64-linux;
  selfpkg = self.packages.x86_64-linux;
  in
  {
    packages.x86_64-linux.hello = unstablepkg.hello;

    packages.x86_64-linux.default = selfpkg.hello;
    
  };
}
