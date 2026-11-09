return {
	cmd = { "copilot-language-server", "--stdio" },
	root_dir = vim.fs.root(0, { ".git" }),
	capabilities = {
		textDocument = {
			inlineCompletion = { dynamicRegistration = true },
		},
	},
}
