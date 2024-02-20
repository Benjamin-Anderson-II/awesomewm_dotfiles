local awful = require("awful")
local beautiful = require("beautiful")
local dpi = beautiful.xresources.apply_dpi
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
    if s.index == 1 then
      s.myclock = require("src.widgets.clock")(true)
    else
      s.myclock = require("src.widgets.clock")(false)
    end
    s.mybattery = require("src.widgets.battery")()
    s.mywifi = require("src.widgets.wifi")()
    s.mytaglist = require("src.widgets.taglist")(s)
    s.mysound = require("src.widgets.sound")()
    s.mydisk = require("src.widgets.disk")()
    s.myweather = require("src.widgets.weather")()
    s.mybrightness = require("src.widgets.brightness")()

    local gradient = gears.color{
      type = "linear",
      from = { 0, 0 },
      to = { 0, 25 },
      stops = {
        { 0,   user_vars.colors.base },
        { 0.3, user_vars.colors.base .. "77" },
        { 0.6, user_vars.colors.base .. "33" },
        { 1,   user_vars.colors.base .. "00" },
      }
    }

    s.mywibox = awful.wibar({
      position = "top",
      screen = s,
      bg = gradient,
      height = dpi(33)
    })

    s.mywibox:setup {
      {
        {
          layout = wibox.layout.fixed.horizontal,
          s.mytaglist
        },
        widget = wibox.container.margin,
        margins = dpi(3)
      },
      nil,
      {
        {
          layout = wibox.layout.fixed.horizontal,
          s.mydisk,
          s.mywifi,
          s.mysound,
          s.mybrightness,
          s.mybattery,
          s.myclock,
          s.myweather,
          s.mypower
        },
        widget = wibox.container.margin,
        margins = dpi(3)
      },
      layout = wibox.layout.align.horizontal,
    }

    -- Note:
    -- if you want to have different widgets for different screens use
    -- `if s.index == 1 then` <- this referring to the laptop screen
  end
)
