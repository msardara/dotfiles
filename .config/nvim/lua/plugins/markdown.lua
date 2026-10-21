return {
  -- prettier is not in the lang.markdown extra's ensure_installed
  {
    "mason-org/mason.nvim",
    opts = function(_, opts)
      opts.ensure_installed = opts.ensure_installed or {}
      table.insert(opts.ensure_installed, "prettier")
    end,
  },
  -- wrap markdown prose at 80 columns (fixes markdownlint MD013)
  {
    "stevearc/conform.nvim",
    opts = {
      formatters = {
        prettier = {
          prepend_args = function(_, ctx)
            if ctx.filename:match("%.md$") then
              return { "--prose-wrap", "always", "--print-width", "80" }
            end
            return {}
          end,
        },
      },
    },
  },
}
