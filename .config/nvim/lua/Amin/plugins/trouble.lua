-------------------------------------------------
-- name : trouble-nvim
-- url  : https://github.com/folke/trouble.nvim
-------------------------------------------------
return {
	"folke/trouble.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons", "folke/todo-comments.nvim" },
	opts = {
		focus = true,
	},
	cmd = "Trouble",
	keys = {},
}
