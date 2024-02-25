local wibox = require("wibox")

return function()
  local weather_widget = wibox.widget {
          id = "label",
          align = "center",
          valign = "center",
          visible = true,
          widget = wibox.widget.textbox
  }

  awesome.connect_signal(
    "widget::weather:update",
    function(stdout)
      weather_widget.markup = "<span foreground = '" .. user_vars.colors.yellow .. "'>" .. stdout .. "</span>"
    end
  )

  return weather_widget
end
