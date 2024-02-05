vim.g.mapleader = ' '
-- Set highlight on search
vim.o.hlsearch = false

vim.o.scrolloff = 8

-- Make line numbers default
vim.wo.number = true
vim.wo.relativenumber = true

vim.o.tabstop = 2
vim.o.shiftwidth = 2
vim.o.expandtab = true

-- Enable mouse mode
vim.o.mouse = 'a'

-- Enable break indent
vim.o.breakindent = true
vim.opt.guicursor = ''

-- Save undo history
vim.opt.backup = false
vim.opt.undodir = vim.fn.stdpath('data') .. '/undodir'
vim.o.undofile = true
vim.o.swapfile = false

-- Case-insensitive searching UNLESS \C or capital in search
vim.o.ignorecase = true
vim.o.smartcase = true

-- Keep signcolumn on by default
vim.wo.signcolumn = 'yes'

-- Decrease update time
vim.o.updatetime = 50

-- Set completeopt to have a better completion experience
vim.o.completeopt = 'menuone,noselect'

-- NOTE: You should make sure your terminal supports this
vim.o.termguicolors = true

-- [[ Basic Keymaps ]]
vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })

-- Remap for dealing with word wrap
vim.keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

local highlight_group = vim.api.nvim_create_augroup('YankHighlight', { clear = true })
vim.api.nvim_create_autocmd('TextYankPost', {
  callback = function()
    vim.highlight.on_yank()
  end,
  group = highlight_group,
  pattern = '*',
})
local format_group = vim.api.nvim_create_augroup('FormatGroup', { clear = true })
vim.api.nvim_create_autocmd('BufWritePre', {
  group = format_group,
  pattern = '*',
  command = '%s/\\s\\+$//e',
})
vim.cmd([[autocmd FileType * setlocal formatoptions-=cro]])

vim.keymap.set('n', 'n', 'nzzzv')
vim.keymap.set('n', 'N', 'Nzzzv')
vim.keymap.set('n', '<C-d>', '<C-d>zz')
vim.keymap.set('n', '<C-u>', '<C-u>zz')
vim.keymap.set('v', 'J', ":m '>+1<CR>gv=gv")
vim.keymap.set('v', 'K', ":m '<-2<CR>gv=gv")

vim.keymap.set('n', '<C-k>', '<cmd>cnext<CR>zz')
vim.keymap.set('n', '<C-j>', '<cmd>cprev<CR>zz')

-- Writing file CTRL+S
vim.keymap.set('n', '<C-s>', '<cmd>w<cr>')
vim.keymap.set('i', '<C-s>', '<cmd>w<cr>')

-- Git keybinds
vim.keymap.set('n', '<leader>gs', '<cmd>Git<CR>')
vim.keymap.set('n', '<C-b>', '<CMD>Oil<CR>')

-- Copy paste
vim.keymap.set('x', '<leader>p', [["_dP]])
vim.keymap.set({ 'n', 'v' }, '<leader>y', [["+y]])
vim.keymap.set('n', '<leader>Y', [["+Y]])

vim.api.nvim_create_user_command('W', function()
  vim.cmd('w')
end, { nargs = 0 })
vim.keymap.set('n', '<leader>u', '<cmd>UndotreeToggle<CR>')

require('Comment').setup()

vim.cmd([[colorscheme onedark]])
