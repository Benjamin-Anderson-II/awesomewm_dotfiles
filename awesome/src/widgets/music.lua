local gears = require("gears")
local dpi = require("beautiful").xresources.apply_dpi
local wibox = require("wibox")
local lgi = require('lgi')
local player = lgi.Playerctl.Player{}

local music_art = wibox.widget({
  widget = wibox.widget.imagebox,
  resize = true,
  image  = '/home/Ben/Pictures/Boat.jpg',
})

local music_art_container = wibox.widget({
  music_art,
  forced_height = dpi(60),
  forced_width = dpi(60),
  widget = wibox.container.background,
  shape = function(cr, width, height)
    gears.shape.rounded_rect(cr, width, height, 13)
  end,
})

local music_title = wibox.widget({
  font = user_vars.font.specify .. "Regular 13",
  valign = "center",
  widget = wibox.widget.textbox
})

local music_artist = wibox.widget({
  font = user_vars.font.specify .. "Bold 16",
  valign = "center",
  widget = wibox.widget.textbox
})

local function music()
  local mus = wibox.widget({
    {
      {
        music_art_container,
        {
          {
            music_title,
            id = "title_scroll",
            widget = wibox.container.scroll.horizontal,
          },
          {
            music_artist,
            id = "artist_scroll",
            widget = wibox.container.scroll.horizontal,
          },
          forced_width = dpi(160),
          layout = wibox.layout.fixed.vertical,
        },
        spacing = user_vars.margin,
        layout = wibox.layout.fixed.horizontal,
      },
      widget = wibox.container.margin,
      margins = user_vars.margin,
    },
    forced_width = dpi(260),
    shape = function(cr, width, height)
      gears.shape.rounded_rect(cr, width, height, 13)
    end,
    bg = user_vars.colors.crust,
    widget = wibox.container.background,
  })

  local title = mus:get_children_by_id('title_scroll')[1]
  title:set_fps(60)
  title:set_speed(70)
  title:set_step_function(wibox.container.scroll.step_functions.waiting_nonlinear_back_and_forth)
  local artist = mus:get_children_by_id('artist_scroll')[1]
  artist:set_fps(60)
  artist:set_speed(70)
  artist:set_step_function(wibox.container.scroll.step_functions.waiting_nonlinear_back_and_forth)
end

local music_widget = wibox.widget({
  {
    {
      music(),
      layout = wibox.layout.align.horizontal,
    },
    forced_height = dpi(200),
    bg = user_vars.colors.overlay2,
    shape = function(cr, width, height)
      gears.shape.rounded_rect(cr, width, height, 13)
    end,
    widget = wibox.container.background,
  },
  margins = user_vars.margin,
  color = "#00000000",
  widget = wibox.container.margin,
})

local metadata_cb = function(_, metadata)
  local data = metadata.value
  local title  = data["xesam:title"] or ""
  local artist = data["xesam:artist"][1] or ""
  for i = 2, #data["xesam:artist"] do
    artist = artist .. ", " .. data["xesam:artist"][i]
  end
  local artUrl = data["mpris:artUrl"] or ""

  if artUrl == "" then
    artUrl = "https://picsum.photos/200"
  end
  if title == "" then
    title = "Nothing Playing"
  end
  if artist == "" then
    artist = "Nothing Playing"
  end
  local art_path = os.tmpname()
  os.execute("curl " .. artUrl .. " -s -o " .. art_path)
  music_art:set_image(gears.surface.load_uncached(art_path))
  music_title:set_text(title)
  music_artist:set_text(artist)
end

player.on_metadata = metadata_cb
local mainloop = lgi.GLib.MainLoop.new()
mainloop:run()

return music_widget
