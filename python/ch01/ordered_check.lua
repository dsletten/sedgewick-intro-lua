#!/usr/local/bin/lua
----
--   Name:               ordered_check.lua
--
--   Started:            Wed Feb 26 19:26:31 2025
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
--   Notes: Pretending not to know how `if' works yet...
--   Ex. 1.2.25
--
----

function is_valid(n)
   return n ~= nil
end

function is_ascending(x, y, z)
   return x < y and y < z
end

if #arg == 3 then
   local x = tonumber(arg[1])
   local y = tonumber(arg[2])
   local z = tonumber(arg[3])

   if is_valid(x) and is_valid(y) and is_valid(z) then
      local ordered = {}
      ordered[true] = "True"
      ordered[false] = "False"

      print(ordered[is_ascending(x, y, z) or is_ascending(z, y, x)])
   else
      print("Corrupt")
   end
end
