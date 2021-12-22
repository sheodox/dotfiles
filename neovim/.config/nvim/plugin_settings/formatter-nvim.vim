lua << EOF
function prettier()
	return {
		exe = "node_modules/.bin/prettier",
		args = {"--stdin-filepath", vim.fn.fnameescape(vim.api.nvim_buf_get_name(0)), '--single-quote'},
		stdin = true
	}
end

	
require('formatter').setup({
	filetype = {
		javascript = { prettier },
		typescript = { prettier },
		svelte = { prettier },
		html = { prettier },
		css = { prettier },
		scss = { prettier },
		json = { prettier },
		yaml = { prettier },
		markdown = { prettier },
		ruby = {
			function()
				return {
					exe = "rubocop", -- might prepend `bundle exec `
					args = { '--auto-correct', '--stdin', '%:p', '2>/dev/null', '|', "awk 'f; /^====================$/{f=1}'"},
					stdin = true,
				}
			end
		}
	}
})
EOF
