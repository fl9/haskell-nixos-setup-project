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
  project = import ./release.nix;
in
pkgs.stdenv.mkDerivation {
  name = "shell";
  buildInputs = project.env.nativeBuildInputs ++ [
    haskellPackages.cabal-install haskellPackages.stylish-haskell
  ];
  # see https://github.com/mpickering/hie-bios/issues/25#issuecomment-554657282
  shellHook = ''
    export NIX_GHC="${project.env.NIX_GHC}"
    export NIX_GHCPKG="${project.env.NIX_GHCPKG}"
    export NIX_GHC_DOCDIR="${project.env.NIX_GHC_DOCDIR}"
    export NIX_GHC_LIBDIR="${project.env.NIX_GHC_LIBDIR}"
  '';
}
