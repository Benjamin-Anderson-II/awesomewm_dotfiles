local gears = require("gears")
local wibox = require("wibox")
local dpi = require("beautiful").xresources.apply_dpi

return function()
  local disk_widget = wibox.widget {
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
    fg = user_vars.colors.peach,
    bg = user_vars.colors.surface0,
    shape = function(cr, width, height)
      gears.shape.partially_rounded_rect(cr, width - dpi(user_vars.distance), height, false, true, true, false, 13)
    end,
    widget = wibox.container.background
  }

  awesome.connect_signal(
    "widget::disk:update",
    function(stdout)
      disk_widget:get_children_by_id("label")[1].text = stdout
    end
  )

  return disk_widget
end
