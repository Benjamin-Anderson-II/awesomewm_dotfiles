local awful = require("awful")
local gears = require("gears")

local modkey = user_vars.modkey

return gears.table.join(
  awful.key(
    { modkey }, "f", function(c)
      c.fullscreen = not c.fullscreen
      c:raise()
    end,
    { description = "Toggle fullscreen", group = "Client" }
  ),
  awful.key(
    { modkey }, "c", function(c)
      c:kill()
      awful.client.focus.history.previous()
      if client.focus then
        client.focus:raise()
      end
    end,
    { description = "Close focused client", group = "Client" }
  ),
-- Move Around Current Client
  awful.key({ modkey, "Shift" }, "j", function ()
    awful.client.swap.byidx(1)
  end,
  {description = "swap with next client by index", group = "Client"}),
  awful.key({ modkey, "Shift" }, "k", function ()
    awful.client.swap.byidx(-1)
  end,
  {description = "swap with previous client by index", group = "Client"}),
-- Alt Tab
  awful.key({ "Mod1" }, "Tab", function()
    awful.client.focus.byidx(-1)
  end,
  { description = "Alt Tab", group = "Client" }),
-- Swap Windows
  awful.key({ modkey }, "k", function()
    awful.client.swap.byidx(-1)
  end,
  { description = "Swap with prev tab", group = "Client" })
)
