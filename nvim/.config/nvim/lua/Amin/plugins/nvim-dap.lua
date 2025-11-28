-- return {
-- 	{
-- 		"mfussenegger/nvim-dap",
-- 		dependencies = {
-- 			"rcarriga/nvim-dap-ui",
-- 			"theHamsta/nvim-dap-virtual-text",
-- 			"stevearc/overseer.nvim",
-- 		},
--
-- 		keys = {
-- 			{
-- 				"<leader>da",
-- 				function()
-- 					require("dap").continue()
-- 				end,
-- 				desc = "Run",
-- 			},
-- 			{
-- 				"<leader>db",
-- 				function()
-- 					require("dap").toggle_breakpoint()
-- 				end,
-- 				desc = "Toggle Breakpoint",
-- 			},
-- 		},
--
-- 		config = function()
-- 			local dap = require("dap")
--
-- 			---------------------------------------------------------------------
-- 			-- PYTHON
-- 			---------------------------------------------------------------------
-- 			dap.adapters.python = {
-- 				type = "executable",
-- 				command = "/usr/bin/python3",
-- 				args = { "-m", "debugpy.adapter" },
-- 			}
--
-- 			dap.configurations.python = {
-- 				{
-- 					type = "python",
-- 					request = "launch",
-- 					name = "Launch file",
-- 					program = "${file}",
-- 					pythonPath = function()
-- 						-- If you're using pyenv/virtualenv, replace this
-- 						return "/usr/bin/python3"
-- 					end,
-- 				},
-- 			}
--
-- 			---------------------------------------------------------------------
-- 			-- JAVASCRIPT + TYPESCRIPT
-- 			---------------------------------------------------------------------
--
-- 			-- === JavaScript/TypeScript Node Debug Adapter ===
-- 			if not dap.adapters["pwa-node"] then
-- 				dap.adapters["pwa-node"] = {
-- 					type = "server",
-- 					host = "localhost",
-- 					port = "${port}",
-- 					executable = {
-- 						command = "node",
-- 						args = {
-- 							vim.env.MASON .. "/packages/" .. "js-debug-adapter" .. "/js-debug/src/dapDebugServer.js",
-- 							"${port}",
-- 						},
-- 					},
-- 				}
-- 			end
--
-- 			if not dap.adapters["node"] then
-- 				dap.adapters["node"] = function(cb, config)
-- 					if config.type == "node" then
-- 						config.type = "pwa-node"
-- 					end
-- 					local nativeAdapter = dap.adapters["pwa-node"]
-- 					if type(nativeAdapter) == "function" then
-- 						nativeAdapter(cb, config)
-- 					else
-- 						cb(nativeAdapter)
-- 					end
-- 				end
-- 			end
--
-- 			local js_filetypes = { "typescript", "javascript", "typescriptreact", "javascriptreact" }
-- 			local vscode = require("dap.ext.vscode")
-- 			vscode.type_to_filetypes["node"] = js_filetypes
-- 			vscode.type_to_filetypes["pwa-node"] = js_filetypes
--
-- 			for _, language in ipairs(js_filetypes) do
-- 				if not dap.configurations[language] then
-- 					dap.configurations[language] = {
-- 						{
-- 							type = "pwa-node",
-- 							request = "launch",
-- 							name = "Launch file",
-- 							program = "${file}",
-- 							cwd = "${workspaceFolder}",
-- 						},
-- 						{
-- 							type = "pwa-node",
-- 							request = "attach",
-- 							name = "Attach",
-- 							processId = require("dap.utils").pick_process,
-- 							cwd = "${workspaceFolder}",
-- 						},
-- 					}
-- 				end
-- 			end
-- 			-- local js_debug_path = vim.fn.stdpath("data")
-- 			-- 	.. "/mason/packages/js-debug-adapter/js-debug/src/dapDebugServer.js"
-- 			--
-- 			-- dap.adapters["pwa-node"] = {
-- 			-- 	type = "server",
-- 			-- 	host = "localhost",
-- 			-- 	port = "${port}",
-- 			-- 	executable = {
-- 			-- 		command = "node",
-- 			-- 		args = { js_debug_path, "${port}" },
-- 			-- 	},
-- 			-- }
-- 			--
-- 			-- local js_filetypes = {
-- 			-- 	"javascript",
-- 			-- 	"typescript",
-- 			-- 	"javascriptreact",
-- 			-- 	"typescriptreact",
-- 			-- }
-- 			--
-- 			-- for _, lang in ipairs(js_filetypes) do
-- 			-- 	dap.configurations[lang] = {
-- 			-- 		{
-- 			-- 			type = "pwa-node",
-- 			-- 			request = "launch",
-- 			-- 			name = "Launch File",
-- 			-- 			program = "${file}",
-- 			-- 			cwd = vim.fn.getcwd(),
-- 			-- 		},
-- 			-- 		{
-- 			-- 			type = "pwa-node",
-- 			-- 			request = "attach",
-- 			-- 			name = "Attach to Process",
-- 			-- 			cwd = vim.fn.getcwd(),
-- 			-- 			processId = require("dap.utils").pick_process,
-- 			-- 		},
-- 			-- 	}
-- 			-- end
--
-- 			---------------------------------------------------------------------
-- 			-- SIGN ICONS
-- 			---------------------------------------------------------------------
-- 			vim.api.nvim_set_hl(0, "DapStoppedLine", { default = true, link = "Visual" })
--
-- 			local dap_icons = {
-- 				Stopped = { "󰁕 ", "DiagnosticWarn", "DapStoppedLine" },
-- 				Breakpoint = " ",
-- 				BreakpointCondition = " ",
-- 				BreakpointRejected = { " ", "DiagnosticError" },
-- 				LogPoint = ".>",
-- 			}
--
-- 			for name, sign in pairs(dap_icons) do
-- 				-- Always convert string → table
-- 				if type(sign) ~= "table" then
-- 					sign = { sign }
-- 				end
--
-- 				vim.fn.sign_define("Dap" .. name, {
-- 					text = sign[1],
-- 					texthl = sign[2] or "DiagnosticInfo",
-- 					linehl = sign[3] or "",
-- 					numhl = sign[3] or "",
-- 				})
-- 			end
-- 		end,
-- 	},
--
-- 	---------------------------------------------------------------------
-- 	-- DAP UI
-- 	---------------------------------------------------------------------
-- 	{
-- 		"rcarriga/nvim-dap-ui",
-- 		dependencies = { "nvim-neotest/nvim-nio" },
-- 		keys = {
-- 			{
-- 				"<leader>du",
-- 				function()
-- 					require("dapui").toggle({})
-- 				end,
-- 				desc = "Dap UI",
-- 			},
-- 			{
-- 				"<leader>de",
-- 				function()
-- 					require("dapui").eval()
-- 				end,
-- 				desc = "Eval",
-- 				mode = { "n", "v" },
-- 			},
-- 		},
-- 		opts = {
-- 			controls = { enabled = false },
-- 		},
-- 		config = function()
-- 			local dap = require("dap")
-- 			local dapui = require("dapui")
-- 			dapui.setup({
-- 				icons = { expanded = "▾", collapsed = "▸", current_frame = "*" },
-- 				controls = {
-- 					icons = {
-- 						pause = "⏸",
-- 						play = "▶",
-- 						step_into = "⏎",
-- 						step_out = "⏭",
-- 						step_over = "⏮",
-- 						step_back = "b",
-- 						run_last = "▶▶",
-- 						terminate = "⏹",
-- 						disconnect = "⏏",
-- 					},
-- 				},
-- 			})
--
-- 			-- Automatically open/close DAP UI
-- 			dap.listeners.after.event_initialized["dapui_config"] = dapui.open
-- 			dap.listeners.before.event_terminated["dapui_config"] = dapui.close
-- 			dap.listeners.before.event_exited["dapui_config"] = dapui.close
--
-- 			require("nvim-dap-virtual-text").setup()
-- 			require("overseer").enable_dap()
-- 		end,
-- 	},
-- }

