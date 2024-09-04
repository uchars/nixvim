local ok, _ = pcall(require, "treesitter")
local compiler_found = vim.fn.executable("gcc") == 1 or vim.fn.executable("clang") == 1
if not ok or not compiler_found then
  return
end

local function remove_if_clang_not_installed(langs)
  if vim.fn.executable("clang") == 1 then
    return langs
  end
  return {}
end

require("treesitter-context").setup({})

require("nvim-treesitter.configs").setup({
  -- Autoinstall languages that are not installed. Defaults to false (but you can change for yourself!)
  ensure_installed = remove_if_clang_not_installed({
    "go",
    "c",
    "cpp",
    "lua",
    "markdown",
    "markdown_inline",
    "python",
    "rust",
    "tsx",
    "javascript",
    "typescript",
    "vimdoc",
    "vim",
    "html",
    "make",
    "sql",
    "css",
  }),
  auto_install = false,

  autotag = {
    enable = true,
  },
  highlight = { enable = true },
  indent = { enable = true },
  incremental_selection = {
    enable = true,
    keymaps = {
      init_selection = "<c-space>",
      node_incremental = "<c-space>",
      scope_incremental = "<c-s>",
      node_decremental = "<M-space>",
    },
  },
  playground = {
    enable = true,
  },
})
