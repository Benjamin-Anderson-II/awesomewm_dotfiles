local awful = require("awful")
local wibox = require("wibox")
local gears = require("gears")
local beautiful = require("beautiful")
local dpi = beautiful.xresources.apply_dpi

return function(s, widg)
  s.test_widget = wibox.widget({
    {
      {
        widget = wibox.widget.textbox,
        text = "TEST TEXT GOES HERE",
        valign = "center",
        align = "center",
      },
      layout = wibox.layout.fixed.horizontal,
    },
    widget = wibox.container.background,
    bg = user_vars.colors.overlay0,
    fg = user_vars.colors.text,
    shape = gears.shape.rectangle,
  })


  s.sidebar = awful.popup({
    type = "dock",
    screen = s,
    minimum_height = s.geometry.height - (beautiful.wibar_height + dpi(10)),
    maximum_height = s.geometry.height - (beautiful.wibar_height + dpi(10)),
    minimum_width = dpi(400),
    maximum_width = dpi(400),
    bg = "#FF000000",
    ontop = true,
    visible = false,
    placement = function(w)
      awful.placement.top_right(w, { margins = {
          right = user_vars.margin,
      }})
      awful.placement.maximize_vertically(
        w,
        { honor_workarea = true, margins = {
          top = user_vars.margin,
          bottom = user_vars.margin,
        }}
      )
    end,
    widget = {
      {
        {
          {
            {
              widg,
              margins = user_vars.margin,
              widget = wibox.container.margin
            },
            layout = wibox.layout.fixed.vertical,
          },
          bg = user_vars.colors.crust,
          shape = function(cr, width, height)
            gears.shape.rounded_rect(cr, width, height, 13 * 2)
          end,
          widget = wibox.container.background,
        },
        -- hack because borders won't work
        margins = dpi(2),
        widget = wibox.container.margin,
      },
      bg = user_vars.colors.mauve,
      shape = function(cr, width, height)
        gears.shape.rounded_rect(cr, width, height, 13 * 2)
      end,
      widget = wibox.container.background,
    }
  })

  awesome.connect_signal("sidebar::toggle", function(scr)
    if scr == s then
      s.sidebar.visible = not s.sidebar.visible
    end
  end)
end
