local wezterm = require 'wezterm';

return {
    font = wezterm.font("DroidSansMono Nerd Font"),
    use_ime = true,
    font_size = 17.0,
    color_scheme = "OneHalfDark", -- https://wezfurlong.org/wezterm/colorschemes/index.html
    hide_tab_bar_if_only_one_tab = true,
    adjust_window_size_when_changing_font_size = false,
    force_reverse_video_cursor = true,
}
