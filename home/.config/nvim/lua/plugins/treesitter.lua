local present, treesitter = pcall(require, "nvim-treesitter.configs")
local parser_config = require("nvim-treesitter.parsers").get_parser_configs()

if not present then
	return
end

vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "nvim_treesitter#foldexpr()"

local M = {}
-- function to create a list of commands and convert them to autocommands
-------- This function is taken from https://github.com/norcalli/nvim_utils
function M.nvim_create_augroups(definitions)
	for group_name, definition in pairs(definitions) do
		vim.api.nvim_command("augroup " .. group_name)
		vim.api.nvim_command("autocmd!")
		for _, def in ipairs(definition) do
			local command = table.concat(vim.tbl_flatten({ "autocmd", def }), " ")
			vim.api.nvim_command(command)
		end
		vim.api.nvim_command("augroup END")
	end
end

local autoCommands = {
	-- other autocommands
	open_folds = {
		{ "BufReadPost,FileReadPost", "*", "normal zR" },
	},
}

M.nvim_create_augroups(autoCommands)

parser_config.nu = {
	install_info = {
		url = "https://github.com/nushell/tree-sitter-nu",
		files = { "src/parser.c" },
		branch = "main",
	},
	filetype = "nu",
}

local options = {
	ensure_installed = {
		"lua",
		"go",
		"gomod",
		"gosum",
		"python",
		"javascript",
		"typescript",
		"yaml",
		"nix",
		"json",
		"fish",
		"bash",
		"dockerfile",
		"scss",
		"tsx",
		"html",
		"markdown",
		"rust",
		"toml",
		"regex",
		"markdown_inline",
		"nu",
		"jsonnet",
	},

	sync_install = false,

	auto_install = true,

	highlight = {
		enable = true,
		use_languagetree = true,
	},

	indent = {
		enable = true,
	},
}

treesitter.setup(options)
