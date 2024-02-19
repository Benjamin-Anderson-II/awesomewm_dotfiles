local awful = require("awful")
local beautiful = require("beautiful")
local gears = require("gears")
local wibox = require("wibox")

local function set_wallpaper(s)
  if beautiful.wallpaper then
    local wallpaper = beautiful.wallpaper
    if type(wallpaper) == 'function' then
      wallpaper = wallpaper(s)
    end
    gears.wallpaper.maximized(wallpaper, s, true)
  end
end

awful.screen.connect_for_each_screen(
  function(s)
    set_wallpaper(s)
    awful.layout.layouts = user_vars.layouts
    awful.tag(
      { ' 1 ', ' 2 ', ' 3 ', ' 4 ', ' 5 ', ' 6 ', ' 7 ', ' 8 ', ' 9 ' },
      s,
      user_vars.layouts[1]
    )

    require("src.modules.powermenu")(s)

    s.mypower = require("src.widgets.power")()
    s.myclock = require("src.widgets.clock")(true)
    s.mybattery = require("src.widgets.battery")()
    s.mywifi = require("src.widgets.wifi")()
    s.mytaglist = require("src.widgets.taglist")(s)
    s.mysound = require("src.widgets.sound")()

    s.mywibox = awful.wibar({ position = "top", screen = s, bg = "#00000000"})
    s.mywibox:setup {
      layout = wibox.layout.align.horizontal,
      {
        layout = wibox.layout.fixed.horizontal,
        s.mytaglist
      },
      nil,
      {
        layout = wibox.layout.fixed.horizontal,
        s.mysound,
        s.mywifi,
        s.mybattery,
        s.myclock,
        s.mypower
      },
    }

    -- Note:
    -- if you want to have different widgets for different screens use
    -- `if s.index == 1 then` <- this referring to the laptop screen
  end
)
