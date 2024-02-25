local wibox = require("wibox")

return function()
  local power_widget = wibox.widget {
    {
      id = "icon",
      align = "center",
      valign = "center",
      visible = true,
      widget = wibox.widget.textbox
    },
    fg = user_vars.colors.red,
    widget = wibox.container.background
  }

  power_widget:connect_signal(
    "button::release",
    function()
       awesome.emit_signal("module::powermenu:toggle")
    end
  )
  power_widget:get_children_by_id('icon')[1].text = "󰐥 "

  return power_widget
end
