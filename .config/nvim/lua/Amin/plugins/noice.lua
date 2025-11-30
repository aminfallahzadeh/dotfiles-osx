-------------------------------------------------
-- name : noice-nvim
-- url  : https://github.com/folke/noice.nvim
-------------------------------------------------
return {
	"folke/noice.nvim",
	event = "VeryLazy",
	dependencies = {
		"MunifTanjim/nui.nvim",
	},

	config = function()
		require("noice").setup({

			presets = {
				bottom_search = false,
				lsp_doc_border = true,
			},
		})
	end,
}
