-------------------------------------------------
-- name : nvim-scrollbar
-- url  : https://github.com/petertriho/nvim-scrollbar
-------------------------------------------------

return {
	"petertriho/nvim-scrollbar",
	lazy = false,
	config = function()
		local colors = require("core.colors.dark")
		require("scrollbar").setup({
			handle = {
				color = colors.PaletteDark.noir_6,
			},
			marks = {
				Search = { color = colors.PaletteDark.yellow },
				Error = { color = colors.PaletteDark.red },
				Warn = { color = colors.PaletteDark.peach },
				Info = { color = colors.PaletteDark.sky },
				Hint = { color = colors.PaletteDark.green },
				Misc = { color = colors.PaletteDark.mauve },
			},
			handlers = {
				cursor = false,
				diagnostic = true,
				gitsigns = false,
				handle = true,
				search = false,
				ale = false,
			},
		})
	end,
}
