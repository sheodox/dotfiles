local util = require("sheodox-df.util")

local function get_prettier_bin_path()
	-- depending on the project prettier can exist in different locations,
	-- this will check all known locations for prettier and return the one
	-- that matches, if any
	local possible_paths = {
		-- most projects
		"node_modules/.bin/prettier",
		"src/static/node_modules/.bin/prettier",
		-- tadoku
		"frontend/web/node_modules/.bin/prettier",
	}

	for _, p in ipairs(possible_paths) do
		if util.path_exists(p) then
			return p
		end
	end

	-- if we don't know where it is just pass the most likely, maybe they haven't npm installed yet?
	return possible_paths[1]
end

local function prettier()
	return {
		exe = get_prettier_bin_path(),
		args = { "--stdin-filepath", vim.fn.fnameescape(vim.api.nvim_buf_get_name(0)) },
		stdin = true,
	}
end

require("formatter").setup({
	filetype = {
		javascript = { prettier },
		typescript = { prettier },
		typescriptreact = { prettier },
		svelte = { prettier },
		html = { prettier },
		css = { prettier },
		scss = { prettier },
		json = { prettier },
		yaml = { prettier },
		markdown = { prettier },
		rust = {
			function()
				return {
					exe = "rustfmt",
					stdin = true,
				}
			end,
		},
		go = {
			function()
				return {
					exe = "gofmt",
					stdin = true,
				}
			end,
		},
		lua = {
			function()
				return {
					exe = "stylua",
					args = {
						-- "--config-path ~/.config/stylua/stylua.toml",
						"-",
					},
					stdin = true,
				}
			end,
		},
		ruby = {
			function()
				return {
					exe = "rubocop", -- might prepend `bundle exec `
					args = {
						"--auto-correct",
						"--stdin",
						"%:p",
						"2>/dev/null",
						"|",
						"awk 'f; /^====================$/{f=1}'",
					},
					stdin = true,
				}
			end,
		},
	},
})
