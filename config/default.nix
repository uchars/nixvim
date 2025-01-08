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
    ./lsp-keymap.nix
    ./git.nix
    ./telescope.nix
    ./oil.nix
    ./keymaps.nix
    ./transparent.nix
  ];

  plugins.lsp.enable = true;

  plugins.fidget = {
    enable = true;
    notification = {
      window = {
        winblend = 0;
      };
    };
  };

  plugins = {
    trouble.enable = true;
  };

  colorschemes.gruvbox.enable = true;
  globals.mapleader = " ";
}
