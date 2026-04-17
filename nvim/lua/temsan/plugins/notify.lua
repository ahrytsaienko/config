return {
  {
    "rcarriga/nvim-notify",
    event = "VeryLazy",
    keys = {
      { "<leader>nd", function() require("notify").dismiss({ silent = true, pending = true }) end, desc = "Dismiss notifications" },
      { "<leader>nh", "<cmd>Telescope notify<CR>",                                                  desc = "Notification history" },
    },
    opts = {
      stages = "fade",
      timeout = 4000,
      max_width = function() return math.floor(vim.o.columns * 0.5) end,
      max_height = function() return math.floor(vim.o.lines * 0.75) end,
      render = "wrapped-compact",
      fps = 60,
      top_down = false, -- render from bottom-right
    },
    init = function()
      vim.notify = function(...)
        require("notify")(...)
      end
    end,
  },
}
