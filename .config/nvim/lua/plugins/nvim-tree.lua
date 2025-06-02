return {
	"nvim-tree/nvim-tree.lua",
	dependencies = "nvim-tree/nvim-web-devicons",
	config = function()
		require("nvim-tree").setup({
			diagnostics = { enable = true },
			renderer = {
				icons = {
					show = {
						file = true,
						folder = false,
						folder_arrow = true,
						modified = true,
						hidden = false,
						diagnostics = false,
						bookmarks = false,
					},
				},
			},
			actions = { open_file = { quit_on_open = true } },
			filters = { dotfiles = false, custom = { "^.DS_Store$", "^\\.git$" } },
			git = { enable = true, ignore = false, timeout = 500 },
      view = {side = "right", width = 30},
		})
        local keymap = vim.keymap -- for conciseness

    keymap.set("n", "<leader>ee", "<cmd>NvimTreeToggle<CR>", { desc = "Toggle file explorer" }) -- toggle file explorer
    keymap.set("n", "<leader>ef", "<cmd>NvimTreeFindFileToggle<CR>", { desc = "Toggle file explorer on current file" }) -- toggle file explorer on current file
    keymap.set("n", "<leader>ec", "<cmd>NvimTreeCollapse<CR>", { desc = "Collapse file explorer" }) -- collapse file explorer
    keymap.set("n", "<leader>er", "<cmd>NvimTreeRefresh<CR>", { desc = "Refresh file explorer" }) -- refresh file explorer
	end,
}
