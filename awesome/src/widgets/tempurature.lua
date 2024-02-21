local awful = require("awful")
local gears = require("gears")
local wibox = require("wibox")
local dpi = require("beautiful").xresources.apply_dpi
local watch = awful.widget.watch

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

  watch (
    'sh ' .. Script_Dir .. 'get_temp.sh c',
    10,
    function(_, stdout)
      temp_widget:get_children_by_id('label')[1].text = stdout
    end
  )

  return temp_widget
end
