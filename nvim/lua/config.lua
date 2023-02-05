local set = vim.opt

local Plug = vim.fn['plug#']

vim.call('plug#begin', '~/.config/nvim/plugged')

Plug 'joshdick/onedark.vim'

vim.call('plug#end')

vim.cmd "colorscheme onedark"

set.relativenumber = true
set.colorcolumn = "80"
set.termguicolors = true

set.mouse = "a"
set.nu = true
set.errorbells = false

set.tabstop = 4
set.softtabstop = 0
set.shiftwidth = 4
set.expandtab = false
set.smartindent = true

set.hlsearch = false
set.incsearch = true
set.ignorecase = true
set.smartcase = true
