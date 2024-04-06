local gears = require("gears")
local wibox = require("wibox")
local dpi = require("beautiful").xresources.apply_dpi

return function(contents)
  local pill = wibox.widget {
    {
      {
        id = 'container',
        spacing = dpi(user_vars.margin * 2),
        layout = wibox.layout.fixed.horizontal
      },
      id = "m",
      left = dpi(user_vars.margin),
      right = dpi(user_vars.margin),
      widget = wibox.container.margin
    },
    bg = user_vars.colors.surface0,
    shape = function(cr, width, height)
      gears.shape.rounded_rect(cr, width, height, 13)
    end,
    widget = wibox.container.background
  }

  for _, c in ipairs(contents) do
    pill:get_children_by_id('container')[1]:add(c)
  end
  return pill
end
