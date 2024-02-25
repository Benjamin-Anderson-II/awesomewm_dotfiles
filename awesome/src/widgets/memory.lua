local wibox = require("wibox")

return function()
  local memory_widget = wibox.widget {
    align = "center",
    valign = "center",
    visible = true,
    widget = wibox.widget.textbox
  }

  awesome.connect_signal(
    "widget::memory:update",
    function(stdout)
      memory_widget.markup = "<span foreground = '" .. user_vars.colors.sapphire .. "'>" .. stdout .. "</span>"
    end
  )

  return memory_widget
end
