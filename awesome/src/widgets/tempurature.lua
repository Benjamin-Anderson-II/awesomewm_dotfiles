local gears = require("gears")
local wibox = require("wibox")
local dpi = require("beautiful").xresources.apply_dpi

return function()
  local temp_widget = wibox.widget {
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
      left = dpi(user_vars.margin-2),
      right = dpi(user_vars.margin),
      widget = wibox.container.margin
    },
    fg = user_vars.colors.red,
    bg = user_vars.colors.surface0,
    shape = function(cr, width, height)
      gears.shape.rectangle(cr, width, height)
    end,
    widget = wibox.container.background
  }

  awesome.connect_signal(
    "widget::temperature:update",
    function(stdout)
      temp_widget:get_children_by_id('label')[1].text = stdout
    end
  )

  return temp_widget
end
