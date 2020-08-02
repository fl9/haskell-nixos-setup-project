#!/bin/sh

devdir=~/dev
projectdir=$devdir/$1
setupdir=$(dirname $(pwd)/$0)

mkdir $projectdir
cp $setupdir/{Makefile,default.nix,release.nix,shell.nix} $projectdir
cd $projectdir
nix-shell --pure --run "cabal init"
make build

