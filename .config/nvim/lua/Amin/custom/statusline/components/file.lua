local M = {}

-- Short file path: keep only last 2 segments
local function short_filepath()
	local filepath = vim.fn.expand("%:~:.") -- expand with ~ or relative path
	if filepath == "" then
		return "[No File]"
	end

	local parts = vim.split(filepath, "/")
	local n = #parts

	if n <= 2 then
		return filepath
	else
		return table.concat({ parts[n - 1], parts[n] }, "/")
	end
end

-- File path component
M.get_file_path_component = short_filepath

-- File type component
M.get_file_type_component = function()
	local ft = vim.bo.filetype
	if ft == "" then
		return "[No Type]"
	end
	return ft:upper()
end

return M
