-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")

-- enable absolute or relative numbers if you like
vim.opt.number = true
vim.opt.relativenumber = true -- or `true` for hybrid

-- hide the sign-column if you don't need it,
-- so you don't end up with an extra column there
vim.opt.signcolumn = "no"

-- set the minimum width for the number-column
vim.opt.numberwidth = 2 -- or even `1` if you really only want single digits
