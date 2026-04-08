return {
	"neovim/nvim-lspconfig",
	event = { "BufReadPre", "BufNewFile" },
	dependencies = {
		{ "antosha417/nvim-lsp-file-operations", config = true },
	},
	config = function()
		-- local icons = require("Amin.core.icons")

		-- NOTE : Moved all this to Mason including local variables
		-- used to enable autocompletion (assign to every lsp server config)
		-- local capabilities = cmp_nvim_lsp.default_capabilities()
		-- Change the Diagnostic symbols in the sign column (gutter)

		-- Define sign icons for each severity
		-- local signs = {
		-- 	[vim.diagnostic.severity.ERROR] = icons.diagnostics.Error .. " ",
		-- 	[vim.diagnostic.severity.WARN] = icons.diagnostics.Warning .. " ",
		-- 	[vim.diagnostic.severity.HINT] = icons.diagnostics.Hint .. " ",
		-- 	[vim.diagnostic.severity.INFO] = icons.diagnostics.Info .. " ",
		-- }
		--
		-- -- Set the diagnostic config with all icons
		-- vim.diagnostic.config({
		-- 	signs = {
		-- 		text = signs, -- Enable signs in the gutter
		-- 	},
		-- 	virtual_text = true, -- Specify Enable virtual text for diagnostics
		-- 	underline = true,
		-- 	-- underline = {
		-- 	--
		-- 	-- 	severity = vim.diagnostic.severity.HINT,
		-- 	-- }, -- Specify Underline diagnostics
		-- 	update_in_insert = false, -- Keep diagnostics active in insert mode
		-- })

		-- NOTE :
		-- Moved back from mason_lspconfig.setup_handlers from mason.lua file
		-- as mason setup_handlers is deprecated & its causing issues with lsp settings
		--
		-- Setup servers
		-- local lspconfig = require("lspconfig")
		-- local cmp_nvim_lsp = require("cmp_nvim_lsp")
		-- local capabilities = cmp_nvim_lsp.default_capabilities()
		-- local on_attach = require("Amin.plugins.lsp.lspconfig").on_attach
		-- capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)
		local capabilities = vim.lsp.protocol.make_client_capabilities()
		capabilities = vim.tbl_deep_extend("force", capabilities, require("blink.cmp").get_lsp_capabilities({}, false))

		-- Config lsp servers here
		-- =======================================
		-- Lua LS
		-- =======================================
		-- vim.lsp.config("lua_ls", {
		-- 	capabilities = capabilities,
		-- 	settings = {
		-- 		Lua = {
		-- 			diagnostics = {
		-- 				globals = { "vim" },
		-- 			},
		-- 			completion = {
		-- 				callSnippet = "Replace",
		-- 			},
		-- 			workspace = {
		-- 				library = {
		-- 					[vim.fn.expand("$VIMRUNTIME/lua")] = true,
		-- 					[vim.fn.stdpath("config") .. "/lua"] = true,
		-- 				},
		-- 			},
		-- 		},
		-- 	},
		-- })
		-- vim.lsp.enable("lua_ls")

		-- =======================================
		-- ESLint
		-- =======================================
		-- vim.lsp.config("eslint", {
		-- 	capabilities = capabilities,
		-- })
		-- vim.lsp.enable("eslint")

		-- =======================================
		-- CSS LS
		-- =======================================
		-- vim.lsp.config("cssls", {
		-- 	capabilities = capabilities,
		-- 	filetypes = {
		-- 		"css",
		-- 		"scss",
		-- 		"less",
		-- 		"sass",
		-- 		"html",
		-- 	},
		-- })
		-- vim.lsp.enable("cssls")

		-- =======================================
		-- Tailwind CSS
		-- =======================================
		-- vim.lsp.config("tailwindcss", {
		-- 	capabilities = capabilities,
		-- 	filetypes = {
		-- 		"html",
		-- 		"javascript",
		-- 		"javascriptreact",
		-- 		"typescript",
		-- 		"typescriptreact",
		-- 		"css",
		-- 		"sass",
		-- 		"scss",
		-- 		"less",
		-- 		"svelte",
		-- 	},
		-- })
		-- vim.lsp.enable("tailwindcss")

		-- =======================================
		-- Markdown
		-- =======================================
		-- vim.lsp.config("marksman", {
		-- 	capabilities = capabilities,
		-- 	filetypes = {
		-- 		"markdown",
		-- 	},
		-- })
		-- vim.lsp.enable("marksman")

		-- =======================================
		-- Emmet Language Server
		-- =======================================
		-- vim.lsp.config("emmet_language_server", {
		-- 	capabilities = capabilities,
		-- 	filetypes = {
		-- 		"css",
		-- 		"eruby",
		-- 		"html",
		-- 		"javascript",
		-- 		"javascriptreact",
		-- 		-- "less",
		-- 		"sass",
		-- 		"scss",
		-- 		"pug",
		-- 		"typescriptreact",
		-- 	},
		-- 	init_options = {
		-- 		includeLanguages = {},
		-- 		excludeLanguages = {},
		-- 		extensionsPath = {},
		-- 		preferences = {},
		-- 		showAbbreviationSuggestions = true,
		-- 		showExpandedAbbreviation = "always",
		-- 		showSuggestionsAsSnippets = false,
		-- 		syntaxProfiles = {},
		-- 		variables = {},
		-- 	},
		-- })
		-- vim.lsp.enable("emmet_language_server")

		-- =======================================
		-- TS LS
		-- =======================================
		-- vim.lsp.config("ts_ls", {
		-- 	capabilities = capabilities,
		-- 	filetypes = {
		-- 		"javascript",
		-- 		"javascriptreact",
		-- 		"typescript",
		-- 		"typescriptreact",
		-- 	},
		-- })
		-- vim.lsp.enable("ts_ls")
		-- vim.lsp.config("tsserver", {
		-- 	capabilities = capabilities,
		-- 	root_dir = function(fname)
		-- 		local util = lspconfig.util
		-- 		return not util.root_pattern("deno.json", "deno.jsonc")(fname)
		-- 			and util.root_pattern("tsconfig.json", "package.json", "jsconfig.json", ".git")(fname)
		-- 	end,
		-- 	single_file_support = false,
		-- 	init_options = {
		-- 		preferences = {
		-- 			includeCompletionsWithSnippetText = true,
		-- 			includeCompletionsForImportStatements = true,
		-- 		},
		-- 	},
		-- })
		-- vim.lsp.enable("tsserver")

		-- local hover = vim.lsp.buf.hover
		-- ---@diagnostic disable-next-line: duplicate-set-field
		-- vim.lsp.buf.hover = function()
		-- 	return hover({
		-- 		max_width = 100,
		-- 		max_height = 14,
		-- 		border = "rounded",
		-- 	})
		-- end

		-- vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, { border = "rounded" })

		-- vim.lsp.handlers["textDocument/signatureHelp"] =
		-- 	vim.lsp.with(vim.lsp.handlers.signature_help, { border = "rounded" })
	end,
}
