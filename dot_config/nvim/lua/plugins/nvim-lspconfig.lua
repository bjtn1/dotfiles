return {
  "neovim/nvim-lspconfig",
  config = function()
    -- require("lspconfig")
    require("lspconfig.ui.windows").default_options.border = "single"
    vim.diagnostic.config({
      virtual_text = { spacing = 4, prefix = "BRUH" },
      signs = true,
      update_in_insert = false,
      underline = true,
      severity_sort = true,
      float = true,
    })
  end
}
