--
-- #############
-- ### MASON ###
-- #############
--
require("mason").setup{
  -- github = {
  --   download_url_template = "https://gitclone/github.com/%s/releases/download/%s/%s",
  -- }
  --
  ui = {
    -- • "none": No border (default).
    -- • "single": A single line box.
    -- • "double": A double line box.
    -- • "rounded": Like "single", but with rounded corners ("╭"
    --   etc.).
    -- • "solid": Adds padding by a single whitespace cell.
    -- • "shadow": A drop shadow effect by blending with the
    --   background.
    border = "single",
  }
}

require("mason-lspconfig").setup()

-- The nvim-cmp almost supports LSP's capabilities so You should advertise it to LSP servers..
local capabilities = require('cmp_nvim_lsp').default_capabilities()
-- Allow to automatically setup server
require("mason-lspconfig").setup_handlers {
  -- The first entry (without a key) will be the default handler
  -- and will be called for each installed server that doesn't have
  -- a dedicated handler.
  function (server_name) -- default handler (optional)
    require("lspconfig")[server_name].setup {
      capabilities = capabilities,
    }
  end,
  -- Next, you can provide a dedicated handler for specific servers.
  -- For example, a handler override for the `rust_analyzer`:
  -- ["rust_analyzer"] = function ()
  --   require("rust-tools").setup {}
  -- end

  ["pylsp"] = function()
    require('lspconfig').pylsp.setup{
      capabilities = capabilities,
      settings = {
        pylsp = {
          plugins = {
            pycodestyle = {
              ignore = {'E731', 'E501', 'E305', 'E302'},
            }
          }
        }
      }
    }
  end,
  ["tsserver"] = function()
    require("lspconfig").tsserver.setup{
      capabilities = capabilities,
      on_attach = function (client, bufnr)
        if client.name == "tsserver" then
          local ns = vim.lsp.diagnostic.get_namespace(client.id)
          vim.diagnostic.disable(nil, ns)
        end
      end
    }
  end,
  ["lua_ls"] = function()
    require("lspconfig").lua_ls.setup{
      capabilities = capabilities,
      settings = {
        Lua = {
          runtime = {
            -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
            version = 'LuaJIT',
          },
          diagnostics = {
            -- Get the language server to recognize the `vim` global
            globals = {'vim'},
          },
          workspace = {
            -- Make the server aware of Neovim runtime files
            library = vim.api.nvim_get_runtime_file("", true),
            checkThirdParty = false, -- depress the asking about working environment on every startup
          },
          -- Do not send telemetry data containing a randomized but unique identifier
          telemetry = {
            enable = false,
          },
        },
      },
    }
  end
}
