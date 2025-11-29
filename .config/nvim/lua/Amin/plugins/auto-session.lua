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
			-- NOTE: moved to whichkey.lua
			-- vim.keymap.set("n", "<leader>ls", require("auto-session.session-lens").search_session, {
			-- 	noremap = true,
			-- }),
		})
	end,
}
