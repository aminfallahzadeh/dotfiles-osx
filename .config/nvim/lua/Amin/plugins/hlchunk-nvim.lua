-------------------------------------------------
-- name : hlchunk-nvim (indent lines)
-- url  : https://github.com/shellRaining/hlchunk.nvim
-------------------------------------------------
return {
	"shellRaining/hlchunk.nvim",
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		local colors = require("Amin.core.colors.nord")

		require("hlchunk").setup({
			chunk = {
				enable = true,
				delay = 0,
				chars = {
					horizontal_line = "─",
					vertical_line = "│",
					left_top = "╭",
					left_bottom = "╰",
					right_arrow = "─",
				},
				style = { { fg = colors.frost_3 }, { fg = colors.aurora_red } },
			},
		})
	end,
}
