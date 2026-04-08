local M = {}

-------------------------------------------------
-- Treesitter Setup
-------------------------------------------------

M.languages = {
	json = "json",
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

	-- Auto-start Treesitter safely
	vim.api.nvim_create_autocmd("FileType", {
		callback = function(args)
			local buf = args.buf
			local ft = args.match

			-- Find the parser for this filetype
			local parser_name
			for parser, filetype in pairs(M.languages) do
				if filetype == ft then
					parser_name = parser
					break
				end
			end

			if parser_name then
				-- Safe call: won't error if parser is missing
				pcall(function()
					vim.treesitter.start(buf, parser_name)
				end)
			end
		end,
	})
end

M.setup()

return M
