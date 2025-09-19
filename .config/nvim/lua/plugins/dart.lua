return {
	"iofq/dart.nvim",
	opts = {
		marklist = { "a", "s", "d" },
		buflist = { "l", "k", "j" },
		mappings = {
			mark = ";;", -- Mark current buffer
			jump = ";", -- Jump to buffer marked by next character i.e `;a`
			pick = ";p", -- Open Dart.pick
			next = "<S-l>", -- Cycle right through the tabline
			prev = "<S-h>", -- Cycle left through the tabline
			unmark_all = ";u",
		},
		tabline = {
			always_show = false,
		},
	},
	config = function(_, opts)
		require("dart").setup(opts)
	end,
}
