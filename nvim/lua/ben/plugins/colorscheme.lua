return {
	"catppuccin/nvim",
	priority = 1000,
	name = "catppuccin",
	config = function()
		vim.g.catppuccin_flavour = "macchiato",
		vim.cmd([[colorscheme catppuccin]])
	end,
}
