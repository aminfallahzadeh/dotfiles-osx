-- vars
local icons = require("Amin.core.icons")

-- LSP servers
local servers = {
	"lua_ls",
	"cssls",
	"html-ls",
	"emmet_language_server",
	"ts_ls",
	"eslint",
	"marksman",
	"tailwindcss",
	"pylsp",
}

-- ============================================================================
-- LSP Capabilities Setup (blink.cmp integration)
-- ============================================================================

local function get_capabilities()
	-- Check if blink.cmp is available
	local has_blink, blink = pcall(require, "blink.cmp")

	if has_blink and blink.get_lsp_capabilities then
		-- Merge default capabilities with blink.cmp capabilities
		return vim.tbl_deep_extend("force", vim.lsp.protocol.make_client_capabilities(), blink.get_lsp_capabilities(), {
			-- Additional capabilities can be added here
			workspace = {
				fileOperations = {
					didRename = true,
					willRename = true,
				},
			},
		})
	else
		-- Fallback to default capabilities if blink.cmp is not available
		return vim.lsp.protocol.make_client_capabilities()
	end
end

-- ============================================================================
-- Diagnostic Configuration
-- ============================================================================

local signs = {
	[vim.diagnostic.severity.ERROR] = icons.diagnostics.Error .. " ",
	[vim.diagnostic.severity.WARN] = icons.diagnostics.Warning .. " ",
	[vim.diagnostic.severity.HINT] = icons.diagnostics.Hint .. " ",
	[vim.diagnostic.severity.INFO] = icons.diagnostics.Info .. " ",
}

-- Set the diagnostic config with all icons
vim.diagnostic.config({
	signs = {
		text = signs, -- Enable signs in the gutter
	},
	virtual_text = true, -- Specify Enable virtual text for diagnostics
	underline = true,
	-- underline = {
	--
	-- 	severity = vim.diagnostic.severity.HINT,
	-- }, -- Specify Underline diagnostics
	update_in_insert = false, -- Keep diagnostics active in insert mode
})

-- ============================================================================
-- LSP Server Setup
-- ============================================================================

local capabilities = get_capabilities()

for _, server_name in ipairs(servers) do
	-- Load server-specific config from lsp/<server-name>.lua
	local config_path = vim.fn.stdpath("config") .. "/lsp/" .. server_name .. ".lua"

	if vim.fn.filereadable(config_path) == 1 then
		-- Load the config file
		local ok, server_config = pcall(dofile, config_path)

		if ok and type(server_config) == "table" then
			-- Merge capabilities with server config
			server_config.capabilities = vim.tbl_deep_extend("force", capabilities, server_config.capabilities or {})

			-- Enable the LSP with the loaded config
			vim.lsp.enable(server_name, server_config)
		else
			-- If config load failed, enable with default config
			vim.notify(string.format("Failed to load config for %s, using defaults", server_name), vim.log.levels.WARN)
			vim.lsp.enable(server_name, true)
		end
	else
		-- No config file, use default config
		vim.lsp.enable(server_name, true)
	end
end
