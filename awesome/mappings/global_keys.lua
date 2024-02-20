local gears = require("gears")
local awful = require("awful")
local hotkeys_popup = require("awful.hotkeys_popup")

local modkey = user_vars.modkey

return gears.table.join(
---- AWESOME ----
  awful.key({ modkey }, "Esc", hotkeys_popup.show_help,
  { description = "Cheat Sheet", group = "Awesome" }),
  awful.key({ modkey, "Shift" }, "q",
    awesome.quit,
  { description = "Quit Awesome", group = "Awesome" }),
  awful.key({ modkey, "Shift" }, "r",
    awesome.restart,
  { description = "Restart Awesome", group = "Awesome" }),
  awful.key({ modkey }, "l",
    awful.layout.inc(1),
  { description = "select next layout", group = "Awesome" }),
  awful.key({ modkey, "Shift" }, "l",
    awful.layout.inc(-1),
  { description = "select previous layout", group = "Awesome" }),
  awful.key({ "Mod1", "Control" }, "Tab", function()
    awful.screen.focus_relative(1)
  end,
  { description = "Alt Tab", group = "Client" }),

---- APPLICATIONS ----
  awful.key({ modkey }, "space", function()
    awful.spawn(user_vars.terminal)
  end,
  { description = "Open Terminal", group = "Application" }),
  awful.key({ modkey }, "b", function()
    awful.util.spawn("firefox")
  end,
  {description = "Open Firefox", group = "Application"}),
  awful.key({ modkey }, "d", function()
    awful.util.spawn("discord")
  end,
  { description = "Open Discord", group = "Application"}),
  awful.key({ modkey }, "s", function()
    awful.util.spawn("spotify-launcher")
  end,
  { description = "Open Spotify", group = "Application"}),

---- SOUND ----
  awful.key({}, "XF86AudioRaiseVolume", function()
    awful.util.spawn_with_shell('sh ' .. Script_Dir .. 'set_volume.sh +')
    awesome.emit_signal("sound::volume:change")
  end,
  { description = "Raise Volume", group = "Sound"}),
  awful.key({}, "XF86AudioLowerVolume", function()
    awful.util.spawn_with_shell('sh ' .. Script_Dir .. 'set_volume.sh -')
    awesome.emit_signal("sound::volume:change")
  end,
  { description = "Lower Volume", group = "Sound"}),
  awful.key({}, "XF86AudioMute", function()
    awful.util.spawn_with_shell('sh ' .. Script_Dir .. 'set_volume.sh 0')
    awesome.emit_signal("sound::volume:change")
  end,
  { description = "Mute", group = "Sound"}),

---- Brightness ----
  awful.key({}, "XF86MonBrightnessDown", function()
    awful.util.spawn_with_shell("sh " .. Script_Dir .. "lower_brightness.sh")
    awesome.emit_signal("brightness::level:change")
  end,
  {description = "Lower Brightness", group = "Brightness"}),
  awful.key({}, "XF86MonBrightnessUp", function()
    awful.util.spawn_with_shell("sh " .. Script_Dir .. "raise_brightness.sh")
    awesome.emit_signal("brightness::level:change")
  end,
  {description = "Lower Brightness", group = "Brightness"}),

---- Screenshot ----
  awful.key({}, "Print", function()
    awful.util.spawn_with_shell("scrot -F '%Y-%m-%d_$wx$h.png' -s -e 'optipng $f; mkdir -p ~/Pictures/screenshots; mv $f ~/Pictures/screenshots/'")
  end,
  { description = "Screenshot focused window", group = "Screenshot" }),

---- LAUNCHERS ----
  awful.key({ modkey }, "r", function()
    awful.util.spawn("dmenu")
  end,
  {description = "Run Dmenu", group = "Launcher"})
)
