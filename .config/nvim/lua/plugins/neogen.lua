return {
	"danymat/neogen",
	dependencies = {
		"nvim-treesitter/nvim-treesitter",
	},
	config = function()
		require("neogen").setup({
			enabled = true,
			input_after_comment = true,
			languages = {
				c = {
					template = {
						annotation_convention = "doxygen",
					},
				},
				cpp = {
					template = {
						annotation_convention = "doxygen",
					},
				},
			},
		})

		vim.keymap.set("n", "<leader>dg", function()
			require("neogen").generate()
		end, { desc = "Generate documentation (Neogen)" })
	end,
}
