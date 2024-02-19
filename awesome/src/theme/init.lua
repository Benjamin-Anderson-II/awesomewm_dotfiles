local beautiful = require("beautiful")

theme = {}

dofile(Theme_Dir .. 'theme_variables.lua')

theme.wallpaper = user_vars.wallpaper

beautiful.init(theme)
