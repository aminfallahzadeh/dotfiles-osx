-------------------------------------------------
-- name : nvim-colorizer
-- url : https://github.com/catgoose/nvim-colorizer.lua
-------------------------------------------------
return {
	"catgoose/nvim-colorizer.lua",
	event = "BufReadPre",
	opts = {},

	config = function(_, opts)
		require("colorizer").setup(opts)
	end,
}
