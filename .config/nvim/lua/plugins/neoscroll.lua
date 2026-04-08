-------------------------------------------------
-- name : neoscroll-nvim
-- url  : https://github.com/karb94/neoscroll.nvim
-------------------------------------------------
return {
	"karb94/neoscroll.nvim",
	lazy = false,
	opts = {
		duration_multiplier = 0.5,
	},

	config = function(_, opts)
		require("neoscroll").setup(opts)
	end,
}
