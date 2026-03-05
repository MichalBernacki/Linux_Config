local set = vim.opt

vim.g.mapleader = " "
vim.g.maplocalleader = " "

local Plug = vim.fn['plug#']

vim.call('plug#begin', '~/.config/nvim/plugged')
Plug 'folke/tokyonight.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug('nvim-telescope/telescope.nvim', { tag = '0.1.8' })

vim.call('plug#end')

vim.cmd "colorscheme tokyonight-night"

local ok, err = pcall(require, "telescope-config")
if not ok then
    vim.notify("telescope-config not loaded: " .. err, vim.log.levels.WARN)
end

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
