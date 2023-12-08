{ inputs }:
final: prev:
with final.pkgs.lib;
let
  pkgs = final;

  # Use this to create a plugin from an input
  mkNvimPlugin = src: pname:
    pkgs.vimUtils.buildVimPlugin {
      inherit pname src;
      version = src.lastModifiedDate;
    };

  mkNeovim = pkgs.callPackage ./mkNeovim.nix { };

  all-plugins = with pkgs.vimPlugins; [
    # lsp & formatting
    cmp-nvim-lsp
    nvim-lspconfig
    cmp-path
    cmp-buffer
    neodev-nvim
    nvim-cmp
    null-ls-nvim
    fidget-nvim
    lsp_signature-nvim

    # helpful
    copilot-vim
    luasnip
    markdown-preview-nvim
    nvim-web-devicons

    # ui
    nvim-treesitter.withAllGrammars
    playground
    onedark-nvim
    zen-mode-nvim

    # git
    fugitive
    git-blame-nvim
    gitsigns-nvim
    diffview-nvim

    plenary-nvim
    crates-nvim
    comment-nvim
    undotree
    surround
    oil-nvim
    harpoon
    telescope-nvim
    telescope-fzf-native-nvim

    (mkNvimPlugin inputs.transparent-nvim "transparent.nvim")
    # (mkNvimPlugin inputs.blankline-nvim "indent-blankline.nvim")
    (mkNvimPlugin inputs.colorizer-nvim "nvim-colorizer.lua")
  ];

  extraPackages = [
    # Language Servers
    pkgs.nil
    pkgs.gopls
    pkgs.nodePackages.typescript-language-server
    pkgs.clang-tools
    pkgs.pyright
    pkgs.marksman
    pkgs.cmake-language-server
    pkgs.nodePackages.bash-language-server
    pkgs.lua-language-server
    pkgs.nodePackages.vscode-html-languageserver-bin
    pkgs.nodePackages.vscode-langservers-extracted
  ] ++ [
    # Formatters
    pkgs.stylua
    pkgs.nixfmt
    pkgs.nodePackages.prettier
    pkgs.nodePackages.fixjson
    pkgs.nodePackages.markdownlint-cli
    pkgs.python310Packages.autopep8
  ];

in {
  nvim-pkg = mkNeovim {
    plugins = all-plugins;
    inherit extraPackages;
  };
}
