local awful = require("awful")
local gears = require("gears")
local wibox = require('wibox')
local dpi = require("beautiful").xresources.apply_dpi
local watch = awful.widget.watch

return function()
  local battery_widget = wibox.widget {
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
      right = dpi(1 + user_vars.distance + user_vars.margin),
      widget = wibox.container.margin
    },
    fg = user_vars.colors.green,
    bg = user_vars.colors.surface0,
    shape = function(cr, width, height)
      gears.shape.partially_rounded_rect(cr,
                                         width - dpi(user_vars.distance),
                                         height,
                                         false,
                                         true,
                                         true,
                                         false,
                                         13
                                        )
    end,
    widget = wibox.container.background
  }

  local function update_battery()
    awful.spawn.easy_async_with_shell(
      [[acpi -b | sed -n 's/.* \(.*\)%.*/󰁹 \1%/p']],
      function(stdout)
        battery_widget:get_children_by_id('label')[1].text = stdout
      end
    )
  end

  watch (
    "echo a",
    5,
    function()
      update_battery()
    end
  )

  return battery_widget
end
