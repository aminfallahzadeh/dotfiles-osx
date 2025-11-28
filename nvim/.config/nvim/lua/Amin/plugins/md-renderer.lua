return {
	"MeanderingProgrammer/render-markdown.nvim",
	dependencies = {
		"nvim-treesitter/nvim-treesitter",
		"echasnovski/mini.nvim",
	},
	opts = {},

	config = function()
		local md_renderer = require("render-markdown")

		md_renderer.setup({})

		-- Set custom highlight groups
		vim.api.nvim_set_hl(0, "RenderMarkdownCode", { bg = "#242835" })
		vim.api.nvim_set_hl(0, "RenderMarkdownH1Bg", { bg = "#0d2a4c", fg = "#2b8fff" })
		vim.api.nvim_set_hl(0, "RenderMarkdownH2Bg", { bg = "#553500", fg = "#ff9f01" })
		vim.api.nvim_set_hl(0, "RenderMarkdownH3Bg", { bg = "#597957", fg = "#bcffb8" })
		vim.api.nvim_set_hl(0, "RenderMarkdownH4Bg", { bg = "#093700", fg = "#24e900" })
		vim.api.nvim_set_hl(0, "RenderMarkdownH5Bg", { bg = "#49002b", fg = "#ff0098" })
		vim.api.nvim_set_hl(0, "RenderMarkdownH6Bg", { bg = "#430056", fg = "#c700ff" })
	end,
}
