{
  description = "Neovim derivation";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-23.05";
    flake-utils.url = "github:numtide/flake-utils";

    transparent-nvim = {
      url = "github:xiyaowong/transparent.nvim";
      flake = false;
    };

    blankline-nvim = {
      url = "github:lukas-reineke/indent-blankline.nvim";
      flake = false;
    };

    colorizer-nvim = {
      url = "github:norcalli/nvim-colorizer.lua";
      flake = false;
    };
  };

  outputs = inputs@{ self, nixpkgs, flake-utils, ... }:
    let
      supportedSystems =
        [ "x86_64-linux" "aarch64-linux" "x86_64-darwin" "aarch64-darwin" ];

      # This is where the Neovim derivation is built.
      neovim-overlay = import ./nix/neovim-overlay.nix { inherit inputs; };
    in flake-utils.lib.eachSystem supportedSystems (system:
      let
        pkgs = import nixpkgs {
          inherit system;
          overlays = [ neovim-overlay ];
        };
        shell = pkgs.mkShell {
          name = "nvim-devShell";
          buildInputs = with pkgs; [
            lua-language-server
            nil
            stylua
            luajitPackages.luacheck
          ];
        };
      in {
        packages = rec {
          default = nvim;
          nvim = pkgs.nvim-pkg;
        };
        devShells = { default = shell; };
      }) // {
        # You can add this overlay to your NixOS configuration
        overlays.default = neovim-overlay;
      };
}
