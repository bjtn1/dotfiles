return {
  "xiyaowong/nvim-transparent",
  config = function ()
    require("transparent").setup({
      enable = false,
      extra_groups = "all",
    })
  end
}
