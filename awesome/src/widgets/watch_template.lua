local wibox = require("wibox")

return function(color, signal)
  color = color or user_vars.colors.text
  local w = wibox.widget {
    id = "label",
    align = "center",
    valign = "center",
    visible = true,
    widget = wibox.widget.textbox
  }

  awesome.connect_signal(
    signal,
    function(stdout)
      w.markup = "<span foreground = '" .. color .. "'>" .. stdout .. "</span>"
    end
  )

  return w
end
