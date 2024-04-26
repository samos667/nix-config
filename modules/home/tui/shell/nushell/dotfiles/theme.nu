# let's define some colors

# https://github.com/catppuccin/i3/blob/main/themes/catppuccin-mocha
let rosewater = "#f5e0dc"
let flamingo  = "#f2cdcd"
let pink      = "#f5c2e7"
let mauve     = "#cba6f7"
let red       = "#f38ba8"
let maroon    = "#eba0ac"
let peach     = "#fab387"
let green     = "#a6e3a1"
let teal      = "#94e2d5"
let sky       = "#89dceb"
let sapphire  = "#74c7ec"
let blue      = "#89b4fa"
let lavender  = "#b4befe"
let text      = "#cdd6f4"
let subtext1  = "#bac2de"
let subtext0  = "#a6adc8"
let overlay2  = "#9399b2"
let overlay1  = "#7f849c"
let overlay0  = "#6c7086"
let surface2  = "#585b70"
let surface1  = "#45475a"
let surface0  = "#313244"
let base      = "#1e1e2e"
let mantle    = "#181825"
let crust     = "#11111b"

# we're creating a theme here that uses the colors we defined above.

let catppuccin_theme = {
    separator: $overlay2
    leading_trailing_space_bg: $surface2
    header: $red
    date: $pink
    filesize: $green
    row_index: $text
    bool: $peach
    int: $red
    duration: $sky
    range: $sapphire
    float: $lavender
    string: $text
    nothing: $overlay1
    binary: $subtext1
    cellpath: $subtext0
    hints: dark_gray

    shape_garbage: { fg: $overlay2 bg: $red attr: b}
    shape_bool: $maroon
    shape_int: { fg: $pink attr: b}
    shape_float: { fg: $pink attr: b}
    shape_range: { fg: $overlay0 attr: b}
    shape_internalcall: { fg: $maroon attr: b}
    shape_external: $mauve
    shape_externalarg: { fg: $red attr: b}
    shape_literal: $flamingo
    shape_operator: $rosewater
    shape_signature: { fg: $red attr: b}
    shape_string: $red
    shape_filepath: $peach
    shape_globpattern: { fg: $teal attr: b}
    shape_variable: $pink
    shape_flag: { fg: $mauve attr: b}
    shape_custom: {attr: b}
}
