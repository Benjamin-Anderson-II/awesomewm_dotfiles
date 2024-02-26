local dpi = require("beautiful").xresources.apply_dpi
local gears = require("gears")
local nconf = require("naughty").config
theme.font = user_vars.font.bold

local color = user_vars.colors

theme.bg_normal = color.surface2
theme.fg_normal = color.text
theme.taglist_bg_occupied = "#00000000"
theme.taglist_bg_focus  = color.maroon
theme.taglist_fg_focus  = color.surface1
theme.taglist_shape = function(cr, width, height)
  gears.shape.rounded_rect(cr, width, height, 13)
end

theme.useless_gap = 0
theme.border_width = dpi(1)
theme.border_normal = color.subtext1
theme.border_focus  = color.red

nconf.defaults.border_width = 0
nconf.defaults.margin = 16
nconf.defaults.shape = function(cr, width, height)
  gears.shape.rounded_rect(cr, width, height, 6)
end
nconf.defaults.text = "Boo!"
nconf.defaults.timeout = 3
nconf.padding = 8
nconf.presets.critical_bg = color.red
nconf.presets.critical_fg = color.base
nconf.presets.low.bg = color.crust
nconf.presets.normal.bg = color.crust
nconf.defaults.icon_size = 64
nconf.spacing = 8
theme.notification_font = user_vars.font.bold
theme.notification_opacity = 0.75
