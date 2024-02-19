local awful = require("awful")
local gears = require("gears")
local wibox = require('wibox')
local dpi = require("beautiful").xresources.apply_dpi
local watch = awful.widget.watch

return function()
  local wifi_widget = wibox.widget {
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
    fg = "#89b4fa",
    bg = "#161925e6",
    shape = function(cr, width, height)
      gears.shape.partially_rounded_rect(cr, width, height, true, false, false, true, 13)
    end,
    widget = wibox.container.background
  }

  local function update_wifi()
    awful.spawn.easy_async_with_shell(
      "sh " .. Script_Dir .. "network.sh",
      function(stdout)
        wifi_widget:get_children_by_id('label')[1].text = stdout
      end
    )
  end

  watch (
    [[nmcli -t -f NAME c s -a ; nmcli -t -f CONNECTIVITY g]],
    5,
    function()
      update_wifi()
    end
  )

  return wifi_widget
end
