-------------------------------------------------
-- name : nord-nvim
-- url  : https://github.com/shaunsingh/nord.nvim
-------------------------------------------------
return {
	{
		"gbprod/nord.nvim",
		lazy = false,
		priority = 1000,
		config = function()
			require("nord").setup({
				styles = {
					-- Style to be applied to different syntax groups
					-- Value is any valid attr-list value for `:help nvim_set_hl`
					comments = { italic = true },
					keywords = { italic = true },
					functions = { italic = true },
					variables = {},
					booleans = { italic = true },

					-- To customize lualine/bufferline
					bufferline = {
						current = {},
						modified = { italic = true },
					},
				},
				on_highlights = function(highlights, _)
					highlights.WinSeparator = { fg = "#506477" }
					highlights.CursorLineNr = { fg = "#88c0d0" }
					highlights.FloatBorder = { fg = "#88c0d0" }
					highlights.DiagnosticUnnecessary = {}

					-- vim diagnostics
					highlights.DiagnosticVirtualTextError = { bg = "#2e3441", fg = "#bf616a", italic = true }
					highlights.DiagnosticVirtualTextHint = { bg = "#2e3441", fg = "#81a0c1", italic = true }
					highlights.DiagnosticVirtualTextInfo = { bg = "#2e3441", fg = "#81a0c1", italic = true }
					highlights.DiagnosticVirtualTextWarn = { bg = "#2e3441", fg = "#ebcb8a", italic = true }

					-- blink.cmp
					highlights.BlinkCmpMenu = { bg = "#2e3441" }
					highlights.BlinkCmpMenuBorder = { fg = "#88c0d0" }
					highlights.BlinkCmpSource = { bg = "#2e3441" }
					highlights.BlinkCmpDocBorder = { fg = "#88c0d0" }
					highlights.BlinkCmpDocSeparator = { fg = "#ffffff" }
				end,
			})

			vim.cmd.colorscheme("nord")
		end,
	},
}
