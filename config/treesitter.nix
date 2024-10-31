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
        ensure_installed = [
          "c"
          "cpp"
          "rust"
          "nix"
          "json"
          "cmake"
          "make"
          "python"
          "gitcommit"
          "gitignore"
          "git_config"
          "git_rebase"
        ];
      };
    };
    treesitter-context = {
      enable = true;
      settings = {
        max_lines = 2;
      };
    };
    rainbow-delimiters.enable = true;
  };
}
