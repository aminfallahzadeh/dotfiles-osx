require("Amin.core.colors.dark")
require("Amin.core.colors.light")

-- vim.o.background = "dark"
local mode = vim.fn.trim(vim.fn.system("cat ~/.config/theme/mode"))

local highlights = mode == "light" and PaletteLightHighlights or PaletteDarkHighlights

for group, opts in pairs(highlights) do
	local cmd = "highlight " .. group

	if opts.fg then
		cmd = cmd .. " guifg=" .. opts.fg
	end

	if opts.bg then
		cmd = cmd .. " guibg=" .. opts.bg
	end

	if opts.style then
		cmd = cmd .. " gui=" .. opts.style
	end

	vim.cmd(cmd)
end
--
-- local M = {}
--
-- require("Amin.core.colors.dark")
-- require("Amin.core.colors.light")
--
-- function M.apply()
-- 	local mode = vim.fn.trim(vim.fn.system("cat ~/.config/theme/mode"))
--
-- 	if mode == "light" then
-- 		vim.o.background = "light"
-- 	else
-- 		vim.o.background = "dark"
-- 	end
--
-- 	local highlights = vim.o.background == "light" and PaletteLightHighlights or PaletteDarkHighlights
--
-- 	-- clear old highlights (VERY IMPORTANT)
-- 	vim.cmd("highlight clear")
-- 	vim.cmd("syntax reset")
--
-- 	for group, opts in pairs(highlights) do
-- 		local cmd = "highlight " .. group
--
-- 		if opts.fg then
-- 			cmd = cmd .. " guifg=" .. opts.fg
-- 		end
-- 		if opts.bg then
-- 			cmd = cmd .. " guibg=" .. opts.bg
-- 		end
-- 		if opts.style then
-- 			cmd = cmd .. " gui=" .. opts.style
-- 		end
--
-- 		vim.cmd(cmd)
-- 	end
-- end
--
-- return M
