return {
	"hrsh7th/nvim-cmp",
	event = "InsertEnter",
	dependencies = {
		"hrsh7th/cmp-nvim-lsp",
		"hrsh7th/cmp-buffer",
		"hrsh7th/cmp-path",
		{
			"L3MON4D3/LuaSnip",
			-- follow latest release.
			version = "v2.4", -- Replace <CurrentMajor> by the latest released major (first number of latest release)
			build = "make install_jsregexp",
		},
		"saadparwaiz1/cmp_luasnip", -- for autocompletion
		"rafamadriz/friendly-snippets", -- useful snippets
	},
	config = function()
		local luasnip = require("luasnip")
		require("luasnip.loaders.from_vscode").lazy_load()
		require("cmp").setup({
			snippet = {
				expand = function(args)
					luasnip.lsp_expand(args.body)
				end,
			},
			completion = { completeopt = "menu,menuone,preview,noselect" },
			mapping = require("cmp").mapping.preset.insert({
				["<C-k>"] = require("cmp").mapping.select_prev_item(),
				["<Tab>"] = require("cmp").mapping.select_next_item(),
				["<C-Space>"] = require("cmp").mapping.complete(),
				["<C-e>"] = require("cmp").mapping.abort(),
				["<CR>"] = require("cmp").mapping.confirm({ select = false }),
			}),
			sources = require("cmp").config.sources({
				{ name = "nvim_lsp" },
				{ name = "buffer" },
				{ name = "path" },
				{ name = "luasnip" },
			}),
		})
	end,
}
