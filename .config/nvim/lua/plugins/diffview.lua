return {
	"sindrets/diffview.nvim",
	dependencies = { "nvim-lua/plenary.nvim" },
	config = function()
		local dv = require("diffview")

		vim.keymap.set("n", "<leader>do", ":DiffviewOpen<CR>", { desc = "Open diff view" })
		vim.keymap.set("n", "<leader>dc", ":DiffviewClose<CR>", { desc = "Close diff view" })
		vim.keymap.set("n", "<leader>df", ":DiffviewFileHistory %<CR>", { desc = "File history" })
		vim.keymap.set("n", "<leader>dh", ":DiffviewFileHistory<CR>", { desc = "Repo history" })
	end,
}
