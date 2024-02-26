local wibox = require("wibox")

return function(short)
  local clock_widget = wibox.widget {
    id = "label",
    align = "center",
    valign = "center",
    visible = true,
    widget = wibox.widget.textbox
  }

  awesome.connect_signal(
    "widget::clock:update",
    function(stdout)
      if short then
        stdout = string.gsub(stdout, "(.*):.*", "%1")
        stdout = string.gsub(stdout, "am", "")
      end
      clock_widget.markup = "<span foreground = '" .. user_vars.colors.text .. "'>" .. stdout .. "</span>"
    end
  )

  return clock_widget
end
