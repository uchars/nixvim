{
  plugins.neogen = {
    enable = true;
    keymapsSilent = true;
  };

  keymaps = [
    {
      mode = "n";
      key = "<leader>ng";
      action = "<CMD>lua require('neogen').generate({})<CR>";
    }
  ];
}
