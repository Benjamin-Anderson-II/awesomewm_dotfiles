local awful = require("awful")
local gears = require("gears")
local wibox = require("wibox")
local dpi = require("beautiful").xresources.apply_dpi
local watch = awful.widget.watch

return function()
  local cpu_widget = wibox.widget {
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
      right = dpi(user_vars.margin - 2),
      widget = wibox.container.margin
    },
    fg = user_vars.colors.lavender,
    bg = user_vars.colors.surface0,
    shape = function(cr, width, height)
      gears.shape.partially_rounded_rect(cr, width, height, true, false, false, true, 13)
    end,
    widget = wibox.container.background
  }

  watch (
    'sh ' .. Script_Dir .. 'cpu.sh',
    2,
    function(_, stdout)
      cpu_widget:get_children_by_id('label')[1].text = stdout
    end
  )

  return cpu_widget
end
