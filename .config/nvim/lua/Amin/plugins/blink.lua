-------------------------------------------------
-- name : blink-cmp
-- url  : https://github.com/saghen/blink.cmp
-------------------------------------------------
return {
	{ "L3MON4D3/LuaSnip", keys = {} },
	{
		"saghen/blink.cmp",
		keys = { "i", "a", "I", "A", "o", "O" },
		dependencies = {
			-- "rafamadriz/friendly-snippets",
			-- "onsails/lspkind.nvim",
			{ "rafamadriz/friendly-snippets", lazy = true },
			{ "onsails/lspkind.nvim", lazy = true },
		},
		event = "InsertEnter",
		version = "*",
		config = function()
			-- vim.cmd('highlight Pmenu guibg=none')
			-- vim.cmd('highlight PmenuExtra guibg=none')
			-- vim.cmd('highlight FloatBorder guibg=none')
			-- vim.cmd('highlight NormalFloat guibg=none')

			require("blink.cmp").setup({
				snippets = { preset = "luasnip" },
				signature = { enabled = true },
				-- appearance = {
				-- 	use_nvim_cmp_as_default = false,
				-- 	nerd_font_variant = "normal",
				-- },
				sources = {
					default = { "lsp", "path", "snippets", "buffer" },
				},
				keymap = {
					["<CR>"] = { "accept", "fallback" },
				},
				cmdline = {
					enabled = true,
					completion = { menu = { auto_show = true }, ghost_text = { enabled = false } },
					keymap = {
						["<Tab>"] = { "accept_and_enter", "fallback" },
						["<Down>"] = { "select_next", "fallback" },
						["<Up>"] = { "select_prev", "fallback" },
					},
				},
				completion = {
					list = {
						selection = { preselect = false, auto_insert = false },
					},
					menu = {
						scrolloff = 1,
						scrollbar = false,
						draw = {
							components = {
								label = {
									text = function(ctx)
										return require("colorful-menu").blink_components_text(ctx)
									end,
									highlight = function(ctx)
										return require("colorful-menu").blink_components_highlight(ctx)
									end,
								},
							},
							columns = {
								{ "kind_icon" },
								{ "label" },
								{ "kind" },
								{ "source_name" },
							},
						},
					},
					documentation = {
						window = {
							scrollbar = false,
							winhighlight = "Normal:BlinkCmpDoc,FloatBorder:BlinkCmpDocBorder,EndOfBuffer:BlinkCmpDoc",
						},
						auto_show = true,
						auto_show_delay_ms = 500,
					},
				},
			})

			require("luasnip.loaders.from_vscode").lazy_load()
		end,
	},
}
