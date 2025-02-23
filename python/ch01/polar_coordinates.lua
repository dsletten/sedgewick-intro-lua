#!/usr/local/bin/lua
----
--   Name:               polar_coordinates.lua
--
--   Started:            Fri Feb 21 21:44:05 2025
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
--   Notes: Ex. 1.2.23
--
----

function is_valid(n)
   return n ~= nil
end

function hypotenuse(x, y)
   return math.sqrt(x*x + y*y)
end

function cartesian_to_polar(x, y)
   return hypotenuse(x, y), math.atan(y, x)
end

if #arg == 2 then
   local x = tonumber(arg[1])
   local y = tonumber(arg[2])

   if is_valid(x) and is_valid(y) then
      local r, theta = cartesian_to_polar(x, y)
      print(string.format("(%f,%f) -> r: %f θ: %f", x, y, r, theta))
   else
      print("Corrupt")
   end
end
