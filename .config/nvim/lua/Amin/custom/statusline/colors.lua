require("Amin.core.colors.dark")
require("Amin.core.colors.light")

local function highlight(tag, foreground, background, style)
	vim.cmd("highlight " .. tag .. " guifg=" .. foreground .. " guibg=" .. background .. " gui=" .. style)
end

local mode = vim.fn.trim(vim.fn.system("cat ~/.config/theme/mode"))
local is_light_mode = mode == "light"
local colors = is_light_mode and PaletteLight or PaletteDark

highlight("StatusMode", colors.crust, colors.text, colors.none)
highlight("StatusBranch", is_light_mode and colors.noir_1 or colors.text, colors.none, colors.none)
highlight("StatusBranchChanges", is_light_mode and colors.noir_4 or colors.noir_5, colors.none, colors.none)
highlight("StatusFile", is_light_mode and colors.noir_6 or colors.noir_4, colors.none, colors.none)
highlight("StatusSaved", is_light_mode and colors.noir_5 or colors.noir_2, colors.none, colors.none)
highlight("StatusWarnings", colors.yellow, colors.none, colors.none)
highlight("StatusErrors", colors.red, colors.none, colors.none)
highlight("StatusInfos", colors.blue, colors.none, colors.none)
highlight("StatusHints", colors.green, colors.none, colors.none)
highlight("StatusSpotify", is_light_mode and colors.noir_5 or colors.noir_4, colors.none, colors.none)
highlight("StatusFileType", colors.crust, colors.text, colors.none)
highlight("StatusFilePath", is_light_mode and colors.noir_0 or colors.noir_3, colors.none, colors.none)
