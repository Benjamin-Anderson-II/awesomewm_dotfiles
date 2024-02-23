local awful = require("awful")
local gears = require("gears")
Theme_Dir = gears.filesystem.get_configuration_dir() .. "src/theme/"
Script_Dir = gears.filesystem.get_configuration_dir() .. "src/scripts/"

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
    regular   = "Mononoki Nerd Font, 12",
    bold      = "Mononoki Nerd Font, bold 12",
    extrabold = "Mononoki Nerd Font, ExtraBold 12",
    specify   = "Mononoki Nerd Font"
  },

  terminal = "kitty",

  modkey = "Mod4",

  wallpaper = Theme_Dir .. "minimal_arch.jpg",

  namestyle = "userhost",

  screenshot_program = "scrot '%Y-%m-%d_$wx$h.png -e 'optipng $f ; mv $f ~/Pictures/Screenshots/'",

  file_manager = "dolphin",

  icons = {
    discord = "󰙯",
    Spotify = "󰓇",
    firefox = "󰈹",
    kitty   = "󰆍",
    mpv     = "",
    dne     = "󰋗",
  },

  colors = {
    base   = "#1e1e2e",
    mantle = "181825",
    crust  = "#11111b",

    text     = "#cdd6f4",
    subtext0 = "#a6adc8",
    subtext1 = "#bac2de",

    surface0 = "#161925e6",
    surface1 = "#45475a",
    surface2 = "#585b70",
    surface3 = "#394161",

    overlay0 = "#6c7086",
    overlay1 = "#7f849c",
    overlay2 = "#9ba3c3",

    blue      = "#89b4fa",
    lavender  = "#b4befe",
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
}
