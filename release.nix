let
  # pin nixpkgs
  inherit (import <nixpkgs> {}) fetchFromGitHub;
  nixpkgs = fetchFromGitHub {
    owner  = "NixOS";
    repo   = "nixpkgs-channels";
    rev    = "9480bae337095fd24f61380bce3174fdfe926a00";
    sha256 = "1n5bnnral5w60kf68d9jvs7px1w3hx53d8pyg9yxkf1s2n3791j2";
  };
  pkgs = import nixpkgs {};
  haskellPackages = pkgs.haskell.packages.ghc883;
in
  haskellPackages.callPackage ./default.nix { }
