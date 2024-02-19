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
      left = dpi(7),
      right = dpi(3),
      widget = wibox.container.margin
    },
    fg = "#a6e3a1",
    bg = "#161925e6",
    shape = function(cr, width, height)
      gears.shape.rectangle(cr, width, height)
    end,
    widget = wibox.container.background
  }

  local function update_battery()
    awful.spawn.easy_async_with_shell(
      [[acpi -b | sed -n 's/.* \(.*\)%.*/\1%/p']],
      function(stdout)
        battery_widget:get_children_by_id('label')[1].text = "󰁹 "..stdout
      end
    )
  end

  watch (
    [[acpi -b | sed -n 's/.* \(.*\)%.*/\1%/p']],
    5,
    function()
      update_battery()
    end
  )

  return battery_widget
end
