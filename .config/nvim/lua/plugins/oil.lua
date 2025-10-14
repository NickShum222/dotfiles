return {
	"stevearc/oil.nvim",
	---@module 'oil'
	---@type oil.SetupOpts
	opts = {},
	-- Optional dependencies
	dependencies = { "nvim-tree/nvim-web-devicons" }, -- use if you prefer nvim-web-devicons
	lazy = false,
	vim.keymap.set("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory in Oil" }),
	config = function()
		require("oil").setup({
			view_options = { show_hidden = true },
		})
	end,
}
