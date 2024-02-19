local awful = require("awful")
local dpi   = require("beautiful").xresources.apply_dpi
local gears = require("gears")
local wibox = require("wibox")

return function()
  local sound_widget = wibox.widget {
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
      left = dpi(7),
      right = dpi(12),
      widget = wibox.container.margin
    },
    fg = "#cba6f7",
    bg = "#161925e6",
    shape = function(cr, width, height)
      gears.shape.rounded_rect(cr, width - dpi(5), height, 13)
    end,
    widget = wibox.container.background
  }

  awesome.connect_signal(
    "sound::volume:change",
    function()
      awful.spawn.easy_async("sh " .. Script_Dir .. "get_volume.sh",
        function(stdout)
          sound_widget:get_children_by_id("icon")[1].text = stdout
        end
      )
    end
  )

  -- add connect signal to mouse 1, 4, 5 for mute, vol up, and vol down respectively

  awful.spawn.easy_async("sh /home/Ben/.config/awesome/src/scripts/get_volume.sh",
    function(stdout)
      sound_widget:get_children_by_id("icon")[1].text = stdout
    end
  )

  return sound_widget
end
