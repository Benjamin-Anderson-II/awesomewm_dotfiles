-- This is for mouse buttons !!! --

local awful = require("awful")
local gears = require("gears")

root.buttons = gears.table.join(
  awful.button({}, 4, awful.tag.viewnext),
  awful.button({}, 5, awful.tag.viewprev)
)
