# Nushell Config File
#
# version = 0.92.1
source ~/.config/nushell/theme.nu

$env.config = {
  color_config: $catppuccin_theme
  use_ansi_coloring: true
  keybindings: [
    {
      name: redo_command
      modifier: control
      keycode: char_y
      mode: [emacs, vi_insert, vi_normal]
      event: { edit: Redo }
    }
  ]
  # true or false to enable or disable the welcome banner at startup
  show_banner: false

  table: {
    mode: rounded # basic, compact, compact_double, light, thin, with_love, rounded, reinforced, heavy, none, other
    index_mode: always # "always" show indexes, "never" show indexes, "auto" = show indexes when a table has "index" column
    show_empty: true # show 'empty list' and 'empty record' placeholders for command output
    trim: {
      methodology: wrapping # wrapping or truncating
      wrapping_try_keep_words: true # A strategy used by the 'wrapping' methodology
      truncating_suffix: "..." # A suffix used by the 'truncating' methodology
    }
  }

  completions: {
    case_sensitive: false # set to true to enable case-sensitive completions
    quick: true  # set this to false to prevent auto-selecting completions when only one remains
    partial: true  # set this to false to prevent partial filling of the prompt
    algorithm: "prefix"  # prefix or fuzzy
    external: {
      enable: true # set to false to prevent nushell looking into $env.PATH to find more suggestions, `false` recommended for WSL users as this look up may be very slow
      max_results: 100 # setting it lower can improve completion performance at the cost of omitting some options
    }
  }
  cursor_shape: {
    vi_insert: blink_block # block, underscore, line , blink_block, blink_underscore, blink_line (block is the default)
    vi_normal: blink_underscore # block, underscore, line, blink_block, blink_underscore, blink_line (underscore is the default)
  }
  float_precision: 2 # the precision for displaying floats in tables
  # bracketed_paste: true # enable bracketed paste, currently useless on windows
  edit_mode: vi # emacs, vi
  shell_integration: {
    osc2: true
    osc7: true
    osc8: true
    osc9_9: false
    osc133: true
    osc633: true
    reset_application_mode: true
  }
  render_right_prompt_on_last_line: false # true or false to enable or disable right prompt to be rendered on last line of the prompt.
}

source ~/.config/nushell/userenv.nu
source ~/.config/nushell/lib/cecho.nu
source ~/.config/nushell/alias.nu
source ~/.config/nushell/lib/git.nu
source ~/.config/nushell/lib/k8s.nu
source ~/.config/nushell/lib/nix.nu
source ~/.config/nushell/lib/v.nu
source ~/.config/nushell/lib/flux.nu
source ~/.config/nushell/lib/waydroid.nu
