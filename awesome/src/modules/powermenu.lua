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
        -- top    = dpi(7),
        -- bottom = dpi(7),
        margins = dpi(0),
        widget = wibox.container.margin
      },
      fg = color,
      widget = wibox.container.background
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

  local shutdown_button = button("󰐥 Shut Down", "#f38ba8", shutdown_command)
  local reboot_button = button("󰜉 Reboot", "#fab387", reboot_command)
  local suspend_button = button("󰤄 Sleep", "#f9e2af", suspend_command)

  local powermenu = wibox.widget {
    --{
      {
        shutdown_button,
        reboot_button,
        suspend_button,
        spacing = dpi(5),
        layout = wibox.layout.fixed.vertical
      },
      margins = dpi(5),
      widget = wibox.container.margin
    --},
    --widget = wibox.container.background
  }

  local powermenu_container = wibox {
    border_width = 3,
    border_color = "#cba6f7",
    ontop   = true,
    visible = false,
    type    = "", -- TYPE NEEDS TO BE FIGURED OUT
    x       = s.geometry.width - dpi(130),
    y       = dpi(32),
    width   = dpi(120),
    height  = dpi(80),
    screen  = s,
    widget  = powermenu,
    bg      = "#161925e6",
    shape   = function(cr, width, height)
      gears.shape.rounded_rect(cr, width, height, 13)
    end,
    input_passthrough = true
  }

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
