-------------------------------------------------
-- name : tailwind-colorizer-cmp-nvim
-- url : https://github.com/roobert/tailwindcss-colorizer-cmp.nvim
-------------------------------------------------
return {
	"roobert/tailwindcss-colorizer-cmp.nvim",
	event = { "BufReadPre", "BufNewFile" },
	opts = {},
	config = function()
		local tailwindcolorizer = require("tailwindcss-colorizer-cmp")

		tailwindcolorizer.setup({
			color_square_width = 2,
		})

		vim.api.nvim_create_autocmd({ "BufReadPost", "BufNewFile" }, {
			callback = function()
				vim.cmd("ColorizerAttachToBuffer")
			end,
		})
	end,
}
