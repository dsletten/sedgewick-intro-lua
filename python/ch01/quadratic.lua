#!/usr/local/bin/lua
----
--   Name:               quadratic.lua
--
--   Started:            Sun Feb  9 14:00:02 2025
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

function goldberg_complex_quadratic(a, b, c)
   local discriminant = b ^ 2 - 4 * a * c
   local d = math.sqrt(discriminant)

   if b >= 0 then
      return (2 * c) / (-b - d), (-b - d) / (2 * a)
   else
      return (-b + d) / (2 * a), (2 * c) / (-b + d)
   end
end

if #arg == 3 then
   local a = tonumber(arg[1])
   local b = tonumber(arg[2])
   local c = tonumber(arg[3])

   if a == nil or b == nil or c == nil then
      print("Suck it!")
   else
      local r1, r2 = goldberg_complex_quadratic(a, b, c)

      print(string.format("Root 1: %f", r1))
      print(string.format("Root 2: %f", r2))
   end
end
