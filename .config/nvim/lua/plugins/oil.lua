-- FILE DIRECTORY AS BUFFER
return {
	"stevearc/oil.nvim",
	lazy = false,
	vim.keymap.set("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory in Oil" }),
	config = function()
		require("oil").setup({
			view_options = { show_hidden = true },
		})
	end,
}
