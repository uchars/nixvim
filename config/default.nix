{
  imports = [
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
  ];

  clipboard.register = "unnamedplus";
  colorschemes.cyberdream.enable = true;
  globals.mapleader = " ";
}
