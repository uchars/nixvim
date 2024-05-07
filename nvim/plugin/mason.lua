local ok, mason = pcall(require, "mason")
local ok_lsp, mason_lsp = pcall(require, "mason-lspconfig")
if not ok and not ok_lsp then
  return
end

local py_installed = vim.fn.executable("python") == 1 or vim.fn.executable("python3") == 1
local go_installed = vim.fn.executable("go") == 1
local unzip_installed = vim.fn.executable("unzip") == 1
local cargo_installed = vim.fn.executable("cargo") == 1
local npm_installed = vim.fn.executable("npm") == 1

local servers = {
  pyright = {},
  nil_ls = {},
  tsserver = {},
  bashls = {},
  html = { filetypes = { 'html', 'twig', 'hbs' } },
  lua_ls = {
    Lua = {
      workspace = { checkThirdParty = false },
      telemetry = { enable = false },
    },
  },
}

if unzip_installed then
  servers.clangd = {}
end

if cargo_installed then
  servers.rust_analyzer = {}
end

if go_installed then
  servers.gopls = {}
end

if py_installed then
  servers.cmake = {}
end

mason_lsp.setup{
  ensure_installed = vim.tbl_keys(servers)
}
