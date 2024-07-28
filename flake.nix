{
  description = "The SDDM Theme";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    utils.url = "github:numtide/flake-utils";
  };

  outputs = { self, nixpkgs, utils, ... } @ inputs: utils.lib.eachSystem [
    "x86_64-linux"
  ] (system: let
    pkgs = import nixpkgs { inherit system; };
  in rec {
    packages.default = pkgs.kdePackages.callPackage ./package.nix { };
  });
}
