-------------------------------------------------
-- name : hlchunk-nvim (indent lines)
-- url  : https://github.com/shellRaining/hlchunk.nvim
-------------------------------------------------
return {
	"shellRaining/hlchunk.nvim",
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		-- local mocha = require("catppuccin.palettes").get_palette("mocha")
		-- local colors = require("zen.colors").get()
		-- local palette = colors.palette
		-- local colors = require("kanso.colors").setup()
		-- local palette = colors.palette
		local colors = require("Amin.core.colors.dark")

		require("hlchunk").setup({
			chunk = {
				enable = true,
				error_sign = false,
				delay = 0,
				chars = {
					horizontal_line = "─",
					vertical_line = "│",
					left_top = "╭",
					left_bottom = "╰",
					right_arrow = "─",
				},
				-- style = { { fg = palette.ash }, { fg = palette.rose } },
				style = { { fg = colors.PaletteDark.noir_5 }, { fg = colors.PaletteDark.maroon } },
			},
		})
	end,
}
