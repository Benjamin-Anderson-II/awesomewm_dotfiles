local awful = require("awful")
local dpi   = require("beautiful").xresources.apply_dpi
local gears = require("gears")
local wibox = require("wibox")

return function()
  local sound_widget = wibox.widget {
    {
      {
        {
          id = "icon",
          align = "center",
          valign = "center",
          visible = true,
          widget = wibox.widget.textbox
        },
        layout = wibox.layout.fixed.horizontal
      },
      left = dpi(user_vars.margin),
      right = dpi(user_vars.margin - 2),
      widget = wibox.container.margin
    },
    fg = user_vars.colors.mauve,
    bg = user_vars.colors.surface0,
    shape = function(cr, width, height)
      gears.shape.partially_rounded_rect(cr, width, height, true, false, false, true, 13)
    end,
    widget = wibox.container.background,
    buttons = gears.table.join()
  }

  local get_volume = function()
    awful.spawn.easy_async("sh " .. Script_Dir .. "get_volume.sh",
      function(stdout)
        sound_widget:get_children_by_id("icon")[1].text = stdout
      end
    )
  end

  sound_widget:buttons(awful.util.table.join(
    awful.button({}, 1, function()
      awful.util.spawn("sh " .. Script_Dir .. "set_volume.sh 0")
      awesome.emit_signal("sound::volume:change")
    end),
    awful.button({}, 4, function()
      awful.util.spawn("sh " .. Script_Dir .. "set_volume.sh +")
      awesome.emit_signal("sound::volume:change")
    end),
    awful.button({}, 5, function()
      awful.util.spawn("sh " .. Script_Dir .. "set_volume.sh -")
      awesome.emit_signal("sound::volume:change")
    end)
  ))

  awesome.connect_signal(
    "sound::volume:change",
    get_volume
  )

  awesome.emit_signal("sound::volume:change")

  return sound_widget
end
