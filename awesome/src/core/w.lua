local awful = require("awful")
local watch = awful.widget.watch
local emit = awesome.emit_signal

local timers = function(args)
  for _, arg in ipairs(args) do
    local scr = 'sh ' .. Script_Dir .. arg[2]
    local sig = 'widget::'..arg[1]..":update"
    print(scr, sig)
    awful.spawn.easy_async_with_shell(scr,
      function(stdout)
        emit(sig, stdout)
      end
    )
  end
end

watch("autorandr -c > /dev/null 2>&1", 5)

-- quick timers
watch(':',
  2,
  timers({
    {"cpu",         "get_non-idle_cpu.sh"},
    {"memory",      "get_memory.sh g"},
    {"temperature", "get_temp.sh c"},
    {"battery",     "get_battery.sh"},
    {"gpu",         "get_gpu.sh"},
    {"clock",       "get_clock.sh"},
  })
)

-- minute timers
watch(':',
  60,
  timers({
    {"network", "network.sh"}
  })
)

-- five minute timers
watch(':',
  300,
  timers({
    {"disk",     "get_disk.sh"},
    {"weather",  "weather_wrapper.sh"},
  })
)
