local awful = require("awful")
local dpi   = require("beautiful").xresources.apply_dpi
local gears = require("gears")
local wibox = require("wibox")

return function()
  local margin = 5
  local brightness_widget = wibox.widget {
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
      left = dpi(user_vars.margin - 2),
      right = dpi(user_vars.margin),
      widget = wibox.container.margin
    },
    fg = user_vars.colors.peach,
    bg = user_vars.colors.surface0,
    shape = function(cr, width, height)
      gears.shape.rectangle(cr, width, height)
    end,
    widget = wibox.container.background
  }

  awesome.connect_signal(
    "brightness::level:change",
    function()
      awful.spawn.easy_async("sh " .. Script_Dir .. "get_brightness.sh",
        function(stdout)
          brightness_widget:get_children_by_id("icon")[1].text = stdout
        end
      )
    end
  )

  -- add connect signal to mouse 1, 4, 5 for mute, vol up, and vol down respectively

  awful.spawn.easy_async("sh " .. Script_Dir .. "get_brightness.sh",
    function(stdout)
      brightness_widget:get_children_by_id("icon")[1].text = stdout
    end
  )

  return brightness_widget
end
