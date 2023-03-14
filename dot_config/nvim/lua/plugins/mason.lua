return {
  "williamboman/mason.nvim",
  config = function()
    require("mason").setup({
      ui = {
        border = "single",
        icons = {
          package_installed = "✓",
          package_pending = "➜",
          package_uninstalled = "✗"
        }
      },
    })
  end
}
