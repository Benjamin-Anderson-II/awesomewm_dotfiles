local dpi = require("beautiful").xresources.apply_dpi
local gears = require("gears")
local wibox = require("wibox")

return function(short)
  local form = ""
  if short then
    form = "󰥔 %I:%M 󰃭 %a"
  else
    form = "󰥔 %I:%M%P 󰃭 %a, %m/%d/%y"
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
      left = dpi(7),
      right = dpi(12),
      widget = wibox.container.margin
    },
    fg = "#74c7ec",
    bg = "#161925e6",
    shape = function (cr, width, height)
      gears.shape.partially_rounded_rect(cr, width - dpi(5), height, false, true, true, false, 13)
    end,
    widget = wibox.container.background
  }
end
