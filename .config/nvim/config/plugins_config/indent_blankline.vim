lua << END
  require("indent_blankline").setup{
    filetype = { "rust" },
    show_trailing_blankline_indent = false,

    context_patterns = {
      "class", "return", "function", "method", "^if",
      "^while", "^for", "^object", "^table", "block",
      "arguments", "if_statement", "else_clause", "try_statement",
      "catch_clause", "import_statement", "operation_type"
    },
  }
END
