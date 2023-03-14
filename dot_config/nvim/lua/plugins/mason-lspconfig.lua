return {
  "williamboman/mason-lspconfig.nvim",
  config = function()
    require("mason-lspconfig").setup({
      ensure_installed = {
        "arduino_language_server",
        "clangd",
        "cmake",
        "cssls",
        "jsonls",
        "jdtls",
        "tsserver",
        "ltex",
        "lua_ls",
        "marksman",
        "pyright",
        "rust_analyzer",
        "taplo",
      }
    })
  end
}
