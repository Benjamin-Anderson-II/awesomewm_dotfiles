return {
	"catppuccin/nvim",
	priority = 1000,
	name = "catppuccin",
	config = function()
		vim.g.catppuccin_flavor = "macchiato"
		vim.cmd([[colorscheme catppuccin]])
	end,
}
