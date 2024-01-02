-- Setup auto-recompilation of the packer config
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerCompile
  augroup end
]])

-- The plugins list
return require('packer').startup({function()
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'
  
  -- ide
  use {
    -- base software
    "williamboman/mason.nvim",
    
    -- lsp
    "williamboman/mason-lspconfig.nvim",
    "neovim/nvim-lspconfig",

    -- dap
    'mfussenegger/nvim-dap',

    -- linters / formatters
    "jose-elias-alvarez/null-ls.nvim",
    
    -- other
    { 'j-hui/fidget.nvim', opts = {} },
    'folke/neodev.nvim',
    "hrsh7th/cmp-nvim-lsp",
    "hrsh7th/cmp-path",
    'hrsh7th/nvim-cmp',
    'nvim-lua/plenary.nvim',

    run = ":MasonUpdate" -- :MasonUpdate updates registry contents
  }
  use{"tami5/lspsaga.nvim"} --> icons for LSP diagnostics
  use{"onsails/lspkind-nvim"} --> vscode-like pictograms for neovim lsp completion items
  use { 'L3MON4D3/LuaSnip' } --> snippets in completion
  use { 'saadparwaiz1/cmp_luasnip' } --> integration with the completion engine

  use 'andweeb/presence.nvim'

  use { --> awesome UI
    "folke/noice.nvim",
    event = "VimEnter",
    config = function()
      require("noice").setup()
    end,
    requires = {
      "MunifTanjim/nui.nvim",
      "rcarriga/nvim-notify",
      }
  }
  use { --> Little git signs on the left side of the screen
    'lewis6991/gitsigns.nvim',
  }
  --use 'tpope/vim-fugitive'

  use 'preservim/tagbar'
  use {
    "utilyre/sentiment.nvim",
    tag = "*",
    config = function()
      require("sentiment").setup({})
    end,
  }
  use {
    "windwp/nvim-autopairs",
    config = function() require("nvim-autopairs").setup {} end
  }

  use {
    'nvim-telescope/telescope.nvim',
    requires = { 
      "nvim-lua/plenary.nvim",
      "BurntSushi/ripgrep",
      "sharkdp/fd",
      "nvim-treesitter/nvim-treesitter",
      "kyazdani42/nvim-web-devicons", -- not strictly required, but recommended
      "nvim-telescope/telescope-github.nvim"
    }
  }
  use {
    'nvim-telescope/telescope-fzf-native.nvim', 
    run = 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build' 
  }
  
  use { 
    'nvim-treesitter/nvim-treesitter', 
    run = ':TSUpdate' 
  }
  use { 
    'nvim-treesitter/nvim-treesitter-context',
    requires = {
      "nvim-treesitter/nvim-treesitter",
    },
  }

  use { 'editorconfig/editorconfig-vim' }

  -- editor
  use { 'mhinz/vim-startify' }
  
  use 'wakatime/vim-wakatime'
  
  use { 'mbbill/undotree' }
  
  --use { 'junegunn/rainbow_parentheses.vim' }

  use { 'psliwka/vim-smoothie' }

  use { "gbprod/yanky.nvim" }

  --use "rhysd/vim-grammarous"

  use {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v2.x",
    requires = { 
      "nvim-lua/plenary.nvim",
      "kyazdani42/nvim-web-devicons", -- not strictly required, but recommended
      "MunifTanjim/nui.nvim",
    }
  }

  use {
    -- Add indentation guides even on blank lines
    'lukas-reineke/indent-blankline.nvim',
    -- Enable `lukas-reineke/indent-blankline.nvim`
    -- See `:help indent_blankline.txt`
    opts = {
      char = '┊',
      show_trailing_blankline_indent = false,
    },
  }
  
  -- status bar
  use {
    'nvim-lualine/lualine.nvim',
    requires = { 'kyazdani42/nvim-web-devicons', opt = true }
  }
  use {'akinsho/bufferline.nvim', tag = "v3.*", requires = 'kyazdani42/nvim-web-devicons'}

  -- themes
  use {
    "catppuccin/nvim",
    as = "catppuccin"
  }
  use { 'ryanoasis/vim-devicons' }

  -- log
  use { 'MTDL9/vim-log-highlighting', ft = "log" }

  -- d2
  use {"terrastruct/d2-vim", ft = "d2"}

  -- rust
  use { 'simrat39/rust-tools.nvim' }
end,
config = {
  display = {
    open_fn = require('packer.util').float,
  }
}})
