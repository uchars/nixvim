{ pkgs, ... }:
{

  plugins.lsp.servers = {
    nixd.enable = true;
  };

  plugins.none-ls.sources.formatting = {
    nixfmt = {
      enable = true;
      package = pkgs.nixfmt-rfc-style;
    };
  };

  plugins.treesitter.settings.ensure_installed = [
    "nix"
    "json"
    "gitcommit"
  ];

}
