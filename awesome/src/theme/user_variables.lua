local awful = require("awful")
local gears = require("gears")
Theme_Dir = gears.filesystem.get_configuration_dir() .. "/src/theme/"
Script_Dir = gears.filesystem.get_configuration_dir() .. "/src/scripts/"

user_vars = {
  layouts = {
    awful.layout.suit.spiral.dwindle,
    awful.layout.suit.floating,
    awful.layout.suit.tile,
    awful.layout.suit.tile.left,
    awful.layout.suit.tile.bottom,
    awful.layout.suit.tile.top,
    awful.layout.suit.fair,
    awful.layout.suit.fair.horizontal,
    awful.layout.suit.corner.nw,
    awful.layout.suit.corner.ne,
    awful.layout.suit.corner.sw,
    awful.layout.suit.corner.se,
    awful.layout.suit.magnifier,
    awful.layout.suit.max,
    awful.layout.suit.max.fullscreen,
  },

  network = {
    wlan = "wlo1",
    ethernet = "eno1"
  },

  font = {
    regular   = "Mononoki Nerd Font, 12",
    bold      = "Mononoki Nerd Font, bold 12",
    extrabold = "Mononoki Nerd Font, ExtraBold 12",
    specify   = "Mononoki Nerd Font"
  },

  terminal = "kitty",

  modkey = "Mod4",

  wallpaper = Theme_Dir .. "minimal_arch.jpg",

  namestyle = "userhost",

  screenshot_program = "scrot '%Y-%m-%d_$wx$h.png -e 'optipng $f ; mv $f ~/Pictures/Screenshots/'",

  file_manager = "dolphin"
}
