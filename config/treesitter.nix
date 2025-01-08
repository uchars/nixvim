{ pkgs, ... }:
{
  plugins = {
    treesitter = {
      enable = true;
      nixGrammars = true;
      settings = {
        highlight.enable = true;
        indent.enable = true;
        parser_install_dir = "~/.local/share/treesitter";
      };
    };
    treesitter-context = {
      enable = true;
      settings = {
        max_lines = 2;
      };
    };
    rainbow-delimiters.enable = true;
    ts-autotag.enable = true;
  };
}
