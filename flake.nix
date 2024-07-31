{
  description = "The SDDM Theme";

  inputs = {
    nixpkgs.url = "nixpkgs/nixos-unstable";
    flake-compat = { url = "github:edolstra/flake-compat"; flake = false; };
  };

  outputs = { self, nixpkgs, ... } @ inputs:
  let
    forAllSystems = nixpkgs.lib.genAttrs [ "x86_64-linux" "aarch64-linux" ];

    nixpkgsFor = forAllSystems (system: import nixpkgs { inherit system; });
  in {
    packages = forAllSystems (system: {
      default = nixpkgsFor.${system}.kdePackages.callPackage ./package.nix {};
    });

    defaultPackage = forAllSystems (system: self.packages.${system}.default);
  };
}
