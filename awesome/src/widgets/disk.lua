local wibox = require("wibox")

return function()
  local disk_widget = wibox.widget {
    id = "label",
    align = "center",
    valign = "center",
    visible = true,
    widget = wibox.widget.textbox
  }

  awesome.connect_signal(
    "widget::disk:update",
    function(stdout)
      disk_widget.markup = "<span foreground = '" .. user_vars.colors.peach .. "'>" .. stdout .. "</span>"
    end
  )

  return disk_widget
end
