return {
  {
    "jose-elias-alvarez/null-ls.nvim",
    opts = function(_, opts)
      local null_ls = require "null-ls"
      local code_actions = null_ls.builtins.code_actions
      local diagnostics = null_ls.builtins.diagnostics
      local formatting = null_ls.builtins.formatting
      local hover = null_ls.builtins.hover
      local completion = null_ls.builtins.completion
      -- https://github.com/jose-elias-alvarez/null-ls.nvim/blob/main/doc/BUILTINS.md
      if type(opts.sources) == "table" then
        vim.list_extend(opts.sources, {
          -- Common Code Actions
          code_actions.gitsigns,
          -- common refactoring actions based off the Refactoring book by Martin Fowler
          code_actions.refactoring,
          code_actions.shellcheck,
          code_actions.proselint,    -- English prose linter
          code_actions.statix,       -- Lints and suggestions for Nix.

          -- Diagnostic
          diagnostics.actionlint, -- GitHub Actions workflow syntax checking
          diagnostics.deadnix,    -- Scan Nix files for dead code.

          -- Formatting
          formatting.prettier,                        -- js/ts/vue/css/html/json/... formatter
          diagnostics.hadolint,                       -- Dockerfile linter
          formatting.black,                           -- Python formatter
          formatting.ruff,                            -- extremely fast Python linter
          formatting.shfmt,                           -- Shell formatter
          formatting.taplo,                           -- TOML formatteautoindentr
          formatting.terraform_fmt,                   -- Terraform formatter
          formatting.stylua,                          -- Lua formatter
          formatting.alejandra,                       -- Nix formatter
          formatting.sqlfluff.with {                  -- SQL formatter
            extra_args = { "--dialect", "postgres" }, -- change to your dialect
          },
          formatting.nginx_beautifier,                -- Nginx formatter
        })
      end
    end,
  },
}
