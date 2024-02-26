local awful = require("awful")
local watch = awful.widget.watch
local emit = awesome.emit_signal

-- watch for all 1 second timers
local second_timers = function()
  awful.spawn.easy_async_with_shell('sh ' .. Script_Dir .. 'get_non-idle_cpu.sh',
    function(stdout)
      emit("widget::cpu:update", stdout)
    end
  )
  awful.spawn.easy_async_with_shell('sh ' .. Script_Dir .. 'get_memory.sh g',
    function(stdout)
      emit("widget::memory:update", stdout)
    end
  )
  awful.spawn.easy_async_with_shell('sh ' .. Script_Dir .. 'get_temp.sh c',
    function(stdout)
      emit("widget::temperature:update", stdout)
    end
  )
  awful.spawn.easy_async_with_shell('sh ' .. Script_Dir .. 'get_battery.sh',
    function(stdout)
      emit("widget::battery:update", stdout)
    end
  )
  awful.spawn.easy_async_with_shell('sh ' .. Script_Dir .. 'get_gpu.sh',
    function(stdout)
      emit("widget::gpu:update", stdout)
    end
  )
end

local minute_timers = function()
  awful.spawn.easy_async_with_shell('sh ' .. Script_Dir .. 'network.sh',
    function(stdout)
      emit("widget::network:update", stdout)
    end
  )
end

local five_min_timers = function()
  awful.spawn.easy_async_with_shell('python ' .. Script_Dir .. 'weather.py',
    function(stdout)
      emit("widget::weather:update", stdout)
    end
  )
  awful.spawn.easy_async_with_shell('sh ' .. Script_Dir .. 'get_disk.sh',
    function(stdout)
      emit("widget::disk:update", stdout)
    end
  )
end

watch("autorandr -c > /dev/null 2>&1", 5)
watch('echo a > /dev/null', 2, second_timers)
watch('echo a > /dev/null', 60, minute_timers)
watch('echo a > /dev/null', 300, five_min_timers)
