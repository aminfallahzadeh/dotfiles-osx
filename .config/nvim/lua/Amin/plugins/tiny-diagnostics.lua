return {
	"rachartier/tiny-inline-diagnostic.nvim",
	event = "VeryLazy",
	priority = 1000,
	config = function()
		require("tiny-inline-diagnostic").setup({
			preset = "classic",
			transparent_bg = true,
			hi = {
				background = "#2e3441",
				mixing_color = "None",
			},

			options = {
				show_source = {
					enabled = true,
				},

				use_icons_from_diagnostic = true,
			},
		})
		vim.diagnostic.config({ virtual_text = false }) -- Disable Neovim's default virtual text diagnostics
	end,
}
