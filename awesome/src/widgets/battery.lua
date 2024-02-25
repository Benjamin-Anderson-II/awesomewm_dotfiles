local wibox = require('wibox')

return function()
  local battery_widget = wibox.widget {
          id = "label",
          align = "center",
          valign = "center",
          visible = true,
          widget = wibox.widget.textbox
  }

  awesome.connect_signal(
    "widget::battery:update",
    function(stdout)
      battery_widget.markup = "<span foreground = '" .. user_vars.colors.green .. "'>" .. stdout .. "</span>"
    end
  )

  return battery_widget
end
