local wezterm = require 'wezterm';

local config = {}

if wezterm.config_builder then
  config = wezterm.config_builder()
end

-- Visual #########################################################################
config.font = wezterm.font(wezterm.target_triple == 'x86_64-pc-windows-msvc' and "DroidSansM Nerd Font" or "DroidSansMono Nerd Font")
config.font_size = 17.0
config.use_ime = true
-- transparency
-- config.window_background_opacity = 0.85
-- config.macos_window_background_blur = 20

-- https://wezfurlong.org/wezterm/colorschemes/index.html
config.color_scheme = "Dracula (Official)"
-- title bar
config.window_decorations = "RESIZE"
-- tab bar
config.show_new_tab_button_in_tab_bar = false

config.adjust_window_size_when_changing_font_size = false
config.force_reverse_video_cursor = true

-- Deveice ########################################################################
-- mouse
config.mouse_bindings = {
  {
    event = { Down = { streak = 1, button = 'Right' } },
    mods = "NONE",
    action = wezterm.action.PasteFrom 'Clipboard',
  },
}
-- keybinds
config.keys = require("keybinds").keys
config.key_tables = require("keybinds").key_tables

-- Others #########################################################################
-- weindows はPowerShell を利用
config.default_prog = wezterm.target_triple == 'x86_64-pc-windows-msvc' and {'powershell.exe'} or nil

-- update
config.check_for_updates = false

return config
