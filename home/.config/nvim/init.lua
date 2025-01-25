--
-- global settings
--

require('plugins')
require('editorSettings')
require('shortcuts')

-- 
-- plugins settings
--

--require('plugins/airline')
--require('plugins/ale')
--require('plugins/mason')
require('plugins/nvim-cmp')
require('plugins/lsp')
require('plugins/emmet')
--require('plugins/vim-go')
require('plugins/vimsence')
--require('plugins/coc')
--require('plugins/coc-explorer')
--require('plugins/coc-git')
require('plugins/editorconfig')
require('plugins/undotree')
--require('plugins/rainbow_parentheses')
require('plugins/context')
--require('plugins/coc-current-word')
require('plugins/treesitter')
--require('plugins/hologram')
require('plugins/telescope')
require('plugins/neo-tree')
require('plugins/lualine')
require('plugins/bufferline')
require('plugins/yanky')
require('plugins/gitsigns-nvim')
require('plugins/lspsaga')
require('plugins/diagflow')
--require('plugins/vim-grammarous')

--
-- global settings that need to be loaded at the end (mostly theme)
--

--require('plugins/onedark-nvim')
require('plugins/catppuccin')
--require('plugins.cyberdream-nvim')
--require('plugins/gruvbox')
require('theme')
