{ lib, pkgs, ... }:
{
  plugins.conform-nvim = {
    enable = true;
    settings = {
      default_format_opts.lsp_format = "fallback";
      formatters_by_ft = {
        "_" = [
          "squeeze_blanks"
          "trim_whitespace"
          "trim_newlines"
        ];
        nix = [ "nixfmt-rfc-style" ];
      };
      format_on_save = {
        lspFallback = true;
        timeoutMs = 500;
      };
      formatters = {
        squeeze_blanks = {
          command = lib.getExe' pkgs.coreutils "cat";
        };
      };
    };
  };

  plugins.lsp-format = {
    enable = true;
  };

  plugins.none-ls = {
    enable = true;
    enableLspFormat = true;
    settings = {
      updateInInsert = false;
    };
    sources = {
      formatting = {
        nixfmt = {
          enable = true;
          package = pkgs.nixfmt-rfc-style;
        };
        prettierd.enable = true;
        stylua.enable = true;
        yamlfmt = {
          enable = true;
        };
        hclfmt.enable = true;
      };
    };
  };
}
