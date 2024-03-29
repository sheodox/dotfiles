local settings = require("sheodox-df.settings")
local group = vim.api.nvim_create_augroup("sheodox-autocommands", { clear = true })

vim.api.nvim_create_autocmd("FileType", {
	pattern = { "markdown", "gitcommit" },
	group = group,
	callback = function()
		vim.opt_local.textwidth = 0
		vim.opt_local.wrap = true
		vim.opt_local.spell = true

		-- break on spaces instead of in the middle of words
		vim.opt_local.linebreak = true

		-- since wrap is on, use g to move by visual lines so moving in a large
		-- block of text is easier to do.
		vim.keymap.set("n", "j", "gj", { noremap = true, buffer = true })
		vim.keymap.set("n", "k", "gk", { noremap = true, buffer = true })
	end,
})

local autoformatGroup = vim.api.nvim_create_augroup("sheodox-autoformat", { clear = true })
vim.api.nvim_create_autocmd("BufWritePost", {
	pattern = {
		"*.ts",
		"*.svelte",
		"*.js",
		"*.tsx",
		"*.html",
		"*.scss",
		"*.css",
		"*.json",
		"*.yml",
		"*.rb",
		"*.md",
		"*.go",
		"*.lua",
		"*.rs",
	},
	group = autoformatGroup,
	callback = function()
		vim.cmd("FormatWrite")
	end,
})

local function createBranch()
	vim.ui.input({ prompt = "New branch name: " }, function(input)
		if input ~= nil then
			vim.cmd("Git checkout -b " .. input)
		else
			print("No new branch created")
		end
	end)
end

vim.api.nvim_create_autocmd("FileType", {
	pattern = "fugitive",
	group = group,
	callback = function()
		-- prompt to create and switch to a new branch
		vim.keymap.set("n", "<leader>gb", createBranch, { noremap = true, expr = false, buffer = true })
		-- push the current branch, even if it's not tracked on the remote
		-- https://github.com/tpope/vim-fugitive/issues/1272#issuecomment-747818629
		vim.keymap.set(
			"n",
			"<leader>gp",
			"<cmd>Git -c push.default=current push --set-upstream<CR>",
			{ noremap = true, buffer = true }
		)
	end,
})

local last_type_name
local function gen_go_type_method(use_last)
	local type_name = last_type_name
	if not use_last or not last_type_name then
		type_name = vim.fn.expand("<cword>")
	end

	if type_name == "" then
		return
	end

	vim.ui.input({ prompt = "Enter a new method name for " .. type_name .. ": " }, function(method_name)
		if not method_name or method_name == "" then
			return
		end

		last_type_name = type_name

		local is_pointer_receiver = string.find(method_name, "%*")
		local type_first_char = string.lower(string.sub(type_name, 1, 1))

		if is_pointer_receiver then
			method_name = string.gsub(method_name, "\\**", "")
			type_name = "*" .. type_name
		end

		local method_stub = "func (" .. type_first_char .. " " .. type_name .. ") " .. method_name .. "() {\n\n}"
		vim.fn.setreg('"', method_stub)
	end)
end

vim.api.nvim_create_autocmd("FileType", {
	pattern = "go",
	group = group,
	callback = function()
		vim.keymap.set("n", "<leader>om", gen_go_type_method, { noremap = true, expr = false, buffer = true })
		vim.keymap.set("n", "<leader>oM", function()
			gen_go_type_method(true)
		end, { noremap = true, expr = false, buffer = true })
	end,
})

-- need to set custom highlights in an autocmd because Goyo reappplies the colorscheme when entering/exiting
vim.api.nvim_create_autocmd("ColorScheme", {
	callback = settings.set_additional_highlights,
})

local ns_id_packagejson = vim.api.nvim_create_namespace("sheodox-packagejson")
vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost" }, {
	pattern = { "package.json" },
	group = group,
	callback = function()
		vim.api.nvim_buf_clear_namespace(0, ns_id_packagejson, 0, -1)
		local lines = vim.api.nvim_buf_get_lines(0, 0, -1, false)

		local isInDeps = false

		for line_num, line in ipairs(lines) do
			local trimmedLine = vim.trim(line)
			if vim.startswith(trimmedLine, "}") then
				isInDeps = false
			end

			if isInDeps then
				local split = vim.split(line, ":")
				local text = vim.trim(split[1]):gsub('"', "")
				local npm_url = "https://www.npmjs.com/package/" .. text

				vim.api.nvim_buf_set_extmark(0, ns_id_packagejson, line_num - 1, 0, {
					virt_text = { { npm_url, "Comment" } },
					virt_text_pos = "eol",
				})
			elseif
				vim.startswith(trimmedLine, '"dependencies"') or vim.startswith(trimmedLine, '"devDependencies"')
			then
				isInDeps = true
			end
		end
	end,
})

vim.api.nvim_create_autocmd("BufRead", {
	pattern = { "COMMIT_EDITMSG" },
	group = group,
	callback = function()
		local first_line = vim.api.nvim_buf_get_lines(0, 0, 1, false)[1]
		-- don't overwrite the first line if there is text there somehow
		if first_line ~= "" then
			return
		end

		local branch_name = vim.fn.systemlist("git rev-parse --abbrev-ref HEAD")[1]
		local ticket_name = branch_name:match("%a+-%d+")

		-- don't try and do something if a ticket number isn't found in the branch name
		if not ticket_name then
			return
		end

		local ticket_prelude = ticket_name:upper() .. ": "
		vim.api.nvim_buf_set_lines(0, 0, 1, false, { ticket_prelude })
		vim.api.nvim_win_set_cursor(0, { 1, #ticket_prelude - 1 })
	end,
})

-- vim.api.nvim_create_autocmd("VimEnter", {
-- 	once = true,
-- 	callback = function()
-- 		local pl = require("projectlaunch")
-- 		if pl.has_commands() then
-- 			pl.toggle_launch_menu()
-- 		end
-- 	end,
-- })
