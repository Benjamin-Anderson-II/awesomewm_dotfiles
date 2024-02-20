local dpi = require("beautiful").xresources.apply_dpi
local gears = require("gears")
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
      {
        {
          id = "label",
          align = "center",
          valign = "center",
          format = form,
          widget = wibox.widget.textclock
        },
        layout = wibox.layout.fixed.horizontal
      },
      left = dpi(user_vars.margin),
      right = dpi(user_vars.margin + user_vars.distance + 1),
      widget = wibox.container.margin
    },
    fg = user_vars.colors.flamingo,
    bg = user_vars.colors.surface0,
    shape = function (cr, width, height)
      gears.shape.rounded_rect(cr, width - dpi(user_vars.distance), height, 13)
    end,
    widget = wibox.container.background
  }
end
