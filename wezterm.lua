local wezterm = require 'wezterm';

local config = {}

if wezterm.config_builder then
  config = wezterm.config_builder()
end

-- System #########################################################################
if wezterm.target_triple == 'x86_64-pc-windows-msvc' then
  config.default_prog = { 'powershell.exe' }
end
-- Visual #########################################################################
config.font = wezterm.font("DroidSansM Nerd Font")
config.font_size = 17.0
config.use_ime = true

-- システムの外観に応じたカラースキーマを選択
local function scheme_for_appearance(appearance)
  if appearance:find('Dark') then
    return 'Tokyo Night Storm'
  else
    return 'Ashes (light) (terminal.sexy)'
  end
end

-- https://wezfurlong.org/wezterm/colorschemes/index.html
-- システムの外観を取得してカラースキーマを設定
config.color_scheme = scheme_for_appearance(wezterm.gui.get_appearance())
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

-- Claude Code ####################################################################
local function is_claude(pane)
	local process = pane:get_foreground_process_info()
	if not process or not process.argv then
		return false
	end

	for _, arg in ipairs(process.argv) do
		if arg:find("claude") then
			return true
		end
	end
	return false
end

wezterm.on('bell', function(window, pane)
	if is_claude(pane) then
		window:toast_notification('Claude Code', 'Task completed', nil, 4000)

		if wezterm.target_triple:find("darwin") then
			wezterm.background_child_process({ "afplay", "/System/Library/Sounds/Submarine.aiff" })
		end
	end
end)

-- カスタム通知関数（OSC 777の代替）
-- 使用方法: printf "\e]777;notify;%s;%s\e\\" "title" "body" の代わりに
-- printf "\e]1337;SetUserVar=wezterm_notify=%s\e\\" "$(echo "title;body" | base64)"
wezterm.on('user-var-changed', function(window, pane, name, value)
	if name == 'wezterm_notify' then
		-- Base64デコードして通知内容を取得
		local decoded = wezterm.base64_decode(value)
		if decoded then
			local title, body = decoded:match("([^;]*);?(.*)")
			if title and title ~= "" then
				-- WezTerm独自のtoast通知を表示
				window:toast_notification(title, body or "", nil, 4000)
				
				-- macOSで通知音を再生
				if wezterm.target_triple:find("darwin") then
					wezterm.background_child_process({ "afplay", "/System/Library/Sounds/Submarine.aiff" })
				end
			end
		end
	end
end)
config.audible_bell = 'SystemBeep'
config.notification_handling = "AlwaysShow"

-- Others #########################################################################
-- update
config.check_for_updates = false

return config
