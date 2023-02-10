-- Set a formatter.
local formatters = require "lvim.lsp.null-ls.formatters"

formatters.setup {
  { command = "black", filetypes = { "python" } },
  { command = "google_java_format", filetypes = { "java" } },
}
