local awful = require("awful")
local dpi   = require("beautiful").xresources.apply_dpi
local gears = require("gears")
local wibox = require("wibox")

return function(s)
  local button = function(name, color, callback)
    local item = wibox.widget {
      {
        {
          {
            id     = "txt",
            align  = "center",
            valign = "center",
            widget = wibox.widget.textbox
          },
          layout = wibox.layout.fixed.horizontal
        },
        fg = color,
        widget = wibox.container.background
      },
      left = dpi(3),
      widget = wibox.container.margin
    }

    item:connect_signal(
      "button::release",
      function()
        callback()
      end
    )

    item:get_children_by_id('txt')[1].text = name

    return item
  end

  local shutdown_command = function()
    awful.spawn("shutdown now")
    awesome.emit_signal("module::powermenu:toggle")
  end

  local reboot_command = function()
    awful.spawn("reboot")
    awesome.emit_signal("module::powermenu:toggle")
  end

  local suspend_command = function()
    awful.spawn("systemctl suspend")
    awesome.emit_signal("module::powermenu:toggle")
  end

  local shutdown_button = button("󰐥 Shut Down", user_vars.colors.red, shutdown_command)
  local reboot_button = button("󰜉 Reboot", user_vars.colors.peach, reboot_command)
  local suspend_button = button("󰤄 Sleep", user_vars.colors.yellow, suspend_command)

  local powermenu = wibox.widget {
    {
      shutdown_button,
      reboot_button,
      suspend_button,
      spacing = dpi(5),
      layout = wibox.layout.flex.vertical
    },
    margins = dpi(5),
    widget = wibox.container.margin
  }

  local powermenu_container = wibox {
    border_width = 3,
    border_color = user_vars.colors.mauve,
    ontop   = true,
    visible = false,
    type    = "dock",
    width   = dpi(150),
    height  = dpi(80),
    screen  = s,
    widget  = powermenu,
    bg      = user_vars.colors.surface0,
    shape   = function(cr, width, height)
      gears.shape.rounded_rect(cr, width, height, 13)
    end,
    input_passthrough = true
  }

  awful.placement.top_right(powermenu_container, {
    parent = mouse.current_wibox,
    margins = {
      top = dpi(35),
      right = dpi(3)
    }
  })

  local keygrabber_started = false
  local powermenu_keygrabber = awful.keygrabber {
    autostart   = false,
    stop_event  = "release",
    keypressed_callback = function(_, _, key, _)
      if key == "Escape" then
        awesome.emit_signal("module::powermenu:toggle")
      end
    end,
    start_callback = function(_)
      keygrabber_started = true
    end,
    stop_callback = function(_, _, _, _)
      keygrabber_started = false
    end
  }

  awesome.connect_signal(
    "module::powermenu:toggle",
    function()
      if keygrabber_started then
        powermenu_keygrabber:stop()
        powermenu_container.visible = false
        powermenu_container.input_passthrough = true
      else
        if s == mouse.screen then
          powermenu_keygrabber:start()
          powermenu_container.visible = true
          powermenu_container.input_passthrough = false
        end
      end
    end
  )
end
