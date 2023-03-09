local lspconfig = require('lspconfig')
local get_servers = require('mason-lspconfig').get_installed_servers

local lsp_capabilities = require('cmp_nvim_lsp').default_capabilities()
local lsp_attach = function(client, bufnr)
  -- todo Create your keybindings here...
end

for _, server_name in ipairs(get_servers()) do
  lspconfig[server_name].setup({
    on_attach = lsp_attach,
    capabilities = lsp_capabilities,
  })
end
