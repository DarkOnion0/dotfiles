require("catppuccin").setup()
--vim.api.nvim_command("colorscheme catppuccin")
vim.cmd.colorscheme("catppuccin")

require("catppuccin").setup({
    flavour = "latte",
    background = { -- :h background
        light = "latte",
        --dark = "macchiato",
        dark = "mocha",
    },
    compile_path = vim.fn.stdpath("cache") .. "/catppuccin",
    transparent_background = false,
    term_colors = false,
    dim_inactive = {
        enabled = true,
        shade = "dark",
        percentage = 0.15,
    },
    integrations = {
        cmp = true,
        dap = true,
        dap_ui = true,
        lsp_saga = true,
        native_lsp = {
            enabled = true,
            virtual_text = {
                errors = { "italic" },
                hints = { "italic" },
                warnings = { "italic" },
                information = { "italic" },
                ok = { "italic" },
            },
            underlines = {
                errors = { "underline" },
                hints = { "underline" },
                warnings = { "underline" },
                information = { "underline" },
                ok = { "underline" },
            },
            inlay_hints = {
                background = true,
            },
        },


        gitsigns = true,
        neotree = true,
        telescope = true,

        treesitter = true,
        treesitter_context = true,

        notify = true,
        noice = true,
    },
})
