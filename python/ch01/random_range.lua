#!/usr/local/bin/lua
----
--   Name:               random_range.lua
--
--   Started:            Mon Feb 10 23:52:06 2025
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

function random_range(a, b)
   if a > b then
      return random_range(b, a)
   else
      math.randomseed(os.time())
      return math.random(a, b)
   end
end

if #arg == 2 then
   local a = math.tointeger(arg[1])
   local b = math.tointeger(arg[2])

   if a == nil or b == nil then
      print("Corrupt")
   else
      print(string.format("Random [%d-%d]: %d", a, b, random_range(a, b)))
   end
end
