-- FILE DIRECTORY AS BUFFER
return {
	"stevearc/oil.nvim",
	---@module 'oil'
	---@type oil.SetupOpts
	opts = {},
	dependencies = {},
	lazy = false,
	vim.keymap.set("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory in Oil" }),
	-- vim.keymap.set("n", "<leader>.", "<CMD>OilToggleHidden<CR>", { desc = "Toggle hidden files" }),
	config = function()
		require("oil").setup({
			view_options = { show_hidden = true },
		})
	end,
}
