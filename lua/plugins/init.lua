  local function my_on_attach(bufnr)
    local api = require("nvim-tree.api")

    local function opts(desc)
      return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
    end

    -- copy default mappings here from defaults in next section
    vim.keymap.set("n", "<C-]>", api.tree.change_root_to_node,          opts("CD"))
    vim.keymap.set("n", "<C-e>", api.node.open.replace_tree_buffer,     opts("Open: In Place"))
    ---
    -- OR use all default mappings
    api.config.mappings.default_on_attach(bufnr)

    -- override a default
    vim.keymap.set("n", "<C-e>", api.tree.reload,                       opts("Refresh"))
    vim.keymap.set("n", "l", api.node.open.edit,                        opts("Open"))
    vim.keymap.set("n", "h",           api.node.navigate.parent_close,     opts("Close Directory"))

    -- add your mappings
    vim.keymap.set("n", "?",     api.tree.toggle_help,                  opts("Help"))
    ---
  end

return {
  {
    "stevearc/conform.nvim",
    -- event = 'BufWritePre', -- uncomment for format on save
    opts = require "configs.conform",
  },

  -- These are some examples, uncomment them if you want to see them work!
  {
    "neovim/nvim-lspconfig",
    config = function()
      require "configs.lspconfig"
    end,
  },

  {
    "williamboman/mason.nvim",
    'williamboman/mason-lspconfig.nvim',
    'neovim/nvim-lspconfig',
    opts = {
      ensure_installed = {
        "lua-language-server",
        "stylua",
        "html-lsp",
        "css-lsp",
        "prettier",
      },
    },
  },
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {"html", "css", "bash"}
    },
  },
  {
    "nvim-tree/nvim-tree.lua",
    config = function()
      require("nvim-tree").setup {
        on_attach = my_on_attach,
        view = {
          width = 40
        } ,
      }
    end,
  }
}
