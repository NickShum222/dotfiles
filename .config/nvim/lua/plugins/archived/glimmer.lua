return { -- mini animation when copying
	"rachartier/tiny-glimmer.nvim",
	event = "VeryLazy",
	priority = 10, -- Needs to be a really low priority, to catch others plugins keybindings.
	opts = {
		overwrite = {
			auto_map = true,
			yank = { enabled = true },
			paste = {
				enabled = false,
			},
		},
	},
}
