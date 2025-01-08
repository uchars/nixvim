{ pkgs, ... }:
{

  plugins.none-ls.sources.formatting = {
    nixfmt = {
      enable = true;
      package = pkgs.nixfmt-rfc-style;
    };
    stylua.enable = true;
    yamlfmt = {
      enable = true;
    };
    hclfmt.enable = true;
  };

  plugins.lsp.servers = {
    clangd.enable = true;
    pyright.enable = true;
    texlab.enable = true;
    gopls.enable = true;
    html.enable = true;
    nixd.enable = true;
    rust_analyzer = {
      enable = true;
      installRustc = true;
      installCargo = true;
    };
    zls.enable = true;
    lua_ls.enable = true;
    cssls.enable = true;
    ocamllsp = {
      enable = true;
      package = pkgs.ocamlPackages.ocaml-lsp;
    };
    hls = {
      enable = true;
      installGhc = true;
      package = pkgs.haskell-language-server.override { supportedGhcVersions = [ "948" ]; };
      autostart = true;
    };
    jsonls.enable = true;
    cmake.enable = true;
  };

}
