return {
  {
    "stevearc/conform.nvim",
     event = 'BufWritePre', -- uncomment for format on save
    opts = require "configs.conform",
  },
  {
    'nvim-java/nvim-java',
    config = function ()
      require('java').setup()
    end
  },
  {
    'mrcjkb/rustaceanvim',
    version = '^5',
    lazy = false,
    ft = { 'rust' },
    config = function()
      vim.g.rustaceanvim = {
        server = {
          on_attach = function(client, bufnr)
            -- Use NvChad's default on_attach if available
            local nvchad_on_attach = require("nvchad.configs.lspconfig").on_attach
            if nvchad_on_attach then
              nvchad_on_attach(client, bufnr)
            end
          end,
        },
      }
    end,
  },
  {
    "neovim/nvim-lspconfig",
    config = function()
      require "configs.lspconfig"
    end,
  },
  { import = "nvchad.blink.lazyspec" },
  {
  	"nvim-treesitter/nvim-treesitter",
  	opts = {
  		ensure_installed = {
  			"vim", "lua", "vimdoc",
       "html", "css",
       -- JavaScript/TypeScript/Node
       "javascript", "typescript", "tsx", "jsdoc",
       -- Vue/Nuxt
       "vue",
       -- Java/JVM
       "java", "kotlin",
       -- Rust
       "rust", "toml",
       -- SQL
       "sql",
       -- Config/Data formats
       "json", "yaml", "markdown",
  		},
  	},
  },
}
