-- basic keymaps
vim.g.mapleader = " "
vim.g.maplocalleader = " "

vim.keymap.set("n", "<c-k>", ":wincmd k<CR>")
vim.keymap.set("n", "<c-j>", ":wincmd j<CR>")
vim.keymap.set("n", "<c-h>", ":wincmd h<CR>")
vim.keymap.set("n", "<c-l>", ":wincmd l<CR>")

-- disbale banner for nvim file explorer
vim.cmd("let g:netrw_banner = 0")

-- set leader key to space
vim.opt.fillchars = { eob = " " }

-- go to previous/next line with h,l,left arrow and right arrow
-- when cursor reaches end/beginning of line
vim.opt.whichwrap:append("<>[]hl")

-- encoding format
vim.scriptencoding = "utf-8"
vim.opt.encoding = "utf-8"
vim.opt.fileencoding = "utf-8"

-- cursor shape
vim.o.guicursor = "n-v-c:block,i-ci-ve:ver25,r-cr:hor20,o:hor50"

-- line numbers
vim.opt.nu = true
vim.opt.rnu = true

-- spacing settings
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.smarttab = true
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.opt.autoindent = true
vim.opt.breakindent = true
vim.opt.smartindent = true
vim.opt.wrap = true

-- silent mode
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.wildignore:append({ "*/node_modules/*" })

-- enable undo after restarting
vim.opt.undofile = true

-- search settings
vim.opt.ignorecase = true -- Case insensitive searching UNLESS /C or capital in search
vim.opt.smartcase = true

-- enable mouse
vim.opt.mouse = "a"

-- gui
vim.o.winborder = "rounded"
vim.opt.termguicolors = true
vim.opt.showcmd = true
vim.opt.cmdheight = 1
vim.opt.signcolumn = "yes"
vim.opt.scrolloff = 8 -- always keeep 10 line above/below cursor
vim.opt.shortmess:append("sI") -- disable vim intro
vim.opt.cursorline = true -- disable cursorline highlight
vim.opt.cursorlineopt = "number" -- disable cursorline highlighti
vim.opt.ruler = true
vim.opt.background = "dark"

-- backspace behaviour
vim.opt.backspace = { "start", "eol", "indent" }

-- windows / buffers
vim.opt.splitright = true
vim.opt.splitbelow = true

-- should test
-- vim.opt.updatetime = 50
vim.opt.clipboard:append("unnamedplus")
-- vim.opt.hlsearch = true
-- vim.g.editorconfig = true

vim.g.sass_variables_file = "_variables.scss"
vim.o.termbidi = true

-- disable auto comment
vim.api.nvim_create_autocmd("FileType", {
	pattern = "*",
	callback = function()
		vim.opt.formatoptions:remove({ "r", "o" })
	end,
})

-- disbale unnecessary diagnostics
vim.api.nvim_set_hl(0, "DiagnosticUnnecessary", {})

-- fix checkhealth
vim.o.sessionoptions = "buffers,curdir,folds,help,tabpages,winsize,winpos,localoptions"

vim.opt.updatetime = 250
vim.opt.timeoutlen = 300
