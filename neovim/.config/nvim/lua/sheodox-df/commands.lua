local cmd = vim.api.nvim_create_user_command

local function to_clipboard(text)
	vim.fn.setreg("+", table.concat(text, "\n"))
end

cmd("CopyBuf", function()
	local buf_text = vim.api.nvim_buf_get_lines(0, 0, -1, false)
	to_clipboard(buf_text)
end, {})

local function copy_file(file_to_copy)
	if not file_to_copy then
		print("Not sure what file to copy, pass a file path.")
	end

	local file_text = vim.fn.readfile(file_to_copy)
	to_clipboard(file_text)
end

cmd("CopyFile", function(opts)
	copy_file(opts.args)
end, { nargs = 1, complete = "file" })

-- sets up a key map which copies the specified file
cmd("CopyFileOnKey", function(opts)
	local binding = "<leader>C"

	vim.keymap.set("n", binding, function()
		copy_file(opts.args)
		print("Copied '" .. opts.args .. "' to your clipboard.")
	end)

	print("Press " .. binding .. " to copy '" .. opts.args .. "' to your clipboard")
end, { nargs = 1, complete = "file" })
