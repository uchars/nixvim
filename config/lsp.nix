{ ... }:
{
  plugins = {
    lsp = {
      enable = true;
      servers = {
        clangd.enable = true;
        pyright.enable = true;
        elixirls.enable = true;
        gopls.enable = true;
        nixd.enable = true;
        rust_analyzer.enable = true;
        lua_ls.enable = true;
        hls.enable = true;
        jsonls.enable = true;
        dockerls.enable = true;
        cmake.enable = true;
      };
      keymaps.lspBuf = {
        "gd" = "definition";
        "gD" = "references";
        "gt" = "type_definition";
        "ca" = "code_action";
        "gi" = "implementation";
        "K" = "hover";
      };
    };
  };

  keymaps = [

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
  };

  plugins = {
    trouble.enable = true;
  };
}
