-- =============================================
-- My Neovim Config
-- OS : OSX
-- Author: Amin Fallahzadeh
-- =============================================

-------------------------------------------------
-- Leader Keys
-------------------------------------------------
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-------------------------------------------------
-- Keymaps
-------------------------------------------------
vim.keymap.set("n", "<c-k>", ":wincmd k<CR>")
vim.keymap.set("n", "<c-j>", ":wincmd j<CR>")
vim.keymap.set("n", "<c-h>", ":wincmd h<CR>")
vim.keymap.set("n", "<c-l>", ":wincmd l<CR>")

-------------------------------------------------
-- Netrw & File Explorer
-------------------------------------------------
vim.cmd("let g:netrw_banner = 0") -- disable netrw banner
-- vim.g.loaded = 1
-- vim.g.loaded_netrwPlugin = 1

-------------------------------------------------
-- UI: Fillchars & Cursor
-------------------------------------------------
vim.opt.fillchars = { eob = " " }
vim.o.guicursor = "n-v-c:block,i-ci-ve:ver25,r-cr:hor20,o:hor50"
vim.opt.cursorline = true
vim.opt.cursorlineopt = "number"
vim.opt.ruler = true
vim.opt.termguicolors = true
vim.opt.background = "dark"
vim.o.winborder = "rounded"
vim.opt.showcmd = true
vim.opt.cmdheight = 1
vim.opt.signcolumn = "yes"
vim.opt.scrolloff = 8
vim.opt.shortmess:append("sI") -- disable vim intro

-------------------------------------------------
-- Encoding
-------------------------------------------------
vim.scriptencoding = "utf-8"
vim.opt.encoding = "utf-8"
vim.opt.fileencoding = "utf-8"

-------------------------------------------------
-- Line Numbers
-------------------------------------------------
vim.opt.nu = true
vim.opt.rnu = true

-------------------------------------------------
-- Movement & Wrap Behaviour
-------------------------------------------------
vim.opt.whichwrap:append("<>[]hl")
vim.opt.wrap = true
vim.opt.linebreak = true
vim.opt.breakindent = true

-------------------------------------------------
-- Tabs & Indentation
-------------------------------------------------
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.opt.smarttab = true
vim.opt.autoindent = true
vim.opt.smartindent = true

-------------------------------------------------
-- Undo, Backup & Swap
-------------------------------------------------
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undofile = true
vim.opt.wildignore:append({ "*/node_modules/*" })

-------------------------------------------------
-- Search
-------------------------------------------------
vim.opt.ignorecase = true
vim.opt.smartcase = true

-------------------------------------------------
-- Mouse & Clipboard
-------------------------------------------------
vim.opt.mouse = "a"
vim.opt.clipboard:append("unnamedplus")

-------------------------------------------------
-- Windows / Splits
-------------------------------------------------
vim.opt.splitright = true
vim.opt.splitbelow = true

-------------------------------------------------
-- Performance
-------------------------------------------------
vim.opt.updatetime = 250
vim.opt.timeoutlen = 300

-------------------------------------------------
-- Backspace Behaviour
-------------------------------------------------
vim.opt.backspace = { "start", "eol", "indent" }

-------------------------------------------------
-- Auto Commands
-------------------------------------------------
-- Disable automatic comments
vim.api.nvim_create_autocmd("FileType", {
	pattern = "*",
	callback = function()
		vim.opt.formatoptions:remove({ "r", "o" })
	end,
})

-------------------------------------------------
-- Highlight Fixes
-------------------------------------------------
vim.api.nvim_set_hl(0, "DiagnosticUnnecessary", {})

-------------------------------------------------
-- Misc / Extra Settings
-------------------------------------------------
vim.g.sass_variables_file = "_variables.scss"
vim.o.termbidi = true
vim.o.sessionoptions = "buffers,curdir,folds,help,tabpages,winsize,winpos,localoptions"
