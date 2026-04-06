require("Amin.custom.statusline.colors")

local git = require("Amin.custom.statusline.components.git")
local utils = require("Amin.custom.statusline.components.utils")
local components = require("Amin.custom.statusline.utils")
local diagnostics = require("Amin.custom.statusline.components.diagnostics")
local file = require("Amin.custom.statusline.components.file")

function StatusLine()
	local mode = utils.get_mode_component()
	local saved = utils.get_saved_component()

	local branch = git.get_branch_component()
	local changes = git.get_branch_changes_component()

	local infos = diagnostics.get_infos_component()
	local hints = diagnostics.get_hints_component()
	local errors = diagnostics.get_errors_component()
	local warnings = diagnostics.get_warnings_component()

	local file_path = file.get_file_path_component()
	local file_type = file.get_file_type_component()

	return table.concat({
		components.get_component("StatusMode", mode),
		components.get_component("StatusBranch", branch),
		components.get_component("StatusBranchChanges", changes),
		components.get_component("StatusFilePath", file_path),
		components.get_component_separator(),
		components.get_component("StatusErrors", errors),
		components.get_component("StatusWarnings", warnings),
		components.get_component("StatusInfos", infos),
		components.get_component("StatusHints", hints),
		components.get_component("StatusSaved", saved),
		components.get_component("StatusFileType", file_type),
	})
end

vim.o.laststatus = 3
vim.o.statusline = "%!v:lua.StatusLine()"
