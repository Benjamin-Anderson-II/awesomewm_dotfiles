local dpi = require("beautiful").xresources.apply_dpi
local gears = require("gears")
local wibox = require("wibox")

return function()
  local power_widget = wibox.widget {
    {
      {
        {
          id = "icon",
          align = "center",
          valign = "center",
          visible = true,
          widget = wibox.widget.textbox
        },
        layout = wibox.layout.fixed.horizontal
      },
      left = dpi(user_vars.margin+2),
      right = dpi(1),
      widget = wibox.container.margin
    },
    fg = user_vars.colors.red,
    bg = user_vars.colors.surface0,
    shape = function(cr, width, height)
      gears.shape.rounded_rect(cr, width, height, 13)
    end,
    widget = wibox.container.background
  }

  power_widget:connect_signal(
    "button::release",
    function()
--      awful.util.spawn_with_shell("shutdown now")
       awesome.emit_signal("module::powermenu:toggle")
    end
  )
  power_widget:get_children_by_id('icon')[1].text = "󰐥 "

  return power_widget
end
