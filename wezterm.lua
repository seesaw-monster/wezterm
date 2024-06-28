local wezterm = require 'wezterm';

return {
    font = wezterm.font("DroidSansM Nerd Font"),
    use_ime = true,
    font_size = 17.0,
    -- color_scheme = "OneHalfDark", -- https://wezfurlong.org/wezterm/colorschemes/index.html
    color_scheme = "Dracula (Official)",
    -- window_decorations = "RESIZE", -- 最小化・最大化ボタンがある領域を非表示に（移動ができなくなったので，コメント化）

    hide_tab_bar_if_only_one_tab = true,
    adjust_window_size_when_changing_font_size = false,
    force_reverse_video_cursor = true,

    -- weindowsはPowerShellを利用
    default_prog = wezterm.target_triple == 'x86_64-pc-windows-msvc' and {'powershell.exe'} or nil,
}
