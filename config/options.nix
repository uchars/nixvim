{ lib, pkgs, ... }:
{
  config.extraConfigLuaPre = ''
    vim.api.nvim_create_user_command("W", function()
      vim.cmd("w")
    end, { nargs = 0 })
    vim.api.nvim_create_autocmd("BufWritePre", {
      pattern = "*",
      command = "%s/\\s\\+$//e",
    })
    vim.api.nvim_create_autocmd("TextYankPost", {
      callback = function()
        vim.highlight.on_yank()
      end,
      pattern = "*",
    })
    vim.keymap.set("x", "<leader>p", [["_dP]])
    vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]])
    vim.keymap.set("n", "<leader>Y", [["+Y]])
  '';

  config.opts = {
    updatetime = 100; # Faster completion

    hlsearch = false;

    spell = true;
    spelllang = [
      "en_us"
    ];

    number = true;
    relativenumber = true;
    splitbelow = true;
    splitright = true;
    scrolloff = 4;

    autoindent = true;
    expandtab = true;
    shiftwidth = 2;
    smartindent = true;
    tabstop = 2;

    ignorecase = true;
    incsearch = true;
    smartcase = true;
    wildmode = "list:longest";

    swapfile = false;
    undofile = true;

    termguicolors = lib.mkForce pkgs.stdenv.isLinux;

    statusline = "[%{FugitiveHead()}] %f%m%= %{&fileencoding?&fileencoding:&encoding}[%{&fileformat}]%y %3p%% %4l:%3c";
  };
}
