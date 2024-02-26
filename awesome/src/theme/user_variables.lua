local awful = require("awful")
local gears = require("gears")
Theme_Dir = gears.filesystem.get_configuration_dir() .. "src/theme/"
Script_Dir = gears.filesystem.get_configuration_dir() .. "src/scripts/"

local catppuccin_theme = {
  crust  = "#11111b",
  mantle = "#181825",
  base   = "#1e1e2e",

  surface0 = "#161925e6", -- not standard
  surface1 = "#45475a",
  surface2 = "#585b70",
  surface3 = "#394161", -- not standard

  overlay0 = "#6c7086",
  overlay1 = "#7f849c",
  overlay2 = "#9ba3c3",

  subtext0 = "#a6adc8",
  subtext1 = "#bac2de",
  text     = "#cdd6f4",

  lavender  = "#b4befe",
  blue      = "#89b4fa",
  sapphire  = "#74c7ec",
  sky       = "#89dceb",
  teal      = "#94e2d5",
  green     = "#a6e3a1",
  yellow    = "#f9e2af",
  peach     = "#fab387",
  maroon    = "#eba0ac",
  red       = "#f38ba8",
  mauve     = "#cba6f7",
  pink      = "#f5c3e7",
  flamingo  = "#f2cdcd",
  rosewater = "#f5e0dc",
}

local gruv_dark_theme = {
  crust  = "#1d2021",
  mantle = "#282828",
  base   = "#32302f",

  surface0 = "#3c3836e6", -- not standard
  surface1 = "#504945",
  surface2 = "#665c54",
  surface3 = "#7c6f64",

  overlay0 = "#928374",
  overlay1 = "#a89984",
  overlay2 = "#bdae93",

  subtext0 = "#d5c4a1",
  subtext1 = "#ebdbb2",
  text     = "#fbf1c7",

  lavender  = "#d3869b",
  blue      = "#458588",
  sapphire  = "#83a598",
  sky       = "#8ec07c",
  teal      = "#689d6a",
  green     = "#b8bb26",-- 142  green
  yellow    = "#d79921",-- 172 yellow
  peach     = "#d65d0e",-- 166 orange
  maroon    = "#fb4938",
  red       = "#cc241d",
  mauve     = "#b16286",
  pink      = "#98971a",-- 106 green
  flamingo  = "#fabd3f",-- 214 yellow
  rosewater = "#fe8019",-- 208 orange
}

user_vars = {
  layouts = {
    awful.layout.suit.spiral.dwindle,
    awful.layout.suit.floating,
    awful.layout.suit.tile,
    awful.layout.suit.tile.left,
    awful.layout.suit.tile.bottom,
    awful.layout.suit.tile.top,
    awful.layout.suit.fair,
    awful.layout.suit.fair.horizontal,
    awful.layout.suit.corner.nw,
    awful.layout.suit.corner.ne,
    awful.layout.suit.corner.sw,
    awful.layout.suit.corner.se,
    awful.layout.suit.magnifier,
    awful.layout.suit.max,
    awful.layout.suit.max.fullscreen,
  },

  distance = 10,
  margin = 7,

  font = {
    regular   = "Mononoki Nerd Font, 13",
    bold      = "Mononoki Nerd Font, bold 13",
    extrabold = "Mononoki Nerd Font, ExtraBold 13",
    specify   = "Mononoki Nerd Font"
  },

  terminal = "kitty",

  modkey = "Mod4",
--[[
  wallpapers = {
    Theme_Dir .. "minimal_arch,jpg",
    Theme_Dir .. "dungeon_meshi.png"
  },
]]--
  --wallpaper = Theme_Dir .. "minimal_arch.jpg",
  wallpaper = function(s)
    local wpdir = Theme_Dir .. "wallpapers/catppuccin/"
    --if s.index == 1 then
    --  return wpdir .. "minimal_arch.jpg"
    --end

    local os  = {clock = os.clock }
    local Gio = require("lgi").Gio
    math.randomseed(os.clock() % 1 * 1e6)

    local images_in_path = {}
    local valid_image_ext = {
      ["jpg"]  = 1,
      ["jpeg"] = 1,
      ["png"]  = 1,
      ["bmp"]  = 1
    }
    local enumerator = Gio.File.new_for_path(wpdir):enumerate_children("standard::name", 0)

    for file in function() return enumerator:next_file() end do
      local file_name = file:get_attribute_as_string("standard::name")
      if valid_image_ext[file_name:lower():match("%.(.*)$")] then
        table.insert(images_in_path, file_name)
      end
    end

    return wpdir .. images_in_path[math.random(#images_in_path)]
  end,

  namestyle = "userhost",

  file_manager = "dolphin",

  icons = {
    discord = "󰙯",
    Spotify = "󰓇",
    firefox = "󰈹",
    kitty   = "󰆍",
    mpv     = "",
    dne     = "󰋗",
  },

  colors = catppuccin_theme
}
