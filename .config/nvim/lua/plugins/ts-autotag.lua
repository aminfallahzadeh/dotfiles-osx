-------------------------------------------------
-- name : nvim-ts-autotag
-- url  : https://github.com/windwp/nvim-ts-autotag
-------------------------------------------------
return {
	"windwp/nvim-ts-autotag",
	event = "InsertEnter",
	config = function()
		require("nvim-ts-autotag").setup({})
	end,
}
