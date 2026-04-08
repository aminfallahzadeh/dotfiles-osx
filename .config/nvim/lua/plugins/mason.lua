-------------------------------------------------
-- name : mason-nvim
-- url  : https://github.com/mason-org/mason.nvim
-------------------------------------------------
return {
	"williamboman/mason.nvim",
	lazy = false,
	cmd = "Mason",
	keys = { { "<leader>cm", "<cmd>Mason<cr>", desc = "Mason" } },
	build = ":MasonUpdate",
	dependencies = "neovim/nvim-lspconfig",

	------------------------------------------------------------------
	-- Mason settings
	------------------------------------------------------------------
	opts = {
		ensure_installed = {
			-- LSP servers
			"lua-language-server",
			"typescript-language-server",
			"html-lsp",
			"css-lsp",
			"tailwindcss-language-server",
			"emmet-language-server",
			"marksman",
			"clangd",
			"eslint-lsp",

			-- Formatters / Linters
			"prettier",
			"stylua",
			"isort",
			"pylint",

			-- Debuggers
			"debugpy",
			"js-debug-adapter",

			-- Markdown tools
			"markdown-toc",
			"markdownlint-cli2",
		},

		------------------------------------------------------------------
		-- UI icons
		------------------------------------------------------------------
		ui = {
			icons = {
				package_installed = "✓",
				package_pending = "➜",
				package_uninstalled = "✗",
			},
		},
	},

	------------------------------------------------------------------
	-- Plugin setup
	------------------------------------------------------------------
	config = function(_, opts)
		local mason = require("mason")
		local registry = require("mason-registry")

		-- Use opts table directly for Mason setup
		mason.setup(opts)

		------------------------------------------------------------------
		-- Auto-install ensure_installed packages
		------------------------------------------------------------------
		local function ensure_installed()
			for _, tool in ipairs(opts.ensure_installed) do
				if registry.has_package(tool) then
					local pkg = registry.get_package(tool)

					-- Install if missing
					if not pkg:is_installed() then
						vim.notify("Mason: Installing " .. tool .. "...", vim.log.levels.INFO)

						pkg:install():once("closed", function()
							if pkg:is_installed() then
								vim.notify("Mason: Installed " .. tool, vim.log.levels.INFO)
							else
								vim.notify("Mason: FAILED to install " .. tool, vim.log.levels.ERROR)
							end
						end)
					end
				else
					-- Unknown package (typo or unsupported)
					vim.notify("Mason: Package '" .. tool .. "' was not found", vim.log.levels.WARN)
				end
			end
		end

		------------------------------------------------------------------
		-- Refresh registry first (if supported), then install tools
		------------------------------------------------------------------
		if registry.refresh then
			registry.refresh(ensure_installed)
		else
			ensure_installed()
		end
	end,
}
