return {
	"m4xshen/hardtime.nvim",
	event = "VeryLazy",
	dependencies = { "MunifTanjim/nui.nvim" },
	opts = {
		disable_mouse = true,
		disabled_keys = {
			["<Up>"] = { "n", "x" }, -- Allow <Up> key
			["<Down>"] = { "n", "x" },
			["<Left>"] = { "n", "x" },
			["<Right>"] = { "n", "x" },
		},
		restriction_mode = "hint",
	},
}
