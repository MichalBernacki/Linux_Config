local wezterm = require 'wezterm'
local act = wezterm.action
local config = {}

config.color_scheme = 'Tokyo Night Moon'

config.audible_bell = 'Disabled'

config.font_size = 13.0


config.initial_rows = 26
config.initial_cols = 90

config.mouse_bindings = {
	{
		event = { Down = { streak = 1, button = "Right" } },
		mods = "NONE",
		action = wezterm.action_callback(function(window, pane)
			local has_selection = window:get_selection_text_for_pane(pane) ~= ""
			if has_selection then
				window:perform_action(act.CopyTo("ClipboardAndPrimarySelection"), pane)
				window:perform_action(act.ClearSelection, pane)
			else
				window:perform_action(act({ PasteFrom = "Clipboard" }), pane)
			end
		end),
	},
}


return config


