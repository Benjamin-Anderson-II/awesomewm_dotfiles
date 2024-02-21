local awful = require("awful")
local gears = require("gears")
local wibox = require("wibox")
local dpi = require("beautiful").xresources.apply_dpi
local watch = awful.widget.watch

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

  local function update_disk()
    awful.spawn.easy_async_with_shell(
      "echo  $(df -h | rg -U '/\\n' | sed -n 's/.* .* \\([0-9].*[A-Z]\\).*/\\1/p' | sed 's/.$//') GiB",
      function(stdout)
        disk_widget:get_children_by_id('label')[1].text = stdout
      end
    )
  end

  watch (
    'echo a',
    300,
    function()
      update_disk()
   end
  )

  return disk_widget
end
