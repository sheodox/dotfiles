local M = {}
local fn = vim.fn

function M.path_exists(file_path)
	return fn.empty(fn.glob(file_path)) == 0
end

return M
