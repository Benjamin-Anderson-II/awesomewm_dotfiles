local ll = {
	lualine_b = {'branch', 'diff', {'diagnostics', symbols = {error = 'E', warn = 'W', info = 'I', hint = 'H'}, update_in_insert = true,}},
	lualine_x = {'encoding', {'fileformat', symbols = {unix = 'unix', dos = 'dos', mac = 'mac' }}, 'filetype'},
}

return {
	"nvim-lualine/lualine.nvim",
	event = "VeryLazy",
	opts = function(_, opts)
		table.insert(opts, { ['ll'] = ll })
	end,
}
