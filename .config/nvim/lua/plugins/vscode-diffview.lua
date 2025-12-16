return {
	"esmuellert/vscode-diff.nvim",
	dependencies = { "MunifTanjim/nui.nvim" },
	config = function()
		vim.keymap.set("n", "<leader>do", ":CodeDiff<CR>", { desc = "Open diff view" })
		vim.keymap.set("n", "<leader>dc", ":tabclose<CR>", { desc = "Close diff view" })
	end,
}
