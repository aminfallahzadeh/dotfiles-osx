-------------------------------------------------
-- name : gitsigns-nvim
-- url  : https://github.com/lewis6991/gitsigns.nvim
-------------------------------------------------

return {
	"lewis6991/gitsigns.nvim",
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		require("gitsigns").setup()
	end,
}
