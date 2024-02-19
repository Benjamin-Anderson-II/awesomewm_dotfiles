local awful = require("awful")

require("src.theme.user_variables")
require("src.theme.init")
require("src.core.error_handling")
require("src.core.signals")
require("src.core.notifications")
require("src.core.rules")
require("mappings.global_buttons")
require("mappings.bind_to_tags")
require("bar.init")

awful.spawn.with_shell("picom -o 0")
awful.spawn.with_shell("autorandr -c")
--[[gears.timer {
  timeout = 30,
  autostart = true,
  callback = function() collectgarbage() end
}]]--
