{
  keymaps = [

    {
      mode = "n";
      key = "k";
      action = "v:count == 0 ? 'gk' : 'k'";
      options =  { expr = true; silent = true; };
    }

    {
      mode = "n";
      key = "j";
      action = "v:count == 0 ? 'gj' : 'j'";
      options = { expr = true; silent = true; };
    }

    {
      mode = "n";
      key = "<C-d>";
      action = "<C-d>zz";
    }

    {
      mode = "n";
      key = "<C-u>";
      action = "<C-u>zz";
    }

    {
      mode = "v";
      key = "J";
      action = ":m '>+1<CR>gv=gv";
    }

    {
      mode = "v";
      key = "K";
      action = ":m '<-2<CR>gv=gv";
    }

    {
      mode = "n";
      key = "<C-k>";
      action = "<cmd>cnext<CR>zz";
    }

    {
      mode = "n";
      key = "<C-j>";
      action = "<cmd>cprev<CR>zz";
    }

    {
      mode = "n";
      key = "<C-s>";
      action = "<cmd>w<cr>";
    }

    {
      mode = "i";
      key = "<C-s>";
      action = "<cmd>w<cr>";
    }

    {
      mode = "n";
      key = "<C-h>";
      action = "<C-w>h";
    }

    {
      mode = "n";
      key = "<C-j>";
      action = "<C-w>j";
    }

    {
      mode = "n";
      key = "<C-k>";
      action = "<C-w>k";
    }

    {
      mode = "n";
      key = "<C-l>";
      action = "<C-w>l";
    }

    {
      mode = "n";
      key = ";a";
      action = "aä<ESC>";
    }

    {
      mode = "n";
      key = ";o";
      action = "aö<ESC>";
    }

    {
      mode = "n";
      key = ";u";
      action = "aü<ESC>";
    }

    {
      mode = "n";
      key = "<C-b>";
      action = "<cmd>:Ex<cr>";
    }

    {
      mode = "n";
      key = "<Left>";
      action = "gT";
    }
    {
      mode = "n";
      key = "<Right>";
      action = "gt";
    }

    {
      mode = "n";
      key = "<Up>";
      action = "<cmd>:bnext<cr>";
    }

    {
      mode = "n";
      key = "<Down>";
      action = "<cmd>:bprev<cr>";
    }

    {
      mode = "t";
      key = "<Esc>";
      action = "<C-\\><C-n>";
    }

  ];
}
