return {
	"petertriho/nvim-scrollbar",
	config = function()
		local nord = require("Amin.core.colors.nord")
		require("scrollbar").setup({
			handle = {
				color = nord.polar_night_4,
			},
			marks = {
				Search = { color = nord.aurora_yellow },
				Error = { color = nord.aurora_red },
				Warn = { color = nord.aurora_orange },
				Info = { color = nord.frost_3 },
				Hint = { color = nord.aurora_green },
				Misc = { color = nord.aurora_purple },
			},
		})
	end,
}
