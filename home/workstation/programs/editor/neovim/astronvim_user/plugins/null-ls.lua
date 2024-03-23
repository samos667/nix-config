return {
  "jose-elias-alvarez/null-ls.nvim",
  opts = function(_, config)
    local null_ls = require "null-ls"
    -- Check supported formatters and linters
    -- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/
    config.sources = {
      -- Common Code Actions
      null_ls.builtins.code_actions.gitsigns,
      -- common refactoring actions based off the Refactoring book by Martin Fowler
      null_ls.builtins.code_actions.refactoring,
      null_ls.builtins.code_actions.shellcheck,
      null_ls.builtins.code_actions.proselint,      -- English prose linter
      null_ls.builtins.code_actions.statix,         -- Lints and suggestions for Nix.
      -- Diagnostic
      null_ls.builtins.diagnostics.actionlint,      -- GitHub Actions workflow syntax checking
      null_ls.builtins.diagnostics.deadnix,         -- Scan Nix files for dead code.
      -- formatting
      null_ls.builtins.formatting.prettier,         -- js/ts/vue/css/html/json/... formatter
      null_ls.builtins.diagnostics.hadolint,        -- Dockerfile linter
      null_ls.builtins.formatting.black,            -- Python formatter
      null_ls.builtins.formatting.ruff,             -- extremely fast Python linter
      null_ls.builtins.formatting.shfmt,            -- Shell formatter
      null_ls.builtins.formatting.terraform_fmt,    -- Terraform formatter
      null_ls.builtins.formatting.stylua,           -- Lua formatter
      null_ls.builtins.formatting.alejandra,        -- Nix formatter
      null_ls.builtins.formatting.sqlfluff.with {   -- SQL formatter
        extra_args = { "--dialect", "postgres" },   -- change to your dialect
      },
      null_ls.builtins.formatting.nginx_beautifier, -- Nginx formatter
    }
    return config
  end,
}
