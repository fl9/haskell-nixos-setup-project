# Setup script for Haskell projects using Nix

Just a small script for basic Haskell project setup. Autocompletion should work with VSCode and the [ghcide](https://marketplace.visualstudio.com/items?itemName=DigitalAssetHoldingsLLC.ghcide) plugin, see also `make ide` in `Makefile`. An alternative VSCode plugin to ghcide is [Haskell for Visual Studio Code](https://marketplace.visualstudio.com/items?itemName=haskell.haskell) which automatically downloads and installs `haskell-language-server`. It is assumed that GNU Make is installed but it should be straightforward to run `make` inside `nix-shell` if this is your preference.

## Get started

`./setup.sh your-project-name`

This creates a folder `~/dev/your-project-name`, copies some files over and creates cabal project.
See `Makefile` for available tasks.


