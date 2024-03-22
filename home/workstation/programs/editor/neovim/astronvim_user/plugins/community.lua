return {
    "AstroNvim/astrocommunity",
    -- Motion
    { import = "astrocommunity.motion.mini-surround" },
    -- https://github.com/echasnovski/mini.ai
    { import = "astrocommunity.motion.mini-ai" },
    { import = "astrocommunity.motion.flash-nvim" },
    -- disable toggleterm.nvim, zellij's terminal is far better than neovim's one
    { "akinsho/toggleterm.nvim",                                   enabled = false },
    { "folke/flash.nvim",                                          vscode = false },
    { import = "astrocommunity.motion.leap-nvim" },
    { import = "astrocommunity.motion.flit-nvim" },
    { import = "astrocommunity.scrolling.nvim-scrollbar" },
    { import = "astrocommunity.editing-support.todo-comments-nvim" },
    -- Language Support
    ---- Configuration Language
    { import = "astrocommunity.pack.markdown" },
    { import = "astrocommunity.pack.json" },
    { import = "astrocommunity.pack.yaml" },
    { import = "astrocommunity.pack.toml" },
    ---- Backend / System
    { import = "astrocommunity.pack.lua" },
    { import = "astrocommunity.pack.python" },
    -- { import = "astrocommunity.pack.nix" },  -- manually add config for nix, comment this one.

    ---- Operation & Cloud Native
    { import = "astrocommunity.pack.terraform" },
    { import = "astrocommunity.pack.bash" },
    { import = "astrocommunity.pack.docker" },
    { import = "astrocommunity.pack.helm" },

    -- colorscheme
    { import = "astrocommunity.colorscheme.catppuccin" },
    {
      "catppuccin/nvim",
      name = "catppuccin",
      opts = function(_, opts)
        opts.flavour = "mocha"             -- latte, frappe, macchiato, mocha
        opts.transparent_background = true -- setting the background color.
      end,
    },
    -- Lua implementation of CamelCaseMotion, with extra consideration of punctuation.
    { import = "astrocommunity.motion.nvim-spider" },
}
