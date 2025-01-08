{ pkgs, ... }:
{
  plugins = {
    lsp = {
      enable = true;
      servers = {
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
          enable = false;
          installGhc = true;
          package = pkgs.haskell-language-server.override { supportedGhcVersions = [ "948" ]; };
          autostart = true;
        };
        jsonls.enable = true;
        cmake.enable = true;
      };
      keymaps.lspBuf = {
        "gd" = "definition";
        "gr" = "references";
        "gt" = "type_definition";
        "gi" = "implementation";
        "K" = "hover";
      };
    };
  };

  keymaps = [

    {
      mode = "n";
      key = "<leader>rn";
      action.__raw = "vim.lsp.buf.rename";
    }

    {
      mode = "n";
      key = "<leader>ca";
      action.__raw = "vim.lsp.buf.code_action";
    }

    {
      mode = "n";
      key = "]E";
      action.__raw = ''
        function()
          vim.diagnostic.goto_next({
            severity = vim.diagnostic.severity.ERROR,
          })
        end
      '';
    }

    {
      mode = "n";
      key = "[E";
      action.__raw = ''
        function()
          vim.diagnostic.goto_prev({
            severity = vim.diagnostic.severity.ERROR,
          })
        end
      '';
    }

    {
      mode = "n";
      key = "]e";
      action.__raw = "vim.diagnostic.goto_next";
    }

    {
      mode = "n";
      key = "[e";
      action.__raw = "vim.diagnostic.goto_prev";
    }

    {
      mode = "n";
      key = "[d";
      action.__raw = "vim.diagnostic.goto_prev";
    }

    {
      mode = "n";
      key = "]d";
      action.__raw = "vim.diagnostic.goto_next";
    }

    {
      mode = "n";
      key = "<leader>vd";
      action.__raw = "vim.diagnostic.open_float";
    }

    {
      mode = "n";
      key = "<leader>e";
      action.__raw = "vim.diagnostic.open_float";
    }

    {
      mode = "n";
      key = "<leader>q";
      action.__raw = "vim.diagnostic.setloclist";
    }

  ];

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
}
