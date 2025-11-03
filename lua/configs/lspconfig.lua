require("nvchad.configs.lspconfig").defaults()

local servers = {
  -- Web
  "html",
  "cssls",
  "angularls",

  -- JavaScript/TypeScript/Node
  "ts_ls",  -- TypeScript/JavaScript
  "vue_ls",  -- Vue/Nuxt

  -- Java/JVM
  "jdtls",
  "kotlin_lsp",

  -- Rust
  -- Note: rust_analyzer is managed by rustaceanvim plugin

  -- SQL
  "sqlls",
}

vim.lsp.enable(servers)

-- read :h vim.lsp.config for changing options of lsp servers
