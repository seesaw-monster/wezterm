local wezterm = require 'wezterm';

local config = {}

if wezterm.config_builder then
  config = wezterm.config_builder()
end

-- 
config.font = wezterm.font("DroidSansM Nerd Font")
config.font_size = 17.0
config.use_ime = true

-- https://wezfurlong.org/wezterm/colorschemes/index.html
config.color_scheme = "Dracula (Official)"
config.hide_tab_bar_if_only_one_tab = true
config.adjust_window_size_when_changing_font_size = false
config.force_reverse_video_cursor = true

-- weindowsはPowerShellを利用
config.default_prog = wezterm.target_triple == 'x86_64-pc-windows-msvc' and {'powershell.exe'} or nil

return config
