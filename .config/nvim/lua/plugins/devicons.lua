-------------------------------------------------
-- name : nvim-web-devicons
-- url  : https://github.com/nvim-tree/nvim-web-devicons
-------------------------------------------------
return {
	{
		"nvim-tree/nvim-web-devicons",
		opts = {

			override_by_extension = {
				["css"] = {
					icon = "",
					color = "#1865ff",
					name = "Css",
				},
			},
		},
	},
}
