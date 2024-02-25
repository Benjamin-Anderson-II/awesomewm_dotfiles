local wibox = require("wibox")

return function(short)
  local form = ""
  if short then
    form = "󰥔 %I:%M 󰃭 %a"
  else
    form = "󰥔 %I:%M%P 󰃭 %a: %b %d"
  end
  return wibox.widget {
    {
      id = "label",
      align = "center",
      valign = "center",
      format = form,
      widget = wibox.widget.textclock
    },
    fg = user_vars.colors.flamingo,
    widget = wibox.container.background
  }
end
