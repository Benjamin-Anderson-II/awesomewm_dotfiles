local wibox = require("wibox")

return function()
  local temp_widget = wibox.widget {
    id = "label",
    align = "center",
    valign = "center",
    visible = true,
    widget = wibox.widget.textbox
  }

  awesome.connect_signal(
    "widget::temperature:update",
    function(stdout)
      temp_widget.markup = "<span foreground = '" .. user_vars.colors.red .. "'>" .. stdout .. "</span>"
    end
  )

  return temp_widget
end
