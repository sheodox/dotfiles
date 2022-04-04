local writingGroup = vim.api.nvim_create_augroup("sheodox-writing", { clear = true })
vim.api.nvim_create_autocmd("FileType", {
	pattern = { "markdown", "gitcommit" },
	group = writingGroup,
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

local fugitiveGroup = vim.api.nvim_create_augroup("sheodox-fugitive", { clear = true })
vim.api.nvim_create_autocmd("FileType", {
	pattern = "fugitive",
	group = fugitiveGroup,
	callback = function()
		-- prompt to create and switch to a new branch
		vim.keymap.set("n", "<leader>gb", createBranch, { noremap = true, expr = false, buffer = true })
		-- push the current branch, even if it's not tracked on the remote
		-- https://github.com/tpope/vim-fugitive/issues/1272#issuecomment-747818629
		vim.keymap.set(
			"n",
			"<leader>gp",
			"<cmd>Git -c push.default=current push<CR>",
			{ noremap = true, buffer = true }
		)
	end,
})
