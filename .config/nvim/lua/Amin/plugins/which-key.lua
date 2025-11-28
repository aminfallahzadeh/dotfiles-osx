return {
	"folke/which-key.nvim",
	event = "VeryLazy",
	opts = {
		delay = 1000,
		preset = "helix",
		-- icons = {
		-- 	rules = {
		-- 		{ pattern = "tab", icon = "", color = "cyan" },
		-- 	},
		-- },
		win = {
			-- don't allow the popup to overlap with the cursor
			no_overlap = true,
			-- width = 1,
			-- height = { min = 4, max = 25 },
			-- col = 0,
			-- row = math.huge,
			border = "rounded",
			padding = { 1, 2 }, -- extra window padding [top/bottom, right/left]
			title = true,
			title_pos = "center",
			zindex = 1000,
			-- Additional vim.wo and vim.bo options
			bo = {},
			wo = {
				-- winblend = 10, -- value between 0-100 0 for fully opaque and 100 for fully transparent
			},
		},
	},
	config = function(_, opts)
		local wk = require("which-key")
		local snacks = require("snacks")
		wk.setup(opts)
		-- Register custom keymaps under <leader>
		wk.add({
			-- tabs
			{ "<leader>t", group = "tab" },
			{ "<leader>to", "<cmd>tabnew<cr>", desc = "New Tab", mode = "n" },
			{ "<leader>tx", "<cmd>tabclose<cr>", desc = "Close Current Tab", mode = "n" },
			{ "<leader>tn", "<cmd>tabnext<cr>", desc = "Next Tab", mode = "n" },
			{ "<leader>tp", "<cmd>tabprevious<cr>", desc = "Previous Tab", mode = "n" },
			{ "<leader>tf", "<cmd>tabnew %<cr>", desc = "Open Current Tab In New Tab", mode = "n" },

			-- buffers
			{ "<leader>b", group = "buffer" },
			{ "<leader>bn", "<cmd>bnext<cr>", desc = "Next Buffer", mode = "n" },
			{ "<leader>bp", "<cmd>bprevious<cr>", desc = "Previous Buffer", mode = "n" },

			-- windows
			-- { "<c-k>", ":wincmd k<cr>", desc = "Move To Top Window", mode = "n" },
			-- { "<c-j>", ":wincmd j<cr>", desc = "Move To Down Window", mode = "n" },
			-- { "<c-h>", ":wincmd h<cr>", desc = "Move To Left Window", mode = "n" },
			-- { "<c-l>", ":wincmd l<cr>", desc = "Move To Right Window", mode = "n" },

			{ "<leader>w", group = "window" },
			{ "<leader>wr", "<C-w>v", desc = "Open Window Vertically", mode = "n" },
			{ "<leader>wl", "<C-w>s", desc = "Open Window Horizontally", mode = "n" },
			{ "<leader>wx", "<cmd>close<cr>", desc = "Close Current Window", mode = "n" },
			{ "<leader>we", "<C-w>=", desc = "Make Windows Equal", mode = "n" },
			{ "<leader>w=", "<cmd>vertical resize +5<cr>", desc = "Increase Pane Width", mode = "n" },
			{ "<leader>w-", "<cmd>vertical resize -5<cr>", desc = "Decrease Pane Width", mode = "n" },
			{ "<leader>w+", "<cmd>resize +5<cr>", desc = "Decrease Pane Height", mode = "n" },
			{ "<leader>w_", "<cmd>resize -5<cr>", desc = "Decrease Pane Height", mode = "n" },

			-- plugins
			-- { "<C-s>", "<cmd>MarkdownPreviewToggle<cr>", desc = "Toggle Markdown Preview", mode = "n" },
			{ "<leader>dn", "<cmd>NoiceDismiss<cr>", desc = "Dismiss Noice Message", mode = "n" },
			{ "<leader>?", "<cmd>WhichKey<cr>", desc = "Open WhichKey", mode = "n" },

			-- neotest
			{
				"<leader>tn",
				function()
					require("neotest").run.run()
				end,
				desc = "Run Neotest Nearest Test",
				mode = "n",
			},

			-- editor
			{ "J", ":m '>+1<CR>gv=gv", desc = "Moves Lines Down", mode = "v" },
			{ "K", ":m '<-2<CR>gv=gv", desc = "Moves Lines Up", mode = "v" },
			{ "n", "nzzzv", desc = "Center Cursor On Search", mode = "n" },
			{ "N", "Nzzzv", desc = "Center Cursor On Search", mode = "n" },
			{ "<", "<gv", desc = "Increase Indent", mode = "v" },
			{ ">", ">gv", desc = "Decrease Indent", mode = "v" },
			{ "<Esc>", ":nohl<CR>", desc = "Clear Search Highlights", mode = "n" },
			{ "<leader>dd", [["_d]], desc = "Delete Whithout Copy", mode = { "n", "v" } },
			{ "p", "_dp", desc = "Remember Yanked After Paste", mode = "v" },
			{ "x", "_x", desc = "Delete Character Whithout Copy", mode = { "n", "v" } },
			{
				"<leader>s",
				[[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]],
				desc = "Replace Word Under Cursor",
				mode = { "n", "v" },
			},

			-- picker
			{ "<leader>f", group = "file" },
			{
				"<leader>fp",
				function()
					local filePath = vim.fn.expand("%:~")
					vim.fn.setreg("+", filePath)
					print("File path copied to clipboard: " .. filePath)
				end,
				{ desc = "Copy file path to clipboard" },
				desc = "Copy File Path To Clipboard",
				mode = "n",
			},
			{
				"<leader>ff",
				function()
					snacks.picker.files()
				end,
				desc = "Find File",
				mode = "n",
			},
			{
				"<leader>fg",
				function()
					snacks.picker.grep()
				end,
				desc = "Open Picker Live Grep",
				mode = "n",
			},
			{
				"<leader>fws",
				function()
					snacks.picker.grep_word()
				end,
				desc = "Open Picker Live Grep",
				mode = "n",
			},
			{
				"<leader>fk",
				function()
					snacks.picker.keymaps()
				end,
				desc = "Open Picker Live Grep",
				mode = "n",
			},
			{
				"<leader>fb",
				function()
					snacks.picker.buffers()
				end,
				desc = "Open Picker Buffers",
				mode = "n",
			},
			{
				"<leader>fh",
				function()
					snacks.picker.help()
				end,
				desc = "Open Picker Help Tags",
				mode = "n",
			},
			{
				"<leader>fd",
				function()
					snacks.picker.diagnostics()
				end,
				desc = "Open Picker Diagnostics",
				mode = "n",
			},
			{
				"<leader>fx",
				function()
					snacks.picker.recent()
				end,
				desc = "Open Picker Recent Fiels",
				mode = "n",
			},
			{
				"<leader>fc",
				function()
					snacks.picker.files({ cwd = vim.fn.stdpath("config") })
				end,
				desc = "Open Picker Config Files",
				mode = "n",
			},
			{
				"<leader>ft",
				function()
					snacks.picker.todo_comments()
				end,
				desc = "Open Picker Todo",
				mode = "n",
			},
			{
				"<leader>fT",
				function()
					snacks.picker.todo_comments({ keywords = { "TODO", "FIX", "FIXME" } })
				end,
				desc = "Open Picker Todo",
				mode = "n",
			},

			-- snacks
			{
				"<leader>lg",
				function()
					snacks.lazygit()
				end,
				desc = "Open Lazygit",
				mode = "n",
			},

			-- auto-session
			{
				"<leader>ls",
				function()
					require("auto-session.session-lens").search_session()
				end,
				desc = "Search Session",
				mode = "n",
			},

			-- formatting
			{
				"<leader>mp",
				function()
					require("conform").format({
						lsp_fallback = true,
						async = false,
						timeout_ms = 1000,
					})
				end,
				desc = " Prettier Format whole file or range (in visual mode) with",
				mode = { "n", "v" },
			},

			-- trouble
			{ "<leader>x", group = "trouble" },
			{ "<leader>xw", "<cmd>Trouble diagnostics toggle<cr>", desc = "Toggle Trouble Diagnostics" },
			{
				"<leader>xd",
				"<cmd>Trouble diagnostics toggle filter.buf=0<cr>",
				desc = "Toggle Trouble Document Diagnostics",
			},
			{ "<leader>xq", "<cmd>Trouble quickfix toggle<cr>", desc = "Toggle Trouble Quickfix" },
			{ "<leader>xl", "<cmd>Trouble loclist toggle<cr>", desc = "Toggle Trouble Location List" },
			{ "<leader>xt", "<cmd>Trouble todo toggle<cr>", desc = "Toggle Trouble o List" },

			-- yazi
			{ "<leader>-", "<cmd>Yazi<cr>", desc = "Open Yazi Current", mode = { "n", "v" } },
			{ "<leader>yw", "<cmd>Yazi cwd<cr>", desc = "Open Yazi In Neovim CWD", mode = { "n", "v" } },
			{
				"<C-n>",
				function()
					local buf_dir = vim.fn.expand("%:p:h")
					require("yazi").yazi({}, buf_dir)
				end,
				desc = "Open Yazi in current buffer directory",
				mode = { "n", "v" },
			},

			-- lsp
			{ "<leader>c", group = "lsp" },
			{ "<leader>cD", "vim.lsp.buf.declaration", desc = "Go To Declaration", mode = "n" },
			{
				"<leader>ca",
				function()
					require("tiny-code-action").code_action()
				end,
				desc = "Lsp Code Action",
				mode = { "n", "x" },
			},

			-- neogit
			{ "<leader>gg", "<cmd>Neogit<cr>", desc = "Neogit UI" },
		})
	end,
}
