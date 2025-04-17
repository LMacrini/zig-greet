{
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
    zig-overlay.url = "github:bandithedoge/zig-overlay";
    systems.url = "github:nix-systems/default";
  };

  outputs = { self, nixpkgs, zig-overlay, systems }: let
      eachSystem = nixpkgs.lib.genAttrs (import systems);
    in {

      devShells = eachSystem (system: {
        default = import ./shell.nix {
          pkgs = import nixpkgs {inherit system;};
          zig = zig-overlay.packages.${system};
      };
    });

  };
}
