#!/usr/local/bin/lua
----
--   Name:               color_conversion.lua
--
--   Started:            Wed Mar 12 02:03:08 2025
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
--   Notes: Ex. 1.2.29
--
----

function is_valid(n, p)
   return n ~= nil and p(n)
end

function convert(r, g, b)
   local r0 = r / 255
   local g0 = g / 255
   local b0 = b / 255
   local w = math.max(r0, g0, b0)

   return (w - r0) / w, (w - g0) / w, (w - b0) / w, 1.0 - w
end

if #arg == 3 then
   local r = tonumber(arg[1])
   local g = tonumber(arg[2])
   local b = tonumber(arg[3])

   if is_valid(r, function(x) return 0 <= x and x <= 255 end) then
      if is_valid(g, function(x) return 0 <= x and x <= 255 end) then
         if is_valid(b, function(x) return 0 <= x and x <= 255 end) then
            local c, m, y, k = convert(r, g, b)

            print(string.format("CMYK equivalent. Cyan: %.16f Magenta: %.16f Yellow: %.16f Black: %.16f", c, m, y, k))
         else
            print(string.format("Invalid blue level: %s", arg[3]))
         end
      else
         print(string.format("Invalid green level: %s", arg[2]))
      end
   else
      print(string.format("Invalid red level: %s", arg[1]))
   end
end      

