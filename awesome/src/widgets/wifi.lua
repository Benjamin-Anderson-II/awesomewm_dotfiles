local wibox = require('wibox')

return function()
  local wifi_widget = wibox.widget {
    align = "center",
    valign = "center",
    visible = true,
    widget = wibox.widget.textbox
  }

  awesome.connect_signal(
    "widget::network:update",
    function(stdout)
      wifi_widget.markup = "<span foreground = '" .. user_vars.colors.blue .. "'>" .. stdout .. '</span>'
    end
  )

  return wifi_widget
end