return {
	{
		"mfussenegger/nvim-dap",
		dependencies = {
			"rcarriga/nvim-dap-ui",
			"stevearc/overseer.nvim",

			"theHamsta/nvim-dap-virtual-text",
		},

		keys = {
			{
				"<leader>da",
				function()
					require("dap").continue()
				end,
				desc = "Run with Args",
			},
			{
				"<leader>db",
				function()
					require("dap").toggle_breakpoint()
				end,
				desc = "Toggle Breakpoint",
			},
			-- { "<leader>dB", function() require("dap").set_breakpoint(vim.fn.input('Breakpoint condition: ')) end, desc = "Breakpoint Condition" },
			-- { "<leader>dC", function() require("dap").run_to_cursor() end, desc = "Run to Cursor" },
			-- { "<leader>dc", function() require("dap").continue() end, desc = "Run/Continue" },
			-- { "<leader>de", function() require("dapui").eval() end, desc = "Evaluate" },
			-- { "<leader>dg", function() require("dap").goto_() end, desc = "Go to Line (No Execute)" },
			-- { "<leader>di", function() require("dap").step_into() end, desc = "Step Into" },
			-- { "<leader>dj", function() require("dap").down() end, desc = "Down" },
			-- { "<leader>dk", function() require("dap").up() end, desc = "Up" },
			-- { "<leader>dl", function() require("dap").run_last() end, desc = "Run Last" },
			-- { "<leader>do", function() require("dap").step_over() end, desc = "Step Over" },
			-- { "<leader>dO", function() require("dap").step_out() end, desc = "Step Out" },
			-- { "<leader>dP", function() require("dap").pause() end, desc = "Pause" },
			-- { "<leader>dr", function() require("dap").repl.toggle() end, desc = "Toggle REPL" },
			-- { "<leader>ds", function() require("dap").session() end, desc = "Session" },
			-- { "<leader>dt", function() require("dap").terminate() end, desc = "Terminate" },
			-- { "<leader>du", function() require("dapui").toggle() end, desc = "Toggle DAPUI" },
			-- { "<leader>dw", function() require("dap.ui.widgets").hover() end, desc = "Widgets" },
		},

		config = function()
			local dap = require("dap")

			---------------------------------------------------------------------
			-- PYTHON
			---------------------------------------------------------------------
			dap.adapters.python = {
				type = "executable",
				command = "/usr/bin/python3",
				args = { "-m", "debugpy.adapter" },
			}

			dap.configurations.python = {
				{
					type = "python",
					request = "launch",
					name = "Launch file",
					program = "${file}",
					pythonPath = function()
						-- If you're using pyenv/virtualenv, replace this
						return "/usr/bin/python3"
					end,
				},
			}

			---------------------------------------------------------------------
			-- JAVASCRIPT + TYPESCRIPT
			---------------------------------------------------------------------
			if not dap.adapters["pwa-node"] then
				dap.adapters["pwa-node"] = {
					type = "server",
					host = "localhost",
					port = "${port}",
					executable = {
						command = "node",
						args = {
							vim.env.MASON .. "/packages/" .. "js-debug-adapter" .. "/js-debug/src/dapDebugServer.js",
							"${port}",
						},
					},
				}
			end

			if not dap.adapters["node"] then
				dap.adapters["node"] = function(cb, config)
					if config.type == "node" then
						config.type = "pwa-node"
					end
					local nativeAdapter = dap.adapters["pwa-node"]
					if type(nativeAdapter) == "function" then
						nativeAdapter(cb, config)
					else
						cb(nativeAdapter)
					end
				end
			end

			local js_filetypes = { "typescript", "javascript", "typescriptreact", "javascriptreact" }
			local vscode = require("dap.ext.vscode")
			vscode.type_to_filetypes["node"] = js_filetypes
			vscode.type_to_filetypes["pwa-node"] = js_filetypes

			for _, language in ipairs(js_filetypes) do
				if not dap.configurations[language] then
					dap.configurations[language] = {
						{
							type = "pwa-node",
							request = "launch",
							name = "Launch file",
							program = "${file}",
							cwd = "${workspaceFolder}",
							runtimeExecutable = "/usr/local/bin/node",
							runtimeArgs = { "-r", "ts-node/register" },
							sourceMaps = true,
							skipFiles = { "<node_internals>/**", "${workspaceFolder}/node_modules/**" },
						},
						{
							type = "pwa-node",
							request = "attach",
							name = "Attach",
							processId = require("dap.utils").pick_process,
							cwd = "${workspaceFolder}",
							runtimeExecutable = "/usr/local/bin/node",
							runtimeArgs = { "-r", "ts-node/register" },
							sourceMaps = true,
							skipFiles = { "<node_internals>/**", "${workspaceFolder}/node_modules/**" },
						},
					}
				end
			end

			---------------------------------------------------------------------
			-- DAP UI
			---------------------------------------------------------------------
			vim.api.nvim_set_hl(0, "DapStoppedLine", { default = true, link = "Visual" })

			local dap_icons = {
				Stopped = { "󰁕 ", "DiagnosticWarn", "DapStoppedLine" },
				Breakpoint = " ",
				BreakpointCondition = " ",
				BreakpointRejected = { " ", "DiagnosticError" },
				LogPoint = ".>",
			}

			for name, sign in pairs(dap_icons) do
				-- Always convert string → table
				if type(sign) ~= "table" then
					sign = { sign }
				end

				vim.fn.sign_define("Dap" .. name, {
					text = sign[1],
					texthl = sign[2] or "DiagnosticInfo",
					linehl = sign[3] or "",
					numhl = sign[3] or "",
				})
			end

			-- Fix JSON with comments
			local json = require("plenary.json")
			vscode.json_decode = function(str)
				return vim.json.decode(json.json_strip_comments(str))
			end

			require("overseer").enable_dap()
		end,
	},

	{
		"rcarriga/nvim-dap-ui",
		dependencies = { "nvim-neotest/nvim-nio" },
		keys = {
			{
				"<leader>du",
				function()
					require("dapui").toggle({})
				end,
				desc = "Dap UI",
			},
			{
				"<leader>de",
				function()
					require("dapui").eval()
				end,
				desc = "Eval",
				mode = { "n", "v" },
			},
		},
		opts = {
			controls = {
				enabled = false,
			},
		},
		config = function()
			local dap = require("dap")
			local dapui = require("dapui")
			dapui.setup({
				icons = { expanded = "▾", collapsed = "▸", current_frame = "*" },
				controls = {
					icons = {
						pause = "⏸",
						play = "▶",
						step_into = "⏎",
						step_out = "⏭",
						step_over = "⏮",
						step_back = "b",
						run_last = "▶▶",
						terminate = "⏹",
						disconnect = "⏏",
					},
				},
			})

			dap.listeners.after.event_initialized["dapui_config"] = dapui.open
			dap.listeners.before.event_terminated["dapui_config"] = dapui.close
			dap.listeners.before.event_exited["dapui_config"] = dapui.close

			require("nvim-dap-virtual-text").setup()
		end,
	},
}
