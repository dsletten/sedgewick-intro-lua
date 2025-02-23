#!/usr/local/bin/lua
----
--   Name:               compound_interest.lua
--
--   Started:            Sun Feb 16 22:06:18 2025
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
--   Rate r must be scaled by 100.
--
--   Outputs:
--
--   Example:
--
--   Notes: Ex. 1.2.21
--
----

function convert(s)
   local m = tonumber(s)

   if m == nil or m <= 0 then
      return nil
   else
      return m
   end
end

function compound(p, r, t)
   return p * math.exp(r * t)
end
   
if #arg == 3 then
   local p = convert(arg[1])
   local r = convert(arg[2])
   local t = convert(arg[3])

   if p == nil or r == nil or t == nil then
      print("Corrupt")
   else
      print(string.format("Amount: %.2f", compound(p, r/100, t)))
   end
end
