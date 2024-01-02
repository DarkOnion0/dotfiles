local lspconfig = require('lspconfig')
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)

-- python

lspconfig.pyright.setup {
  capabilities = capabilities,
}

-- rust

require("rust-tools").setup()
lspconfig.taplo.setup {
  capabilities = capabilities,
}

-- go

lspconfig.gopls.setup {
  capabilities = capabilities,
}

-- web dev

lspconfig.cssls.setup {
  capabilities = capabilities,
}
lspconfig.tailwindcss.setup {
  capabilities = capabilities,
}
lspconfig.rome.setup {
  capabilities = capabilities,
}
lspconfig.svelte.setup {
  capabilities = capabilities,
}
lspconfig.tsserver.setup {
  capabilities = capabilities,
}
lspconfig.emmet_ls.setup {
  capabilities = capabilities,
}

-- nix

lspconfig.nil_ls.setup {
  capabilities = capabilities,
}

-- lua

lspconfig.lua_ls.setup {
  capabilities = capabilities,
}

-- container & co

lspconfig.dockerls.setup {
  capabilities = capabilities,
}

lspconfig.terraformls.setup {
  capabilities = capabilities,
}
