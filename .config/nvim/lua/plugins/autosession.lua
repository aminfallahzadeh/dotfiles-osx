-------------------------------------------------
-- name : auto-session
-- url  : https://github.com/rmagatti/auto-session
-------------------------------------------------
return {
	"rmagatti/auto-session",
	lazy = false,
	config = function()
		require("auto-session").setup({
			auto_session_suppress_dirs = { "~/", "~/Projects", "~/Downloads", "/" },
			session_lens = {
				buftypes_to_ignore = {},
				load_on_setup = true,
				theme_conf = { border = true },
				previewer = false,
			},
		})
	end,
}
