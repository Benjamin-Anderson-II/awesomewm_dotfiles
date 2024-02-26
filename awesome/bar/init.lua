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
    gears.wallpaper.maximized(wallpaper, s, false)
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
    local wp   = "src.widgets."
    local pill = require(wp.."pill")
    local wt   = require(wp.."watch_template")
    local cols = user_vars.colors
    local sig  = function(str) return "widget::"..str..":update" end

    if s.index == 1 then
      s.myclock = require(wp.."clock")(true)
    else
      s.myclock = require(wp.."clock")(false)
    end

    s.mypower   = require(wp.."power")()
    s.mytaglist = require(wp.."taglist")(s)

    -- controllable widgets
    s.mysound      = require(wp.."sound")()
    s.mybrightness = require(wp.."brightness")()

    -- watcher widgets
    s.mybattery = wt(cols.green,    sig "battery")
    s.mywifi    = wt(cols.blue,     sig "network")
    s.mydisk    = wt(cols.peach,    sig "disk")
    s.myweather = wt(cols.yellow,   sig "weather")
    s.mymemory  = wt(cols.sapphire, sig "memory")
    s.mycpu     = wt(cols.lavender, sig "cpu")
    s.mytemp    = wt(cols.red,      sig "temperature")
    s.mygpu     = wt(cols.green,    sig "gpu")

    s.pill1 = pill({ s.mycpu, s.mygpu, s.mymemory, s.mytemp, s.mydisk })
    s.pill2 = pill({ s.mywifi })
    s.pill3 = pill({ s.mysound, s.mybrightness, s.mybattery })
    s.pill4 = pill({ s.myclock })
    s.pill_weather = pill({ s.myweather })
    s.pill_power = pill({ s.mypower })

    s.pill_weather:get_children_by_id('m')[1].left = dpi(0)
    s.pill_power:get_children_by_id('m')[1].left = math.floor(user_vars.margin * 1.5)
    s.pill_power:get_children_by_id('m')[1].right = dpi(1)

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
      height = dpi(35)
    })

    s.mywibox:setup {
      nil,
      {
        {
          {
            nil,
            s.mytaglist,
            nil,
            expand = "outside",
            layout = wibox.layout.align.horizontal
          },
          {
            {
              s.pill1,
              s.pill2,
              spacing = dpi(user_vars.distance),
              layout = wibox.layout.fixed.horizontal
            },
            nil,
            {
              s.pill3,
              s.pill4,
              s.pill_weather,
              s.pill_power,
              spacing = user_vars.distance,
              layout = wibox.layout.fixed.horizontal
            },
            layout = wibox.layout.align.horizontal
          },
          layout = wibox.layout.stack
        },
        widget = wibox.container.margin,
        top = dpi(3),
        bottom = dpi(3),
        left = dpi(10),
        right = dpi(10),
      },
      nil,
      layout = wibox.layout.align.horizontal,
    }
  end
)
