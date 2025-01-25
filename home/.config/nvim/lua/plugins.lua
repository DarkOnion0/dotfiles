-- Install lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable", -- latest stable release
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)

-- The plugins list
return require("lazy").setup({
    -- Packer can manage itself
    "wbthomason/packer.nvim",

    -- ide
    {
        -- base software
        -- "williamboman/mason.nvim",

        -- lsp
        -- "williamboman/mason-lspconfig.nvim",
        "neovim/nvim-lspconfig",
        "nvimdev/lspsaga.nvim", --> lsp sugar
        "onsails/lspkind-nvim", --> vscode-like pictograms for neovim lsp completion items
        'dgagn/diagflow.nvim',  --> display lsp message in the top right corner

        -- dap
        "mfussenegger/nvim-dap",

        -- linters / formatters
        "jose-elias-alvarez/null-ls.nvim",

        -- completion
        "L3MON4D3/LuaSnip",         --> snippets in completion
        "saadparwaiz1/cmp_luasnip", --> integration with the completion engine
        "hrsh7th/cmp-nvim-lsp",
        "hrsh7th/cmp-path",
        {
            "hrsh7th/nvim-cmp",
            -- load cmp on InsertEnter
            event = "InsertEnter",
            -- these dependencies will only be loaded when cmp loads
            -- dependencies are always lazy-loaded unless specified otherwise
            dependencies = {
                "hrsh7th/cmp-nvim-lsp",
                "hrsh7th/cmp-buffer",
                "hrsh7th/cmp-path",
                "L3MON4D3/LuaSnip",
                "saadparwaiz1/cmp_luasnip",
            },
        },

        -- other
        { "j-hui/fidget.nvim", event = "VeryLazy", opts = {} },
        "folke/neodev.nvim",
        "nvim-lua/plenary.nvim",
    },

    { --> awesome UI
        "MunifTanjim/nui.nvim",
        "rcarriga/nvim-notify",

        {
            "folke/noice.nvim",
            -- event = "VeryLazy",
            lazy = false,   -- make sure we load this during startup
            priority = 999, -- make sure to load this before all the other start plugins (except the theme)
            config = function()
                require("noice").setup({
                    lsp = {
                        -- override markdown rendering so that **cmp** and other plugins use **Treesitter**
                        override = {
                            ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
                            ["vim.lsp.util.stylize_markdown"] = true,
                            ["cmp.entry.get_documentation"] = true, -- requires hrsh7th/nvim-cmp
                        },
                    },
                    -- you can enable a preset for easier configuration
                    presets = {
                        bottom_search = false,        -- use a classic bottom cmdline for search
                        command_palette = true,       -- position the cmdline and popupmenu together
                        long_message_to_split = true, -- long messages will be sent to a split
                        inc_rename = false,           -- enables an input dialog for inc-rename.nvim
                        lsp_doc_border = true,        -- add a border to hover docs and signature help
                    },
                })
            end,
            dependencies = {
                "MunifTanjim/nui.nvim",
                "rcarriga/nvim-notify",
            },
        }

    },
    { --> Little git signs on the left side of the screen
        "lewis6991/gitsigns.nvim",
    },
    --use 'tpope/vim-fugitive'

    -- use 'preservim/tagbar'
    {
        "utilyre/sentiment.nvim",
        event = "VeryLazy",
        init = function()
            -- `matchparen.vim` needs to be disabled manually in case of lazy loading
            vim.g.loaded_matchparen = 1
        end,
    },
    {
        "windwp/nvim-autopairs",
        config = function()
            require("nvim-autopairs").setup({})
        end,
    },

    { "BurntSushi/ripgrep",                   lazy = true },
    { "sharkdp/fd",                           lazy = true },
    { "nvim-telescope/telescope-github.nvim", lazy = true },
    {
        "nvim-telescope/telescope.nvim",
        cmd = "Telescope",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "BurntSushi/ripgrep",
            "sharkdp/fd",
            "nvim-treesitter/nvim-treesitter",
            "kyazdani42/nvim-web-devicons", -- not strictly required, but recommended
            "nvim-telescope/telescope-github.nvim",
            "nvim-telescope/telescope-fzf-native.nvim",
        },
    },
    {
        "nvim-telescope/telescope-fzf-native.nvim",
        run =
        "cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build",
    },

    {
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",

        dependencies = {
            -- NOTE: additional parser
            { "nushell/tree-sitter-nu", build = ":TSUpdate nu" },
        },
    },
    --{
    --	"nvim-treesitter/nvim-treesitter-context",
    --	requires = {
    --		"nvim-treesitter/nvim-treesitter",
    --	},
    --})

    -- editor
    { "mhinz/vim-startify" },

    "wakatime/vim-wakatime",

    { "mbbill/undotree",   cmd = "UndotreeToggle" },

    -- { 'junegunn/rainbow_parentheses.vim' , lazy = true,}

    {
        "karb94/neoscroll.nvim",
        config = function()
            require('neoscroll').setup {}
        end
    },

    { "gbprod/yanky.nvim",       lazy = true, },

    --use "rhysd/vim-grammarous"

    {
        "nvim-neo-tree/neo-tree.nvim",
        cmd = "NeoTreeFocusToggle",
        branch = "v2.x",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "kyazdani42/nvim-web-devicons", -- not strictly required, but recommended
            "MunifTanjim/nui.nvim",
        },
    },

    -- {
    -- 	-- Add indentation guides even on blank lines
    -- 	"lukas-reineke/indent-blankline.nvim",
    -- 	-- Enable `lukas-reineke/indent-blankline.nvim`
    -- 	-- See `:help indent_blankline.txt`
    -- 	opts = {
    -- 		char = "┊",
    -- 		show_trailing_blankline_indent = false,
    -- 	},
    -- })

    {
        "folke/zen-mode.nvim", cmd = "ZenMode",
    },

    -- status bar
    {
        "nvim-lualine/lualine.nvim",
        requires = { "kyazdani42/nvim-web-devicons", opt = true },
    },
    { "akinsho/bufferline.nvim", version = "v4.*", requires = "kyazdani42/nvim-web-devicons" },

    -- themes
    {
        "catppuccin/nvim",
        as = "catppuccin",
        lazy = false,    -- make sure we load this during startup if it is your main colorscheme
        priority = 1000, -- make sure to load this before all the other start plugins
    },
    {
        "scottmckendry/cyberdream.nvim",
        lazy = false,    -- make sure we load this during startup if it is your main colorscheme
        priority = 1000, -- make sure to load this before all the other start plugins
    },

    -- log
    { "MTDL9/vim-log-highlighting", ft = "log" },

    -- d2
    { "terrastruct/d2-vim",         ft = "d2" },

    -- rust
    { "simrat39/rust-tools.nvim",   ft = "rust" },

    -- obsidian
    {
        "epwalsh/obsidian.nvim",
        version = "*", -- recommended, use latest release instead of latest commit
        lazy = true,
        -- ft = "markdown",
        -- Replace the above line with this if you only want to load obsidian.nvim for markdown files in your vault:
        event = {
            -- If you want to use the home shortcut '~' here you need to call 'vim.fn.expand'.
            -- E.g. "BufReadPre " .. vim.fn.expand "~" .. "/my-vault/*.md"
            -- refer to `:h file-pattern` for more examples
            "BufReadPre /home/dark/Notes/Personal/*.md",
            "BufNewFile /home/dark/Notes/Personal/*.md",
        },
        dependencies = {
            -- Required.
            "nvim-lua/plenary.nvim",

            -- see below for full list of optional dependencies 👇
        },
        opts = {
            workspaces = {
                {
                    name = "personal",
                    path = "~/Notes/Personal",
                },
                -- {
                --     name = "work",
                --     path = "~/vaults/work",
                -- },
            },

            -- see below for full list of options 👇
        },
    },

    -- lean
    {
        'Julian/lean.nvim',
        event = { 'BufReadPre *.lean', 'BufNewFile *.lean' },

        dependencies = {
            'neovim/nvim-lspconfig',
            'nvim-lua/plenary.nvim',

            -- optional dependencies:

            -- 'andymass/vim-matchup',          -- for enhanced % motion behavior
            -- 'andrewradev/switch.vim',        -- for switch support
            -- 'tomtom/tcomment_vim',           -- for commenting
            'nvim-telescope/telescope.nvim', -- for 2 Lean-specific pickers

            -- a completion engine
            --    hrsh7th/nvim-cmp or Saghen/blink.cmp are popular choices
        },

        ---@type lean.Config
        opts = { -- see below for full configuration options
            mappings = true,
        }
    }
})
