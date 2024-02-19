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
      left = dpi(10),
      right = dpi(13),
      widget = wibox.container.margin
    },
    fg = "#f38ba8",
    bg = "#161925e6",
    shape = function(cr, width, height)
      gears.shape.rounded_rect(cr, width - dpi(10), height, 13)
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
