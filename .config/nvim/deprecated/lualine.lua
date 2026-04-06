-------------------------------------------------
-- name : lualine-nvim
-- url  : https://github.com/nvim-lualine/lualine.nvim
----------------------------------------------------------------------
-- Helper: Show buffer name + diagnostics icons
----------------------------------------------------------------------
local function buffer_with_diagnostics(bufnr)
	-- Get filename (or "[No Name]")
	local name = vim.fn.fnamemodify(vim.api.nvim_buf_get_name(bufnr), ":t")
	if name == "" then
		name = "[No Name]"
	end

	-- Count diagnostics
	local diagnostics = vim.diagnostic.get(bufnr)
	local errors, warnings, infos, hints = 0, 0, 0, 0

	for _, d in ipairs(diagnostics) do
		local sev = d.severity
		if sev == vim.diagnostic.severity.ERROR then
			errors = errors + 1
		elseif sev == vim.diagnostic.severity.WARN then
			warnings = warnings + 1
		elseif sev == vim.diagnostic.severity.INFO then
			infos = infos + 1
		elseif sev == vim.diagnostic.severity.HINT then
			hints = hints + 1
		end
	end

	-- Pick icon (error > warn > info > hint)
	local icon = ""
	if errors > 0 then
		icon = " "
	elseif warnings > 0 then
		icon = " "
	elseif infos > 0 then
		icon = " "
	elseif hints > 0 then
		icon = " "
	end

	return name .. icon
end

----------------------------------------------------------------------
-- Helper: Lines/Columns info
-- Shows:
--   • In visual:   "󰈛 10L 20C"
--   • Other mode:  " 128" (buffer line count)
----------------------------------------------------------------------
local function lines_info()
	local mode = vim.fn.mode()

	-- If in visual mode, calculate selection size
	if mode:find("[vV]") then
		local starts = vim.fn.line("v")
		local ends = vim.fn.line(".")
		local lines = starts <= ends and ends - starts + 1 or starts - ends + 1
		return "󰈛 " .. tostring(lines) .. "L " .. tostring(vim.fn.wordcount().visual_chars) .. "C"
	else
		-- Normal info: total lines in buffer
		return " " .. vim.api.nvim_buf_line_count(0)
	end
end

----------------------------------------------------------------------
-- Helper: Shorten filepath: only "dir/file"
----------------------------------------------------------------------
local function short_filepath()
	local filepath = vim.fn.expand("%:~:.") -- expand with ~ or relative
	local parts = vim.split(filepath, "/")
	local n = #parts

	if n <= 2 then
		return filepath
	else
		return table.concat({ parts[n - 1], parts[n] }, "/")
	end
end

----------------------------------------------------------------------
-- Helper: Force-refresh lualine when starting/stopping macro recording
----------------------------------------------------------------------
local function setup_macro_refresh(lualine)
	vim.api.nvim_create_autocmd("RecordingEnter", {
		callback = function()
			lualine.refresh({
				place = { "statusline" },
			})
		end,
	})
end

----------------------------------------------------------------------
-- Helper: Macro recording indicator (RECORDING @q)
----------------------------------------------------------------------
local function macro_recording_status()
	local function current_status()
		local register = vim.fn.reg_recording()
		return register == "" and "" or "RECORDING @" .. register
	end
	return { "macro-recording", fmt = current_status }
end

----------------------------------------------------------------------
-- Main Plugin Config
----------------------------------------------------------------------
return {
	------------------------------------------------------------------
	-- 1. Lualine core
	------------------------------------------------------------------
	{
		"nvim-lualine/lualine.nvim",
		event = "VeryLazy",
		dependencies = {
			"nvim-tree/nvim-web-devicons",
		},
		init = function()
			vim.opt.laststatus = 0
		end,
		config = function()
			vim.opt.laststatus = 3
			local lualine = require("lualine")
			setup_macro_refresh(lualine)
			lualine.setup({

				------------------------------------------------------------------
				-- General options
				------------------------------------------------------------------
				options = {
					theme = "nord",
					component_separators = "",
					-- section_separators = { left = "", right = "" },
					disabled_filetypes = { "alpha" },
				},

				------------------------------------------------------------------
				-- TABLINE (top)
				------------------------------------------------------------------
				tabline = {
					-- lualine_a = { "buffers" },
					lualine_a = {
						{
							"buffers",
							fmt = function(_, ctx)
								return buffer_with_diagnostics(ctx.bufnr)
							end,
							symbols = {
								modified = " ●",
								alternate_file = "",
								directory = "",
							},
							show_filename_only = true,
							use_mode_colors = false,
						},
					},
					-- lualine_b = { "filename" },
					lualine_c = {},
					-- lualine_c = {'filename'},
					lualine_x = {},
					lualine_y = {
						{
							"diagnostics",
							symbols = {
								error = " ",
								warn = " ",
								info = " ",
								hint = " ",
							},
						},
					},
					lualine_z = { "tabs" },
				},

				------------------------------------------------------------------
				-- STATUSLINE (bottom)
				------------------------------------------------------------------
				sections = {
					lualine_a = {
						-- { "mode", separator = { left = "", right = "" }, right_padding = 2 },
						{
							"mode",
							fmt = function(mode)
								-- mode is the full name returned by lualine
								return mode:sub(1, 1) -- take only the first letter
							end,
						},
						macro_recording_status(),
					},
					lualine_b = {
						short_filepath,
						"branch",
						"diff",
						{
							"diagnostics",
							symbols = {
								error = " ",
								warn = " ",
								info = " ",
								hint = " ",
							},
						},
					},

					-- lualine_c = { "filename" },
					lualine_c = { lines_info },
					lualine_x = { "filetype" },
					lualine_y = {
						"ctime",
						"cdate",
						"progress",
					},
					lualine_z = {
						-- { "location", separator = { right = "", left = "" }, left_padding = 2 },
						{ "location", left_padding = 2 },
					},
				},
				exntensions = { "fzf" },
			})
		end,
	},

	------------------------------------------------------------------
	-- 2. Time extension (for ctime + cdate)
	------------------------------------------------------------------
	{
		"archibate/lualine-time",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		event = "VeryLazy",
	},
}
