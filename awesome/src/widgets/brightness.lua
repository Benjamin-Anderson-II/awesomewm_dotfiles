local awful = require("awful")
local dpi   = require("beautiful").xresources.apply_dpi
local gears = require("gears")
local wibox = require("wibox")

return function()
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

  local get_brightness = function ()
    awful.spawn.easy_async("sh " .. Script_Dir .. "get_brightness.sh",
      function(stdout)
        brightness_widget:get_children_by_id("icon")[1].text = stdout
      end
    )
  end

  brightness_widget:buttons(awful.util.table.join(
    awful.button({}, 4, function()
      awful.util.spawn("sh " .. Script_Dir .. "raise_brightness.sh")
      awesome.emit_signal("brightness::level:change")
    end),
    awful.button({}, 5, function()
      awful.util.spawn("sh " .. Script_Dir .. "lower_brightness.sh")
      awesome.emit_signal("brightness::level:change")
    end)
  ))

  awesome.connect_signal(
    "brightness::level:change",
    get_brightness
  )

  awesome.emit_signal("brightness::level:change")

  return brightness_widget
end
