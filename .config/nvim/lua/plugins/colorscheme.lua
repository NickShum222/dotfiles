return {
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
	-- {
	-- 	"luisiacc/gruvbox-baby",
	-- 	lazy = false,
	-- 	priority = 1000,
	-- 	config = function()
	-- 		vim.g.gruvbox_baby_telescope_theme = 1
	-- 		vim.cmd.colorscheme("gruvbox-baby")
	-- 	end,
	-- },
	-- {
	-- 	"sainnhe/sonokai",
	-- 	lazy = false,
	-- 	priority = 1000,
	-- 	config = function()
	-- 		vim.g.sonokai_style = "espresso"
	-- 		vim.g.sonokai_better_performance = 1
	-- 		vim.cmd.colorscheme("sonokai")
	-- 	end,
	-- },
	-- {
	-- 	"rebelot/kanagawa.nvim",
	-- 	priority = 1000, -- Make sure it's loaded before other plugins
	-- 	config = function()
	-- 		require("kanagawa").setup({
	-- 			compile = false,
	-- 			undercurl = true,
	-- 			commentStyle = { italic = true },
	-- 			functionStyle = {},
	-- 			keywordStyle = { italic = true },
	-- 			statementStyle = { bold = true },
	-- 			typeStyle = {},
	-- 			transparent = false,
	-- 			dimInactive = false,
	-- 			terminalColors = true,
	-- 			colors = {
	-- 				palette = {},
	-- 				theme = { wave = {}, lotus = {}, dragon = {}, all = {} },
	-- 			},
	-- 			overrides = function(colors)
	-- 				return {}
	-- 			end,
	-- 			theme = "wave",
	-- 			background = {
	-- 				dark = "wave",
	-- 				light = "lotus",
	-- 			},
	-- 		})
	-- 		vim.cmd("colorscheme kanagawa-dragon")
	-- 	end,
	-- },
}
