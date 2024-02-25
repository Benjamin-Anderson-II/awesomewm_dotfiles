local wibox = require("wibox")

return function()
  local gpu_widget = wibox.widget {
    id = "label",
    align = "center",
    valign = "center",
    visible = true,
    widget = wibox.widget.textbox
  }

  awesome.connect_signal(
    "widget::gpu:update",
    function(stdout)
      gpu_widget.markup = "<span foreground = '" .. user_vars.colors.green .. "'>" .. stdout .. "</span>"
    end
  )

  return gpu_widget
end
