{
  description = "My nvim config as a nix flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    nixvim.url = "github:nix-community/nixvim";
    flake-utils.url = "github:numtide/flake-utils";
    flake-parts.url = "github:hercules-ci/flake-parts";
  };

  outputs =
    {
      nixpkgs,
      nixvim,
      flake-utils,
      flake-parts,
      ...
    }@inputs:
    flake-parts.lib.mkFlake { inherit inputs; } {
      systems = [
        "x86_64-linux"
        "aarch64-linux"
        "x86_64-darwin"
        "aarch64-darwin"
      ];
      perSystem =
        { system, ... }:
        let
          overlays = [ ];
          nixvimLib = nixvim.lib.${system};
          nixvim' = nixvim.legacyPackages.${system};
          homeModule = {
            inherit pkgs;
            module =
              { pkgs, ... }:
              {
                imports = [
                  ./config
                  ./config/home
                ];
                extraPackages = [ ];
              };
            extraSpecialArgs = { };
          };
          serverModule = {
            inherit pkgs;
            module =
              { pkgs, ... }:
              {
                imports = [
                  ./config
                  ./config/server
                ];
                extraPackages = [ ];
              };
            extraSpecialArgs = { };
          };
          pkgs = import inputs.nixpkgs {
            inherit system overlays;
            config.allowUnfree = true;
          };
          homeNvim = nixvim'.makeNixvimWithModule homeModule;
          serverNvim = nixvim'.makeNixvimWithModule serverModule;
        in
        {
          checks = {
            default = nixvimLib.check.mkTestDerivationFromNixvimModule homeModule;
          };
          packages = {
            default = homeNvim;
            server = serverNvim;
          };
        };
    };
}
