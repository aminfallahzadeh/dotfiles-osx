-------------------------------------------------
-- name : nvim-scrollbar
-- url  : https://github.com/petertriho/nvim-scrollbar
-------------------------------------------------
return {
	"petertriho/nvim-scrollbar",
	branch = "refactor/v2",
	lazy = false,
	config = function()
		local colors = require("core.colors.dark")
		require("scrollbar").setup({
			-- minimap = {
			-- 	enabled = true,
			-- },
			scrollbar = {
				thumb = {
					highlight = {
						bg = colors.PaletteDark.noir_6,
					},
				},

				track = {
					highlight = { bg = "NONE" },
				},
			},

			providers = {
				cursor = true,
				diagnostic = true,
				gitsigns = false,
				search = false,
				ale = false,
			},

			marks = {
				Search = { highlight = { fg = colors.PaletteDark.yellow } },
				Error = { highlight = { fg = colors.PaletteDark.red } },
				Warn = { highlight = { fg = colors.PaletteDark.peach } },
				Info = { highlight = { fg = colors.PaletteDark.sky } },
				Hint = { highlight = { fg = colors.PaletteDark.green } },
				Misc = { highlight = { fg = colors.PaletteDark.mauve } },
			},
		})
	end,
}
