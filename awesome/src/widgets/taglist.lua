local awful = require("awful")
local wibox = require("wibox")
local gears = require("gears")
local dpi = require("beautiful").xresources.apply_dpi

local icons = {
  discord = "󰙯",
  Spotify = "󰓇",
  firefox = "󰈹",
  kitty   = "󰆍",
  Arandr  = "󰋗"
}

local function client_names(tag)
  local ret = ""
  if #tag:clients() > 0 then
    ret = " "
    for i = 1, #tag:clients(), 1 do
      local client = tag:clients()[i]
      if client.class then
        for k,v in pairs(icons) do
          if client.class == k then
            ret = ret .. v .. " "
          end
        end
      end
    end
  end
  return ret
end

local create_widget = function(widget, tag)
  -- set text to be clients in tag
  local tag_text = " " .. tag.index .. client_names(tag) .. " "
  widget:get_children_by_id("txt")[1].text = tag_text
  if tag.selected then
    widget:get_children_by_id("background_role")[1].fg = "#45475a"
  else
    widget:get_children_by_id("background_role")[1].fg = "#94e2d5"
  end
end

return function(s)
  local taglist_widget = awful.widget.taglist{
    screen  = s,
    filter  = awful.widget.taglist.filter.noempty,
    widget_template = {
      {
        {
          {
            id = "txt",
            visible = true,
            align  = "center",
            valign = "center",
            widget = wibox.widget.textbox
          },
          layout = wibox.layout.fixed.horizontal
        },
        margins = dpi(0),
        widget = wibox.container.margin
      },
      id = "background_role",
      widget = wibox.container.background,
      create_callback = function(self, t, index, tags) --self is the widget instance
        create_widget(self, t)
      end,
      update_callback = function(self, t, index, tags)
        create_widget(self, t)
      end
    },
    buttons = gears.table.join(
      awful.button({}, 1, function(t) t:view_only() end),
      awful.button({ modkey }, 1, function(t)
                                    if client.focus then
                                      client.focus:move_to_tag(t)
                                    end
                                  end),
      awful.button({}, 3, awful.tag.viewtoggle),
      awful.button({ modkey }, 3, function(t)
                                    if client.focus then
                                      client.focus:toggle_tag(t)
                                    end
                                  end),
      awful.button({}, 4, function(t) awful.tag.viewnext(t.screen) end),
      awful.button({}, 5, function(t) awful.tag.viewprev(t.screen) end)
    )
  }

  return wibox.widget {
    taglist_widget,
    bg = "#161925e6",
    shape = function(cr, width, height)
      gears.shape.rounded_rect(cr, width, height, 13)
    end,
    widget = wibox.container.background
  }
end
