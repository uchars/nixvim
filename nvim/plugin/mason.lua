local ok, _ = pcall(require, "mason")
local ok_lsp, mason_lsp = pcall(require, "mason-lspconfig")
local ok_formatter, mason_format = pcall(require, "mason-null-ls")
if not ok and not ok_lsp and not ok_formatter then
	return
end

local py_installed = vim.fn.executable("python") == 1 or vim.fn.executable("python3") == 1
local go_installed = vim.fn.executable("go") == 1
local unzip_installed = vim.fn.executable("unzip") == 1
local cargo_installed = vim.fn.executable("cargo") == 1
local npm_installed = vim.fn.executable("npm") == 1
local is_windows = vim.fn.has("win32")
local ocaml_installed = vim.fn.executable("opam") == 1

local servers = {
	pyright = {},
	tsserver = {},
	bashls = {},
	marksman = {},
	html = { filetypes = { "html", "twig", "hbs" } },
	lua_ls = {
		Lua = {
			workspace = { checkThirdParty = false },
			telemetry = { enable = false },
		},
	},
}

local formatters = {}

if unzip_installed then
	servers.clangd = {}
end

if cargo_installed then
	servers.rust_analyzer = {}
	if not is_windows then
		print("IS LINUX")
		servers.nil_ls = {}
	end
end

if go_installed then
	servers.gopls = {}
	servers.sqls = {}
end

if py_installed then
	servers.cmake = {}
	formatters.autopep8 = {}
	formatters.clang_format = {}
end

if npm_installed then
	formatters.stylua = {}
	formatters.prettierd = {}
	servers.dockerls = {}
end

if ocaml_installed then
	formatters.ocamlformat = {}
	servers.ocamllsp = {}
end

mason_lsp.setup({
	ensure_installed = vim.tbl_keys(servers),
})

mason_format.setup({
	ensure_installed = vim.tbl_keys(formatters),
})
