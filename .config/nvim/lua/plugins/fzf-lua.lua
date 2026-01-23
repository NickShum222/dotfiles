return {
	"ibhagwan/fzf-lua",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		local fzf = require("fzf-lua")
		fzf.setup({
			winopts = {
				height = 0.90,
				width = 0.95,
				preview = {
					default = "builtin",
					layout = "right",
					horizontal = "right",
					vertical = "down",
					flip_columns = 120,
				},
			},

			grep = {
				rg_opts = "--column --line-number --no-heading --color=always --smart-case --fixed-strings",
			},

			keymap = {
				builtin = {
					["<C-h>"] = "preview-page-up",
					["<C-l>"] = "preview-page-down",
				},
			},
		})

		local keymap = vim.keymap

		keymap.set("n", "<leader>ff", function()
			fzf.files()
		end, { desc = "FZF: find files" })

		keymap.set("n", "<leader>fr", function()
			fzf.oldfiles()
		end, { desc = "FZF: recent files" })

		keymap.set("n", "<leader>fs", function()
			fzf.live_grep()
		end, { desc = "FZF: live grep" })

		keymap.set("n", "<leader>fc", function()
			fzf.grep_cword()
		end, { desc = "FZF: grep word under cursor" })
	end,
}
