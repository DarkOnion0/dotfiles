-- Setup auto-recompilation of the packer config
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerCompile
  augroup end
]])

-- The plugins list
return require('packer').startup(function()
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'
  
  -- ide
  use { 'neoclide/coc.nvim', branch = "release" }
  use 'dense-analysis/ale'

  use 'vimsence/vimsence'
  --use 'airblade/vim-gitgutter'
  use 'tpope/vim-fugitive'

  use 'preservim/tagbar'
  use 'jiangmiao/auto-pairs'

  use { 'junegunn/fzf', run = vim.fn["fzf#install()"] }
  use 'junegunn/fzf.vim'
  
  use { 
    'nvim-treesitter/nvim-treesitter', 
    run = ':TSUpdate' 
  }

  use { 'wellle/context.vim' }

  --use { 'Shougo/deoplete.nvim' }
  
  use { 'editorconfig/editorconfig-vim' }

  -- editor
  use 'SirVer/ultisnips'
  use 'honza/vim-snippets'
  use 'sheerun/vim-polyglot'
  
  use { 'mhinz/vim-startify' }
  
  use 'wakatime/vim-wakatime'
  
  use { 'mbbill/undotree' }
  
  use { 'junegunn/rainbow_parentheses.vim' }

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
  use 'vim-airline/vim-airline'
  use 'vim-airline/vim-airline-themes'

  -- themes
  use 'joshdick/onedark.vim'
  use 'morhetz/gruvbox'
  use 'arcticicestudio/nord-vim'
  use {'dracula/vim', as = 'dracula'}
  use { 'ryanoasis/vim-devicons' }

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

  -- go
  use { 'fatih/vim-go', ft = "go" }

  -- nix
  use {"LnL7/vim-nix", ft = "nix"}
end)
