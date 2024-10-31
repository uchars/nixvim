{
  plugins.fugitive = {
    enable = true;
  };
  plugins.gitsigns = {
    enable = true;
  };

  keymaps = [
    {
      mode = "n";
      key = "<leader>gs";
      action = "<CMD>Git<CR>";
    }
  ];
}
