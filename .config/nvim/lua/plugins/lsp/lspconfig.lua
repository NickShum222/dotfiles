return {
	"neovim/nvim-lspconfig",
	event = { "BufReadPre", "BufNewFile" },
	dependencies = {
		"hrsh7th/cmp-nvim-lsp",
		"antosha417/nvim-lsp-file-operations",
		"folke/lazydev.nvim",
	},
	config = function()
		vim.api.nvim_create_autocmd("LspAttach", {
			group = vim.api.nvim_create_augroup("UserLspConfig", {}),
			callback = function(ev)
				local opts = { buffer = ev.buf, silent = true }
				local fzf = require("fzf-lua")

				vim.keymap.set("n", "gR", function()
					fzf.lsp_references()
				end, opts)
				vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
				vim.keymap.set("n", "gd", function()
					fzf.lsp_definitions()
				end, opts)
				vim.keymap.set("n", "gi", function()
					fzf.lsp_implementations()
				end, opts)
				vim.keymap.set("n", "gt", function()
					fzf.lsp_typedefs()
				end, opts)

				vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts)
				vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)

				vim.keymap.set("n", "<leader>D", function()
					fzf.diagnostics_document()
				end, opts)
				vim.keymap.set("n", "<leader>d", vim.diagnostic.open_float, opts)

				vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
				vim.keymap.set("n", "<leader>rs", "<cmd>LspRestart<CR>", opts)

				vim.keymap.set("n", "<leader>ds", function()
					require("fzf-lua").lsp_document_symbols()
				end, opts)

				vim.keymap.set("n", "<leader>ws", function()
					require("fzf-lua").lsp_workspace_symbols()
				end, opts)
			end,
		})
	end,
}
