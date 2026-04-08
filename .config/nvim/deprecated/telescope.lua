return {
	"nvim-telescope/telescope.nvim",
	branch = "0.1.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-telescope/telescope-ui-select.nvim",
		{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
		"smartpde/telescope-recent-files",
	},
	cmd = "Telescope",
	keys = {
		-- NOTE: moved to keymaps.lua
		-- { "<leader>fg", "<cmd>Telescope live_grep<cr>" },
	},
	config = function()
		local telescope = require("telescope")
		local actions = require("telescope.actions")

		telescope.setup({
			pickers = {
				buffers = {
					show_all_buffers = true, -- Show all buffers
					sort_lastused = true, -- Sort by last used
					theme = "dropdown", -- Use dropdown UI
					previewer = false, -- Disable preview
					mappings = {
						i = {
							["<C-d>"] = "delete_buffer", -- Map Ctrl-d to delete buffer
						},
					},
				},
			},
			defaults = {
				prompt_prefix = "   ",
				selection_caret = "  ",
				sorting_strategy = "ascending",
				layout_strategy = "horizontal",
				-- layout_config = {
				-- 	horizontal = {
				-- 		prompt_position = "top",
				-- 		preview_width = 0.55,
				-- 		results_width = 0.8,
				-- 	},
				--  ff	vertical = {
				-- 		mirror = false,
				-- 	},
				-- 	idth = 0.87,
				-- 	height = 0.80,
				-- },

				mappings = {
					n = {
						["<Tab>"] = actions.move_selection_next,
						["<S-Tab>"] = actions.move_selection_previous,
					},
					i = {
						["<Tab>"] = actions.move_selection_next,
						["<S-Tab>"] = actions.move_selection_previous,
					},
				},

				file_ignore_patterns = {
					"vendor/*",
					"%.lock",
					"__pycache__/*",
					"%.sqlite3",
					"%.ipynb",
					"node_modules/*",
					"%.jpg",
					"%.jpeg",
					"%.png",
					"%.svg",
					"%.otf",
					"%.ttf",
					".git/",
					"%.webp",
					".dart_tool/",
					".github/",
					".gradle/",
					".idea/",
					".settings/",
					".vscode/",
					"__pycache__/",
					"build/",
					"env/",
					"gradle/",
					"node_modules/",
					"target/",
					"%.pdb",
					"%.dll",
					"%.class",
					"%.exe",
					"%.cache",
					"%.ico",
					"%.pdf",
					"%.dylib",
					"%.jar",
					"%.docx",
					"%.met",
					"smalljre_*/*",
					".vale/",
					"%.burp",
					"%.mp4",
					"%.mkv",
					"%.rar",
					"%.zip",
					"%.7z",
					"%.tar",
					"%.bz2",
					"%.epub",
					"%.flac",
					"%.tar.gz",
				},
			},
			extensions = {
				["ui-select"] = {
					require("telescope.themes").get_dropdown({}),
				},
			},
		})
		telescope.load_extension("ui-select")
		telescope.load_extension("fzf")
		telescope.load_extension("recent_files")
	end,
}
