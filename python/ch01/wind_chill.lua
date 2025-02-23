#!/usr/local/bin/lua
----
--   Name:               wind_chill.lua
--
--   Started:            Tue Feb 18 23:09:45 2025
--   Modifications:
--
--   Purpose:
--
--
--
--   Calling Sequence:
--
--
--   Inputs:
--
--   Outputs:
--
--   Example:
--
--   Notes:
--
----

function is_valid(n, p)
   return n ~= nil and p(n)
end

function wind_chill(t, v)
   return 35.74 + 0.6215 * t + (0.4275 * t - 35.75) * (v ^ 0.16)
end

if #arg == 2 then
   local t = tonumber(arg[1])
   local v = tonumber(arg[2])

   if is_valid(t, function(t) return math.abs(t) <= 50 end) and
      is_valid(v, function(v) return 3 <= v and v <= 120 end) then
      print(string.format("Wind chill: %.2f", wind_chill(t, v)))
   else
      print("Corrupt")
   end
end
