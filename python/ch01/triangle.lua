#!/usr/local/bin/lua
----
--   Name:               triangle.lua
--
--   Started:            Mon Feb 10 20:52:23 2025
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
--   Notes: Ex. 1.2.12
--
----

--
--    https://en.wikipedia.org/wiki/Triangle_inequality
--
--    Explicitly: a + b > c  &  b + c > a  &  a + c > b
--    Equivalently: |a - b| < c < a + b
--    or
--    max(a, b, c) < a + b + c - max(a, b, c) => 2 max(a, b, c) < a + b + c
--    or
--    Area of triangle > 0.
--    

function isTriangleSedgewick(a, b, c)
   return not (a >= b + c or b >= a + c or c >= a + b)
end

function isTriangle(a, b, c)
   return a < b + c and b < a + c and c < a + b
end

function isTriangleAbs(a, b, c)
   return math.abs(a - b) < c and c < a + b
end

function isTriangleMax(a, b, c)
   return 2 * math.max(a, b, c) < a + b + c
end

function goldbergHeron(a, b, c)
    --
    --    Assumes a ≥ b ≥ c
    --
   local function heron(a, b, c)
   -- local function heron(...)
   --    local a, b, c = table.unpack({...})
      local product = (a + (b + c)) * (c - (a - b)) * (c + (a - b)) * (a + (b - c))

      if product < 0 then
         return 0
      else
         return math.sqrt(product) / 4
      end
   end

   local sides = {a, b, c}
   table.sort(sides, function(a, b) return a > b end)
   return heron(table.unpack(sides))
end

function isTriangleArea(a, b, c)
   return goldbergHeron(a, b, c) > 0
end

if #arg == 3 then
   local a = tonumber(arg[1])
   local b = tonumber(arg[2])
   local c = tonumber(arg[3])

   if a == nil or b == nil or c == nil then
      print("Corrupt")
   else
      print(isTriangleSedgewick(a, b, c) and "true" or "false")
      print(isTriangle(a, b, c) and "true" or "false")
      print(isTriangleAbs(a, b, c) and "true" or "false")
      print(isTriangleMax(a, b, c) and "true" or "false")
      print(isTriangleArea(a, b, c) and "true" or "false")
   end
end
