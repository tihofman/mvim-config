require("nvchad.configs.lspconfig").defaults()

local servers = {
  -- Web
  "html",
  "cssls",
  "angularls",

  -- JavaScript/TypeScript/Node
  "ts_ls",  -- TypeScript/JavaScript
  "volar",  -- Vue/Nuxt

  -- Java/JVM
  "jdtls",
  "kotlin_lsp",

  -- Rust
  -- Note: rust_analyzer is managed by rustaceanvim plugin

  -- SQL
  "sqlls",
}

vim.lsp.enable(servers)

-- Vue/Nuxt configuration (Volar)
vim.lsp.config.volar = {
  cmd = { "vue-language-server", "--stdio" },
  filetypes = { "vue" },
  init_options = {
    typescript = {
      tsdk = vim.fn.expand("~/.local/share/nvim/mason/packages/typescript-language-server/node_modules/typescript/lib"),
    },
  },
}

-- read :h vim.lsp.config for changing options of lsp servers 
