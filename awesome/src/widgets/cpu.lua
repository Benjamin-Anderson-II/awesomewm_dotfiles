local wibox = require("wibox")

return function()
  local cpu_widget = wibox.widget {
    align = "center",
    valign = "center",
    visible = true,
    widget = wibox.widget.textbox
  }

  awesome.connect_signal(
    "widget::cpu:update",
    function(stdout)
      cpu_widget.markup = "<span foreground = '" .. user_vars.colors.lavender .. "'>" .. stdout .. "</span>"
    end
  )

  return cpu_widget
end
