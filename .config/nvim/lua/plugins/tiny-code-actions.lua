-------------------------------------------------
-- name : tiny-code-actions-nvim
-- url  : https://github.com/rachartier/tiny-code-action.nvim
-------------------------------------------------
return {
	"rachartier/tiny-code-action.nvim",
	dependencies = {
		{ "nvim-lua/plenary.nvim" },
		{
			"folke/snacks.nvim",
			opts = {
				terminal = {},
			},
		},
	},
	event = "LspAttach",
	opts = {},
}
