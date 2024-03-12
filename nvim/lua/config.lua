local set = vim.opt

local Plug = vim.fn['plug#']

vim.call('plug#begin', '~/.config/nvim/plugged')
Plug 'folke/tokyonight.nvim'

vim.call('plug#end')

vim.cmd "colorscheme tokyonight-moon"

set.relativenumber = true
set.termguicolors = true

set.mouse = "a"
set.nu = true
set.errorbells = false

set.tabstop = 4
set.shiftwidth = 4
set.expandtab = true
set.softtabstop = 4

set.hlsearch = false
set.incsearch = true
set.ignorecase = true
set.smartcase = true
