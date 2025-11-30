-------------------------------------------------
-- name : yazi-nvim
-- url  : https://github.com/mikavilpas/yazi.nvim
-------------------------------------------------
return {
	"mikavilpas/yazi.nvim",
	event = "VeryLazy",
	dependencies = {
		-- check the installation instructions at
		-- https://github.com/folke/snacks.nvim
		"folke/snacks.nvim",
	},
	keys = {},
	opts = {
		-- if you want to open yazi instead of netrw, see below for more info
		open_for_directories = false,
		keymaps = {
			show_help = "<f1>",
		},
		yazi_floating_window_border = "rounded",
		highlight_hovered_buffers_in_same_directory = false,
		highlight_groups = {
			hovered_buffer = { fg = "NONE", bg = "NONE", underline = false },
			hovered_buffer_in_same_directory = { fg = "NONE", bg = "NONE", underline = false },
		},
	},
	-- 👇 if you use `open_for_directories=true`, this is recommended
	init = function()
		-- More details: https://github.com/mikavilpas/yazi.nvim/issues/802
		-- vim.g.loaded_netrw = 1
		vim.g.loaded_netrwPlugin = 1
	end,
}
