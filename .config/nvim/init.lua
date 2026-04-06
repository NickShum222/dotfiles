local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
	local lazyrepo = "https://github.com/folke/lazy.nvim.git"
	local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
	if vim.v.shell_error ~= 0 then
		vim.api.nvim_echo({
			{ "Failed to clone lazy.nvim:\n", "ErrorMsg" },
			{ out, "WarningMsg" },
			{ "\nPress any key to exit..." },
		}, true, {})
		vim.fn.getchar()
		os.exit(1)
	end
end
vim.opt.rtp:prepend(lazypath)

-- Make sure to setup `mapleader` and `maplocalleader` before
-- loading lazy.nvim so that mappings are correct.
-- This is also a good place to setup other settings (vim.opt)
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- Keybinds
vim.keymap.set("n", "<leader>nh", ":nohl<CR>", { desc = "Clear search highlights" })
vim.keymap.set("n", "<leader>sv", "<C-w>v", { desc = "Split window vertically" }) -- split window vertically
vim.keymap.set("n", "<leader>sh", "<C-w>s", { desc = "Split window horizontally" }) -- split window horizontally
vim.keymap.set("n", "k", "v:count == 0 ? 'gk' : 'k'", { expr = true })
vim.keymap.set("n", "j", "v:count == 0 ? 'gj' : 'j'", { expr = true })
vim.keymap.set("v", "p", '"_dp')
vim.keymap.set("v", "P", '"_dP')

vim.o.relativenumber = true
vim.o.number = true
vim.o.cursorline = true

vim.o.tabstop = 2 -- 2 spaces for tabs (prettier default)
vim.o.shiftwidth = 2 -- 2 spaces for indent width
vim.o.expandtab = true -- expand tab to spaces
vim.o.smartindent = true
vim.o.linebreak = true

vim.o.ignorecase = true -- ignore case when searching
vim.o.smartcase = true -- if you include mixed case in your search, assumes you want case-sensitive

vim.o.termguicolors = true

vim.opt.clipboard:append("unnamedplus") -- use system clipboard as default register

vim.o.confirm = true

vim.o.undofile = true
vim.o.undodir = vim.fn.stdpath("state") .. "/undo"

require("lazy").setup({
	{
		"stevearc/oil.nvim",
		lazy = false,
		vim.keymap.set("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory in Oil" }),
		config = function()
			require("oil").setup({
				view_options = { show_hidden = true },
			})
		end,
	},
	{
		"srcery-colors/srcery-vim",
		lazy = false,
		priority = 1000,
		config = function()
			vim.g.srcery_italic = 1
			vim.g.srcery_bold = 1
			vim.g.srcery_inverse = 0
			vim.g.srcery_undercurl = 0
			vim.cmd.colorscheme("srcery")

			vim.cmd([[
			highlight Normal guibg=#000000 ctermbg=0
			highlight NormalNC guibg=#000000 ctermbg=0
			highlight SignColumn guibg=#000000 ctermbg=0
			highlight LineNr guibg=#000000 ctermbg=0
			highlight FoldColumn guibg=#000000 ctermbg=0
			highlight VertSplit guibg=#000000 ctermbg=0
			highlight StatusLine guibg=#000000 ctermbg=0
			highlight EndOfBuffer guibg=#000000 ctermbg=0
		]])
		end,
	},
	{
		"nvim-lua/plenary.nvim",
		"christoomey/vim-tmux-navigator",
	},
	{
		"windwp/nvim-autopairs",
		event = "InsertEnter",
		config = true,
	},
	{
		"neovim/nvim-lspconfig",
		dependencies = {
			"williamboman/mason.nvim",
			"williamboman/mason-lspconfig.nvim",
			"saghen/blink.cmp",
			"ibhagwan/fzf-lua",
		},
		config = function()
			require("mason").setup()
			require("mason-lspconfig").setup({
				handlers = {
					function(server_name)
						require("lspconfig")[server_name].setup({
							capabilities = require("blink.cmp").get_lsp_capabilities(),
						})
					end,
				},
			})
			vim.api.nvim_create_autocmd("LspAttach", {
				group = vim.api.nvim_create_augroup("UserLspConfig", { clear = true }),

				callback = function(ev)
					local opts = { buffer = ev.buf, silent = true }
					local fzf = require("fzf-lua")

					vim.keymap.set("n", "gd", fzf.lsp_definitions, opts)
					vim.keymap.set("n", "gr", fzf.lsp_references, opts)
					vim.keymap.set("n", "gi", fzf.lsp_implementations, opts)
					vim.keymap.set("n", "gt", fzf.lsp_typedefs, opts)
					vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)

					vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts)
					vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)

					vim.keymap.set("n", "<leader>D", fzf.diagnostics_document, opts)
					vim.keymap.set("n", "<leader>d", vim.diagnostic.open_float, opts)

					vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)

					vim.keymap.set("n", "<leader>ds", fzf.lsp_document_symbols, opts)
					vim.keymap.set("n", "<leader>ws", fzf.lsp_workspace_symbols, opts)
				end,
			})
		end,
	},
	{
		"saghen/blink.cmp",
		version = "1.*",
		opts = {
			keymap = {
				preset = "super-tab",
			},
		},
	},
	{
		"stevearc/conform.nvim",
		event = { "BufReadPre", "BufNewFile" },
		config = function()
			local conform = require("conform")
			conform.setup({
				formatters = {
					["google-java-format"] = {
						command = "java",
						args = { "-jar", vim.fn.expand("~/.local/bin/google-java-format.jar"), "-" },
						stdin = true,
					},
				},
				formatters_by_ft = {
					cpp = { "clang-format" },
					c = { "clang-format" },
					python = { "black" },
					javascript = { "prettier" },
					typescript = { "prettier" },
					javascriptreact = { "prettier" },
					typescriptreact = { "prettier" },
					java = { "google-java-format" },
				},
				format_on_save = {
					lsp_fallback = true,
					timeout_ms = 500,
				},
			})
		end,
	},
	{
		"arnamak/stay-centered.nvim",
		lazy = false,
		opts = {},
	},
	{
		"ibhagwan/fzf-lua",
		config = function()
			local fzf = require("fzf-lua")
			fzf.setup({
				grep = {
					rg_opts = "--column --line-number --no-heading --color=always --smart-case --fixed-strings",
				},
			})
			vim.keymap.set("n", "<leader>ff", function()
				fzf.files()
			end, { desc = "FZF: find files" })

			vim.keymap.set("n", "<leader>fs", function()
				fzf.live_grep()
			end, { desc = "FZF: live grep" })
		end,
	},
	{
		"nvim-treesitter/nvim-treesitter",
		event = { "BufReadPre", "BufNewFile" },
		branch = "master",
		lazy = false,
		build = ":TSUpdate",
		dependencies = {
			"windwp/nvim-ts-autotag",
		},
		config = function()
			require("nvim-treesitter.configs").setup({
				ensure_installed = { "c", "cpp", "python", "javascript", "typescript", "tsx" },
				highlight = { enable = true },
				indent = { enable = true },
			})
			vim.treesitter.language.register("tsx", "typescriptreact")
			require("nvim-ts-autotag").setup()
		end,
	},
})
