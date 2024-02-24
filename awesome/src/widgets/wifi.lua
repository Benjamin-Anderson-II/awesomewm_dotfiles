local gears = require("gears")
local wibox = require('wibox')
local dpi = require("beautiful").xresources.apply_dpi

return function()
  local wifi_widget = wibox.widget {
    {
      {
        {
          id = "label",
          align = "center",
          valign = "center",
          visible = true,
          widget = wibox.widget.textbox
        },
        layout = wibox.layout.fixed.horizontal
      },
      left = dpi(user_vars.margin),
      right = dpi(user_vars.margin + user_vars.distance + 1),
      widget = wibox.container.margin
    },
    fg = user_vars.colors.blue,
    bg = user_vars.colors.surface0,
    shape = function(cr, width, height)
      gears.shape.rounded_rect(cr, width - dpi(user_vars.distance), height, 13)
    end,
    widget = wibox.container.background
  }

  awesome.connect_signal(
    "widget::network:update",
    function(stdout)
      wifi_widget:get_children_by_id('label')[1].text = stdout
    end
  )

  return wifi_widget
end
