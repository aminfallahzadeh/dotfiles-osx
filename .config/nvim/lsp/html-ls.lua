return {
	cmd = { "vscode-html-language-server", "--stdio" },
	filetypes = {
		"html",
		"blade",
		"javascriptreact",
		"typescriptreact",
		"svelte",
	},
	settings = {
		html = {
			validate = true,

			format = { enable = true },

			-- enable diagnostic checks
			suggest = {
				html5 = true,
			},

			-- validate inline JS / CSS too
			javascript = {
				validate = true,
			},
			css = {
				validate = true,
			},
		},
	},
	root_markers = { "index.html", ".git" },
	init_options = { provideFormatter = true },
}
