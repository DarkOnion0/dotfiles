local lspconfig = require("lspconfig")
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)

-- python

--lspconfig.pyright.setup({
--	capabilities = capabilities,
--})
--lspconfig.ruff.setup({
--	capabilities = capabilities,
--})
lspconfig.pylsp.setup({
	capabilities = capabilities,
})

-- rust

require("rust-tools").setup()
lspconfig.taplo.setup({
	capabilities = capabilities,
})

-- go

lspconfig.gopls.setup({
	capabilities = capabilities,
})

-- web dev

lspconfig.cssls.setup({
	capabilities = capabilities,
})
lspconfig.tailwindcss.setup({
	capabilities = capabilities,
    filetypes = {
      "html",
      "css",
      "sass",
      "scss",

      "svelte",
      "javascriptreact",
      "typescriptreact",

      "javascript",
      "typescript",
    },
})
lspconfig.biome.setup({
	capabilities = capabilities,
})
lspconfig.svelte.setup({
	capabilities = capabilities,
})
lspconfig.tsserver.setup({
	capabilities = capabilities,
})
lspconfig.emmet_ls.setup({
	capabilities = capabilities,
})
lspconfig.html.setup({
	capabilities = capabilities,
})
lspconfig.jsonls.setup({
	capabilities = capabilities,
})
lspconfig.eslint.setup({
	capabilities = capabilities,
})

-- nix

lspconfig.nil_ls.setup({
	capabilities = capabilities,
})

-- lua

lspconfig.lua_ls.setup({
	capabilities = capabilities,
})

-- container & co

lspconfig.dockerls.setup({
	capabilities = capabilities,
})

-- shell & co
--
lspconfig.nushell.setup({
	capabilities = capabilities,
})

-- writing
lspconfig.typst_lsp.setup({
	capabilities = capabilities,
})
--lspconfig.tinymist.setup({
--	capabilities = capabilities,
--})
