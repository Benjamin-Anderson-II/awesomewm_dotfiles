local awful = require("awful")
local wibox = require("wibox")

return function()
  local sound_widget = wibox.widget {
    id = "icon",
    align = "center",
    valign = "center",
    visible = true,
    widget = wibox.widget.textbox
  }

  local get_volume = function()
    awful.spawn.easy_async("sh " .. Script_Dir .. "get_volume.sh",
      function(stdout)
        sound_widget.markup = "<span foreground = '" .. user_vars.colors.mauve .. "'>" .. stdout .. "</span>"
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
