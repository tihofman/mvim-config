require("nvchad.configs.lspconfig").defaults()

local servers = { "html", "cssls", "jdtls", "kotlin_lsp", "angularls"}
vim.lsp.enable(servers)
-- require('lspconfig').jdtls.setup({})

-- read :h vim.lsp.config for changing options of lsp servers 
