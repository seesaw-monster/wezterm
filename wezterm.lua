local wezterm = require 'wezterm';

local config = {}

if wezterm.config_builder then
  config = wezterm.config_builder()
end

-- 
config.font = wezterm.font("DroidSansMono Nerd Font")
config.font_size = 17.0
config.use_ime = true

-- https://wezfurlong.org/wezterm/colorschemes/index.html
config.color_scheme = "OneHalfDark"
config.hide_tab_bar_if_only_one_tab = true
config.adjust_window_size_when_changing_font_size = false
config.force_reverse_video_cursor = true


return config
