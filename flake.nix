{
  description = "Simple Haskell Project";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs =
    { nixpkgs, flake-utils, ... }:
    flake-utils.lib.eachDefaultSystem (
      system:
      let
        pkgs = import nixpkgs { inherit system; };
      in
      {
        devShells.default =
          with pkgs;
          mkShell {
            buildInputs = [
              cabal-install
            ];

            packages = [
              haskell.compiler.ghc984
              haskellPackages.fourmolu
              haskellPackages.haskell-language-server
            ];

            shellHook = '''';
          };
      }
    );
}
