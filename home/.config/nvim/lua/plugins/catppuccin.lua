require("catppuccin").setup()
vim.api.nvim_command("colorscheme catppuccin")

require("catppuccin").setup({
	flavour = "latte",
	background = { -- :h background
		light = "latte",
		dark = "macchiato",
	},
	compile_path = vim.fn.stdpath("cache") .. "/catppuccin",
	transparent_background = false,
	term_colors = false,
	dim_inactive = {
		enabled = true,
		shade = "dark",
		percentage = 0.15,
	},
	styles = {
		comments = { "italic" },
		conditionals = { "italic" },
		loops = {},
		functions = {},
		keywords = {},
		strings = {},
		variables = {},
		numbers = {},
		booleans = {},
		properties = {},
		types = {},
		operators = {},
	},
	integrations = {
		cmp = true,
		gitsigns = true,
		nvimtree = true,
		telescope = true,
		treesitter = true,
		treesitter_context = true,
		notify = true,
	},
	color_overrides = {},
	custom_highlights = {},
})
