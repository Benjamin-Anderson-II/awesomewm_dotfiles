local dpi = require("beautiful").xresources.apply_dpi
local gears = require("gears")
local nconf = require("naughty").config
local color = user_vars.colors

-- Widget Related Settings
theme.font = user_vars.font.bold
theme.bg_normal = color.surface2
theme.fg_normal = color.text
-- Taglist Related Settings
theme.taglist_bg_occupied = "#00000000"
theme.taglist_bg_focus  = color.maroon
theme.taglist_fg_focus  = color.surface1
theme.taglist_shape = function(cr, width, height)
  gears.shape.rounded_rect(cr, width, height, 13)
end

-- Client Related Settings
theme.useless_gap = 0
theme.border_width = dpi(1)
theme.border_normal = color.subtext1
theme.border_focus  = color.red

-- Notification Related Settings
nconf.spacing = 8
--naughty defaults
nconf.defaults.text = "Boo!"
nconf.defaults.icon_size = dpi(64)
nconf.defaults.timeout = 3
nconf.defaults.shape = function(cr, width, height)
  gears.shape.rounded_rect(cr, width, height, 13)
end
nconf.defaults.margin = 16
nconf.defaults.border_width = dpi(3)
-- naughty presets
nconf.presets.critical_bg = color.red
nconf.presets.critical_fg = color.base
nconf.presets.low.bg = color.crust
nconf.presets.normal.bg = color.crust
-- beautiful notif settings
theme.notification_font = user_vars.font.bold
theme.notification_opacity = 0.9
theme.notification_max_width = 350
theme.notification_max_height = 100
theme.notification_border_color = user_vars.colors.blue
