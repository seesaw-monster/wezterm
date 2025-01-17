local wezterm = require 'wezterm';

local config = {}

if wezterm.config_builder then
  config = wezterm.config_builder()
end

-- Visual #########################################################################
-- config.font = wezterm.font(wezterm.target_triple == 'x86_64-pc-windows-msvc' and "DroidSansM Nerd Font" or "DroidSansMono Nerd Font")
config.font = wezterm.font("DroidSansM Nerd Font")
config.font_size = 17.0
config.use_ime = true

-- https://wezfurlong.org/wezterm/colorschemes/index.html
config.color_scheme = "Dracula (Official)"
-- title bar
config.window_decorations = "RESIZE"

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
config.default_prog = wezterm.target_triple == 'x86_64-pc-windows-msvc' and {'C:\\Program Files\\PowerShell\\7\\pwsh.exe'} or nil

-- update
config.check_for_updates = false

return config
