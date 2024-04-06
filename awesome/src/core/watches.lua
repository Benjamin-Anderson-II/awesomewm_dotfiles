local awful = require("awful")
local watch = awful.widget.watch


local _helper = function(script, sig_name)
  awful.spawn.easy_async_with_shell('sh ' .. Script_Dir .. script,
    function(stdout)
      awesome.emit_signal("widget::"..sig_name..":update", stdout)
    end
  )
end

-- watch for all 1 second timers
local second_timers = function()
  _helper('get_non-idle_cpu.sh', 'cpu')
  _helper('get_memory.sh g', 'memory')
  _helper('get_temp.sh c', 'temperature')
  _helper('get_battery.sh', 'battery')
  _helper('get_gpu.sh', 'gpu')
end

local minute_timers = function()
  _helper('network.sh', 'network')
  _helper('get_clock.sh', 'clock')
end

local five_min_timers = function()
  _helper('weather_wrapper.sh', 'weather')
  _helper('get_disk.sh', 'disk')
end

watch("autorandr -c > /dev/null 2>&1", 5)
watch('echo a > /dev/null', 2, second_timers)
watch('echo a > /dev/null', 60, minute_timers)
watch('echo a > /dev/null', 300, five_min_timers)
