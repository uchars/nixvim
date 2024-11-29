{
  imports = [
    ./lastplace.nix
    ./colorizer.nix
    ./zen.nix
    ./vimtex.nix
    ./surround.nix
    ./markdown-preview.nix
    ./options.nix
    ./neogen.nix
    ./format.nix
    ./harpoon.nix
    ./comment.nix
    ./cmp.nix
    ./treesitter.nix
    ./lsp.nix
    ./git.nix
    ./telescope.nix
    ./oil.nix
    ./keymaps.nix
    ./transparent.nix
  ];

  colorschemes.gruvbox.enable = true;
  globals.mapleader = " ";
}
