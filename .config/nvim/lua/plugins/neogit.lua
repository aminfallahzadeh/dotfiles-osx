-------------------------------------------------
-- name : neogit-nvim
-- url  : https://github.com/NeogitOrg/neogit
-------------------------------------------------
return {
	"NeogitOrg/neogit",
	dependencies = {
		"nvim-lua/plenary.nvim", -- required
		"sindrets/diffview.nvim",
		"folke/snacks.nvim",
	},
	cmd = "Neogit",
}
