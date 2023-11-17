local group = vim.api.nvim_create_augroup(
  "AutoInstallNewLSPs",
  {
    clear = true
  }
)
vim.api.nvim_create_autocmd(
  "BufEnter",
  {
    callback = function()
      -- Get file path of current buffer
      -- TODO find the correct event so that the autocommand gets called anytipe we open a file
      local file_path = vim.api.nvim_buf_get_name(0)
      local file = io.open(file_path, "r")
      if file~=nil then
        -- print(file_path .. " is a file")
        -- TODO figure out if theres an LSP attached to this buffer
        io.close(file)
        return true
      else
        return false
      end

    end,
    group = group,
  }
)

