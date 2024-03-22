return {
  -- markdown preview
  {
    "0x00-ketsu/markdown-preview.nvim",
    ft = { "md", "markdown", "mkd", "mkdn", "mdwn", "mdown", "mdtxt", "mdtext", "rmd", "wiki" },
    config = function() require("markdown-preview").setup {} end,
  },
  -- clipboard manager
  {
    "gbprod/yanky.nvim",
    opts = function()
      local mapping = require "yanky.telescope.mapping"
      local mappings = mapping.get_defaults()
      mappings.i["<c-p>"] = nil
      return {
        highlight = { timer = 200 },
        picker = {
          telescope = {
            use_default_mappings = false,
            mappings = mappings,
          },
        },
      }
    end,
    keys = {
      {
        "y",
        "<Plug>(YankyYank)",
        mode = { "n", "x" },
        desc = "Yank text",
      },
      {
        "p",
        "<Plug>(YankyPutAfter)",
        mode = { "n", "x" },
        desc = "Put yanked text after cursor",
      },
      {
        "P",
        "<Plug>(YankyPutBefore)",
        mode = { "n", "x" },
        desc = "Put yanked text before cursor",
      },
      {
        "gp",
        "<Plug>(YankyGPutAfter)",
        mode = { "n", "x" },
        desc = "Put yanked text after selection",
      },
      {
        "gP",
        "<Plug>(YankyGPutBefore)",
        mode = { "n", "x" },
        desc = "Put yanked text before selection",
      },
      { "[y", "<Plug>(YankyCycleForward)",              desc = "Cycle forward through yank history" },
      { "]y", "<Plug>(YankyCycleBackward)",             desc = "Cycle backward through yank history" },
      { "]p", "<Plug>(YankyPutIndentAfterLinewise)",    desc = "Put indented after cursor (linewise)" },
      { "[p", "<Plug>(YankyPutIndentBeforeLinewise)",   desc = "Put indented before cursor (linewise)" },
      { "]P", "<Plug>(YankyPutIndentAfterLinewise)",    desc = "Put indented after cursor (linewise)" },
      { "[P", "<Plug>(YankyPutIndentBeforeLinewise)",   desc = "Put indented before cursor (linewise)" },
      { ">p", "<Plug>(YankyPutIndentAfterShiftRight)",  desc = "Put and indent right" },
      { "<p", "<Plug>(YankyPutIndentAfterShiftLeft)",   desc = "Put and indent left" },
      { ">P", "<Plug>(YankyPutIndentBeforeShiftRight)", desc = "Put before and indent right" },
      { "<P", "<Plug>(YankyPutIndentBeforeShiftLeft)",  desc = "Put before and indent left" },
      { "=p", "<Plug>(YankyPutAfterFilter)",            desc = "Put after applying a filter" },
      { "=P", "<Plug>(YankyPutBeforeFilter)",           desc = "Put before applying a filter" },
    },
  },
  {
    "ibhagwan/smartyank.nvim",
    init = function()
      require("smartyank").setup {
        osc52 = {
          enabled = true,
          ssh_only = false, -- false to OSC52 yank also in local sessions
          silent = false,   -- true to disable the "n chars copied" echo
        },
        clipboard = {
          enabled = true,
        },
      }
    end,
  },
  -- Enhanced matchparen.vim plugin for Neovim to highlight the outer pair.
  {
    "utilyre/sentiment.nvim",
    version = "*",
    event = "VeryLazy", -- keep for lazy loading
    opts = {
      -- config
    },
    init = function()
      -- `matchparen.vim` needs to be disabled manually in case of lazy loading
      vim.g.loaded_matchparen = 1
    end,
  },
  -- joining blocks of code into oneline, or splitting one line into multiple lines.
  {
    "Wansmer/treesj",
    keys = { "<space>m", "<space>j", "<space>s" },
    dependencies = { "nvim-treesitter/nvim-treesitter" },
    config = function()
      require("treesj").setup { --[[ your config ]]
      }
    end,
  },
  -- The plugin offers the alibity to refactor code.
  {
    "ThePrimeagen/refactoring.nvim",
    dependencies = {
      { "nvim-lua/plenary.nvim" },
      { "nvim-treesitter/nvim-treesitter" },
    },
  },
  -- The plugin offers the abilibty to search and replace.
  {
    "nvim-pack/nvim-spectre",
    dependencies = {
      { "nvim-lua/plenary.nvim" },
    },
  },
  -- full signature help, docs and completion for the nvim lua API.
  { "folke/neodev.nvim",     opts = {} },
  {
    "0x00-ketsu/autosave.nvim",
    -- lazy-loading on events
    event = { "InsertLeave", "TextChanged" },
    opts = function(_, opts)
      opts.prompt_style = "stdout" -- notify or stdout
    end,
  },
  -- automatically highlighting other uses of the word under the cursor using either LSP, Tree-sitter, or regex matching.
  { "RRethy/vim-illuminate", config = function() end },
  -- implementation/definition preview
  {
    "rmagatti/goto-preview",
    config = function() require("goto-preview").setup {} end,
  },
  -- Super fast git decorations implemented purely in Lua.
  {
    "lewis6991/gitsigns.nvim",
    event = { "CursorHold", "CursorHoldI" },
    init = function()
      require("gitsigns").setup {
        current_line_blame = true,
      }
    end,
  },
}
