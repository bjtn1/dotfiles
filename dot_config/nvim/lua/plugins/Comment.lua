return {
  "numToStr/Comment.nvim",
  lazy = false,
  config = function ()
    local Comment = require("Comment")
    Comment.setup()
  end
}
