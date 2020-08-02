.PHONY: cabal2nix
cabal2nix:
	nix-shell --pure --packages cabal2nix --run "cabal2nix ." > default.nix

.PHONY: repl
repl: cabal2nix
	nix-shell --pure --run "cabal repl"

.PHONY: clean
clean:
	nix-shell --pure --run "cabal clean"

.PHONY: build
build: cabal2nix
	nix-shell --pure --run "cabal build"

.PHONY: run
run: build
	nix-shell --pure --run "cabal run insert-name-exe"

.PHONY: build-haddock
build-haddock: cabal2nix
	nix-shell --pure --run "cabal build --haddock-all"

.PHONY: ide
ide:
	nix-shell --run "code ."
