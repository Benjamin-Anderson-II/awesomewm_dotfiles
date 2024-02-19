local awful = require("awful")
local gears = require("gears")
local globalkeys = require("mappings.global_keys")

local modkey = user_vars.modkey

for i = 1, 9 do
  globalkeys = gears.table.join(globalkeys,
    awful.key({ modkey }, "#" .. i + 9,
    function()
      local screen = awful.screen.focused()
      local tag = screen.tags[i]
      if tag then
        tag:view_only()
      end
      client.emit_signal("tag::switched")
      awful.client.focus.byidx(-1)
    end,
    { description = "View Tag " .. i, group = "Tag" }),

    awful.key({ modkey, "Control" }, "#" .. i + 9,
    function()
      local screen = awful.screen.focused()
      local tag = screen.tags[i]
      if tag then
        tag:viewtoggle()
      end
    end,
    { description = "Toggle Tag " .. i, group = "Tag" }),

    awful.key({ modkey, "Shift" }, "#" .. i + 9,
    function()
      local screen = awful.screen.focused()
      if client.focus then
        local tag = screen.tags[i]
        if tag then
          client.focus:move_to_tag(tag)
        end
      end
    end,
    { description = "Move focused client on tag " .. i, group = "Tag" }),

    awful.key({ modkey, "Control", "Shift" }, "#" .. i + 9,
    function()
      local screen = awful.screen.focused()
      local tag = screen.tags[i]
      if tag then
        awful.tag.viewtoggle(tag)
      end
    end,
    { description = "Toggle focused client on tag " .. i, group = "Tag" })
  )
end
root.keys(globalkeys)
