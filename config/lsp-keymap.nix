{
  plugins.lsp.keymaps.lspBuf = {
    "gd" = "definition";
    "gr" = "references";
    "gt" = "type_definition";
    "gi" = "implementation";
    "K" = "hover";
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
}
