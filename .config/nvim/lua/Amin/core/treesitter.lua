local M = {}

-------------------------------------------------
-- Treesitter Setup
-------------------------------------------------

-- Supported languages
-- format: [parser] = filetype
M.languages = {
	json = "json",
	-- lua = "lua",
	javascript = "javascript",
	typescript = "typescript",
	tsx = "typescriptreact",
	html = "html",
	css = "css",
	scss = "scss",
	python = "python",
	markdown = "markdown",
	["markdown-inline"] = "markdown-inline",
}

function M.setup()
	-- Register parsers
	for parser, filetype in pairs(M.languages) do
		vim.treesitter.language.register(parser, filetype)
	end

	-- Auto-start Treesitter
	vim.api.nvim_create_autocmd("FileType", {
		callback = function(args)
			local ft = args.match

			-- Start only if we support this filetype
			for _, filetype in pairs(M.languages) do
				if filetype == ft then
					vim.treesitter.start()
					return
				end
			end
		end,
	})
end

M.setup()

return M
