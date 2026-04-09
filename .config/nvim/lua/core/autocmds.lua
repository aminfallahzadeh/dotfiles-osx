-- ============================================================================
-- Highlight the Yanked Text
-- ============================================================================

vim.api.nvim_create_autocmd("TextYankPost", {
	desc = "Highlight when yanking (copying) text",
	group = vim.api.nvim_create_augroup("kickstart-highlight-yank", { clear = true }),
	callback = function()
		vim.hl.on_yank()
	end,
})

-- ============================================================================
-- Customize ui2 messages
-- ============================================================================

-- change the position
vim.api.nvim_create_autocmd("FileType", {
	pattern = "msg",
	callback = function()
		local ui2 = require("vim._core.ui2")
		local win = ui2.wins and ui2.wins.msg
		if win and vim.api.nvim_win_is_valid(win) then
			vim.api.nvim_set_option_value(
				"winhighlight",
				"Normal:NormalFloat,FloatBorder:FloatBorder",
				{ scope = "local", win = win }
			)
		end
	end,
})

-- customize the ui
local ui2 = require("vim._core.ui2")
local msgs = require("vim._core.ui2.messages")
local orig_set_pos = msgs.set_pos
msgs.set_pos = function(tgt)
	orig_set_pos(tgt)
	if (tgt == "msg" or tgt == nil) and vim.api.nvim_win_is_valid(ui2.wins.msg) then
		pcall(vim.api.nvim_win_set_config, ui2.wins.msg, {
			relative = "editor",
			anchor = "NE",
			row = 1,
			col = vim.o.columns - 1,
			border = "none",
		})
	end
end

-- show progress
-- vim.api.nvim_create_autocmd("LspProgress", {
-- 	callback = function(ev)
-- 		local client = vim.lsp.get_client_by_id(ev.data.client_id)
-- 		local value = ev.data.params.value
-- 		if not (client and value) then
-- 			return
-- 		end
-- 		local msg = ("[%s] %s %s"):format(client.name, value.kind == "end" and "✓" or "", value.title or "")
-- 		vim.notify(msg)
-- 	end,
-- })

vim.api.nvim_create_autocmd("LspProgress", {
	callback = function(ev)
		local value = ev.data.params.value
		vim.api.nvim_echo({ { value.message or "done" } }, false, {
			id = "lsp." .. ev.data.client_id,
			kind = "progress",
			source = "vim.lsp",
			title = value.title,
			status = value.kind ~= "end" and "running" or "success",
			percent = value.percentage,
		})
	end,
})

-- ============================================================================
-- Remove cmd command after leave
-- ============================================================================
vim.api.nvim_create_autocmd("CmdlineLeave", {
	callback = function()
		vim.schedule(function()
			vim.cmd("echo ''")
		end)
	end,
})

-- ============================================================================
-- Highlight the word under the cursor
-- ============================================================================

-- vim.api.nvim_create_autocmd("LspAttach", {
-- 	group = vim.api.nvim_create_augroup("lsp-attach", { clear = true }),
-- 	callback = function(event)
-- 		local function client_supports_method(client, method, bufnr)
-- 			if vim.fn.has("nvim-0.11") == 1 then
-- 				return client:supports_method(method, bufnr)
-- 			else
-- 				return client.supports_method(method, { bufnr = bufnr })
-- 			end
-- 		end
--
-- 		local client = vim.lsp.get_client_by_id(event.data.client_id)
-- 		if
-- 			client
-- 			and client_supports_method(client, vim.lsp.protocol.Methods.textDocument_documentHighlight, event.buf)
-- 		then
-- 			local highlight_augroup = vim.api.nvim_create_augroup("lsp-highlight", { clear = false })
--
-- 			-- When cursor stops moving: Highlights all instances of the symbol under the cursor
-- 			-- When cursor moves: Clears the highlighting
-- 			vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
-- 				buffer = event.buf,
-- 				group = highlight_augroup,
-- 				callback = vim.lsp.buf.document_highlight,
-- 			})
-- 			vim.api.nvim_create_autocmd({ "CursorMoved", "CursorMovedI" }, {
-- 				buffer = event.buf,
-- 				group = highlight_augroup,
-- 				callback = vim.lsp.buf.clear_references,
-- 			})
--
-- 			-- When LSP detaches: Clears the highlighting
-- 			vim.api.nvim_create_autocmd("LspDetach", {
-- 				group = vim.api.nvim_create_augroup("lsp-detach", { clear = true }),
-- 				callback = function(event2)
-- 					vim.lsp.buf.clear_references()
-- 					vim.api.nvim_clear_autocmds({ group = "lsp-highlight", buffer = event2.buf })
-- 				end,
-- 			})
-- 		end
-- 	end,
-- })
