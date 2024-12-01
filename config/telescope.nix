{
  plugins.web-devicons.enable = true;

  plugins.telescope = {
    enable = true;
    settings = {
      defaults = {
        file_ignore_patterns = [
          ".git/"
          ".cache/"
        ];
        theme = "ivy";
        previewer = true;
        prompt_prefix = "-> ";
        layout_strategy = "bottom_pane";
        layout_config = {
          height = 0.3;
          prompt_position = "top";
        };
        borderchars = [
          "-"
          ""
          ""
          ""
          ""
          ""
          ""
          ""
        ];
      };
      pickers = {
        colorscheme = {
          enable_preview = true;
        };
        live_grep = {
          hidden = true;
        };
        find_files = {
          hidden = true;
        };
      };
    };
  };

  keymaps = [

    {
      mode = "n";
      key = "<C-p>";
      action = "<CMD>Telescope find_files<CR>";
    }

    {
      mode = "n";
      key = "<leader><space>";
      action = "<CMD>Telescope buffers<CR>";
    }

    {
      mode = "n";
      key = "<leader>gf";
      action = "<CMD>Telescope git_files<CR>";
    }

    {
      mode = "n";
      key = "<leader>gb";
      action = "<CMD>Telescope git_branches<CR>";
    }

    {
      mode = "n";
      key = "<leader>gc";
      action = "<CMD>Telescope git_commits<CR>";
    }

    {
      mode = "n";
      key = "<leader>?";
      action = "<CMD>Telescope oldfiles<CR>";
    }

    {
      mode = "n";
      key = "<leader>fh";
      action = "<CMD>Telescope help_tags<CR>";
    }

    {
      mode = "n";
      key = "<C-f>";
      action = "<CMD>Telescope live_grep<CR>";
    }

  ];
}
