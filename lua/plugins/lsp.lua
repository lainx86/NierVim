---@type LazySpec
return {
  {
    "mason-org/mason.nvim",
    cmd = "Mason",
    opts = { ui = { border = "rounded" } },
  },
  {
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    event = "VeryLazy",
    cond = function() return #vim.api.nvim_list_uis() > 0 end,
    dependencies = { "mason-org/mason.nvim" },
    opts = {
      ensure_installed = { "lua-language-server", "stylua" },
      run_on_start = true,
      start_delay = 1000,
      debounce_hours = 24,
    },
  },
  {
    "mason-org/mason-lspconfig.nvim",
    event = { "BufReadPre", "BufNewFile" },
    cond = function() return #vim.api.nvim_list_uis() > 0 end,
    dependencies = { "mason-org/mason.nvim", "neovim/nvim-lspconfig" },
    opts = { ensure_installed = { "lua_ls" }, automatic_enable = true },
  },
  {
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = { "saghen/blink.cmp" },
    config = function()
      local capabilities = require("blink.cmp").get_lsp_capabilities()
      vim.lsp.config("*", { capabilities = capabilities })
      vim.lsp.config("lua_ls", {
        settings = {
          Lua = {
            completion = { callSnippet = "Replace" },
            diagnostics = { globals = { "Snacks", "MiniIcons" } },
            hint = { enable = true },
            workspace = { checkThirdParty = false },
          },
        },
      })

      vim.diagnostic.config {
        severity_sort = true,
        underline = true,
        update_in_insert = false,
        virtual_text = { spacing = 2, source = "if_many" },
        float = { border = "rounded", source = true },
        signs = {
          text = {
            [vim.diagnostic.severity.ERROR] = "󰅚 ",
            [vim.diagnostic.severity.WARN] = "󰀪 ",
            [vim.diagnostic.severity.INFO] = "󰋽 ",
            [vim.diagnostic.severity.HINT] = "󰌶 ",
          },
        },
      }

      local group = vim.api.nvim_create_augroup("NierVimLsp", { clear = true })
      vim.api.nvim_create_autocmd("LspAttach", {
        group = group,
        desc = "Configure LSP buffer mappings",
        callback = function(args)
          local map = function(lhs, rhs, desc)
            vim.keymap.set("n", lhs, rhs, { buffer = args.buf, desc = desc })
          end
          map("gd", vim.lsp.buf.definition, "Go to definition")
          map("gD", vim.lsp.buf.declaration, "Go to declaration")
          map("gr", vim.lsp.buf.references, "References")
          map("gI", vim.lsp.buf.implementation, "Go to implementation")
          map("K", vim.lsp.buf.hover, "Hover documentation")
          map("<Leader>ca", vim.lsp.buf.code_action, "Code action")
          map("<Leader>cr", vim.lsp.buf.rename, "Rename symbol")
          map("<Leader>cf", function() vim.lsp.buf.format { async = true } end, "Format buffer")
          map("<Leader>cd", vim.diagnostic.open_float, "Line diagnostics")
        end,
      })

      vim.api.nvim_create_autocmd("BufWritePre", {
        group = group,
        desc = "Format with an attached LSP before saving",
        callback = function(args)
          local clients = vim.lsp.get_clients { bufnr = args.buf, method = "textDocument/formatting" }
          if #clients > 0 then vim.lsp.buf.format { bufnr = args.buf, timeout_ms = 1000 } end
        end,
      })
    end,
  },
  {
    "nvimtools/none-ls.nvim",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      local null_ls = require "null-ls"
      null_ls.setup {
        sources = { null_ls.builtins.formatting.stylua },
      }
    end,
  },
}
