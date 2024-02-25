local dpi = require("beautiful").xresources.apply_dpi
local gears = require("gears")
local nconf = require("naughty").config
theme.font = user_vars.font.bold

theme.bg_normal = "#161925e6"
theme.fg_normal = "#94e2d5"
theme.taglist_bg_occupied = "#00000000"
theme.taglist_bg_focus  = "#ea759b"
theme.taglist_fg_focus  = "#45475a"
theme.taglist_shape = function(cr, width, height)
  gears.shape.rounded_rect(cr, width, height, 13)
end

theme.useless_gap = 0
theme.border_width = dpi(1)
theme.border_normal = "#bac2de"
theme.border_focus  = "#f38ba8"

nconf.defaults.border_width = 0
nconf.defaults.margin = 16
nconf.defaults.shape = function(cr, width, height)
  gears.shape.rounded_rect(cr, width, height, 6)
end
nconf.defaults.text = "Boo!"
nconf.defaults.timeout = 3
nconf.padding = 8
nconf.presets.critical_bg = "#FE634E"
nconf.presets.critical_fg = "#fefefa"
nconf.presets.low.bg = "#1771F1"
nconf.presets.normal.bg = "#1771F1"
nconf.defaults.icon_size = 64
nconf.spacing = 8
theme.notification_font = user_vars.font.bold
theme.notification_opacity = 0.75
