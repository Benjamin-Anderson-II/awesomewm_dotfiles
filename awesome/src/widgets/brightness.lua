local awful = require("awful")
local wibox = require("wibox")

return function()
  local brightness_widget = wibox.widget {
    {
      id = "icon",
      align = "center",
      valign = "center",
      visible = true,
      widget = wibox.widget.textbox
    },
    fg = user_vars.colors.peach,
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
      awful.spawn("sh " .. Script_Dir .. "raise_brightness.sh")
      awesome.emit_signal("brightness::level:change")
    end),
    awful.button({}, 5, function()
      awful.spawn("sh " .. Script_Dir .. "lower_brightness.sh")
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
