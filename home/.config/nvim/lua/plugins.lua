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
  use { 'neoclide/coc.nvim', branch = "release" }
  --use 'dense-analysis/ale'

  use 'vimsence/vimsence'

  use {
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
  --use 'airblade/vim-gitgutter'
  use {
    'lewis6991/gitsigns.nvim',
  }
  use 'tpope/vim-fugitive'

  use 'preservim/tagbar'
  use 'jiangmiao/auto-pairs'

  use { 'junegunn/fzf', run = vim.fn["fzf#install()"] }
  use { 'junegunn/fzf.vim' }
  
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
  use 'SirVer/ultisnips'
  use 'honza/vim-snippets'
  use 'sheerun/vim-polyglot'
  
  use { 'mhinz/vim-startify' }
  
  use 'wakatime/vim-wakatime'
  
  use { 'mbbill/undotree' }
  
  use { 'junegunn/rainbow_parentheses.vim' }

  use { 'psliwka/vim-smoothie' }

  use { 'IngoMeyer441/coc_current_word' }

  use { "gbprod/yanky.nvim" }

  use "rhysd/vim-grammarous"

  --use {
  --  "nvim-neo-tree/neo-tree.nvim",
  --  branch = "v2.x",
  --  requires = { 
  --    "nvim-lua/plenary.nvim",
  --    "kyazdani42/nvim-web-devicons", -- not strictly required, but recommended
  --    "MunifTanjim/nui.nvim",
  --  }
  --}

--  use { 'Yggdroot/indentLine' }
--  use {
--  "nvim-neo-tree/neo-tree.nvim",
--    branch = "v2.x",
--    requires = { 
--      "nvim-lua/plenary.nvim",
--      "kyazdani42/nvim-web-devicons", -- not strictly required, but recommended
--      "MunifTanjim/nui.nvim" 
--    },
--  }
  
  -- status bar
  --use 'vim-airline/vim-airline'
  --use 'vim-airline/vim-airline-themes'
  use {
    'nvim-lualine/lualine.nvim',
    requires = { 'kyazdani42/nvim-web-devicons', opt = true }
  }
  use {'akinsho/bufferline.nvim', tag = "v3.*", requires = 'kyazdani42/nvim-web-devicons'}

  -- themes
  --use 'navarasu/onedark.nvim'
  --use 'rmehri01/onenord.nvim'
  --use 'sainnhe/gruvbox-material'
  use {
    "catppuccin/nvim",
    as = "catppuccin"
  }
  --use 'morhetz/gruvbox'
  --use {'dracula/vim', as = 'dracula'}
  use { 'ryanoasis/vim-devicons' }
  --use 'shaunsingh/nord.nvim'

  -- javascript / typescript
  use { 'yuezk/vim-js', ft = "javascript" }

  -- html
  use { 'mattn/emmet-vim', ft = {"html", "css", "scss" } }

  -- log
  use { 'MTDL9/vim-log-highlighting', ft = "log" }

  -- markdown
  use { 'junegunn/vim-emoji', ft = "markdown" }
  use {
    'iamcco/markdown-preview.nvim',
    run = 'cd app && yarn install',
    cmd = 'MarkdownPreview',
    ft = "markdown"
  }
  use { 'dkarter/bullets.vim', ft = "markdown"}
  --use {'edluffy/hologram.nvim'}

  -- go
  use { 'fatih/vim-go', ft = "go" }

  -- nix
  use {"LnL7/vim-nix", ft = "nix"}

  -- d2
  use {"terrastruct/d2-vim", ft = "d2"}
end,
config = {
  display = {
    open_fn = require('packer.util').float,
  }
}})
