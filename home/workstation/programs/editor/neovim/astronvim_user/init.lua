return {
  -- Configure AstroNvim updates
  updater = {
    remote = "origin",     -- remote to use
    channel = "stable",    -- "stable" or "nightly"
    version = "latest",    -- "latest", tag name, or regex search like "v1.*" to only do updates before v2 (STABLE ONLY)
    branch = "nightly",    -- branch name (NIGHTLY ONLY)
    commit = nil,          -- commit hash (NIGHTLY ONLY)
    pin_plugins = nil,     -- nil, true, false (nil will pin plugins on stable only)
    skip_prompts = false,  -- skip prompts about breaking changes
    show_changelog = true, -- show the changelog after performing an update
    auto_quit = false,     -- automatically quit the current session after a successful update
    remotes = {            -- easily add new remotes to track
      --   ["remote_name"] = "https://remote_url.come/repo.git", -- full remote url
      --   ["remote2"] = "github_user/repo", -- GitHub user/repo shortcut,
      --   ["remote3"] = "github_user", -- GitHub user assume AstroNvim fork
    },
  },
  -- Set colorscheme to use
  colorscheme = "catppuccin",

  -- Configure require("lazy").setup() options
  lazy = {
    defaults = { lazy = true },
    performance = {
      rtp = {
        -- customize default disabled vim plugins
        disabled_plugins = {},
      },
    },
  },

  -- https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md
  lsp = {
    -- enable servers that installed by home-manager instead of mason
    servers = {
      ---- Configuration Language
      "marksman",    -- markdown ls
      "jsonls",      -- json language server
      "yamlls",      -- yaml language server
      "taplo",       -- toml language server
      ---- Backend
      "lua_ls",      -- lua
      "pyright",     -- python
      "ruff_lsp",    -- extremely fast Python linter and code transformation
      "nil_ls",      -- nix language server
      ---- Operation & Cloud Nativautoindente
      "bashls",      -- bash
      "dockerls",    -- dockerfile
      "jsonnet_ls",  -- jsonnet language server
      "terraformls", -- terraform hcl
    },
    -- formatting = {
    --   format_on_save = {
    --     enabled = true,
    --   },
    -- },
  },
}
