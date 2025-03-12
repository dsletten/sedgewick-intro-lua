#!/usr/local/bin/lua
----
--   Name:               day_of_week.lua
--
--   Started:            Thu Feb 27 22:08:12 2025
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

function is_leap_year(y)
   if y % 400 == 0 then
      return true
   elseif y % 100 == 0 then
      return false
   else
      return y % 4 == 0
   end
end

function month_length(m, y)
   if m == 4 or m == 6 or m == 9 or m == 11 then
      return 30
   elseif m == 2 then
      if is_leap_year(y) then
         return 29
      else
         return 28
      end
   else
      return 31
   end
end

function is_valid_day(d, m, y)
   return 1 <= d and d <= month_length(m, y)
end

local days = {"Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday", "Sunday"}

function get_day_of_week_name(d)
   return days[(d + 6) % 7 + 1]
end

function day_of_week(d, m, y)
   local y0 = y - math.floor((14 - m) / 12)
   local x = y0 + math.floor(y0 / 4) - math.floor(y0 / 100) + math.floor(y0 / 400)
   local m0 = m + 12 * math.floor((14 - m) / 12) - 2

   return (d + x + math.floor(31 * m0 / 12)) % 7
end

if #arg == 3 then
   local m = math.tointeger(arg[1])
   local d = math.tointeger(arg[2])
   local y = math.tointeger(arg[3])

   if is_valid(m, function(m) return 1 <= m and m <= 12 end) then
      if is_valid(y, function(y) return y >= 1582 end) then
         if is_valid(d, function(d) return is_valid_day(d, m, y) end) then
            local dow = day_of_week(d, m, y)

            print(string.format("%d (%s)", dow, get_day_of_week_name(dow)))
         else
            print(string.format("Invalid day of month: %s", arg[2]))
         end
      else
         print(string.format("Invalid year: %s", arg[3]))
      end
   else
      print(string.format("Invalid month: %s", arg[1]))
   end
end      
