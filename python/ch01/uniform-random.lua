#!/usr/local/bin/lua
----
--   Name:               uniform-random.lua
--
--   Started:            Wed Mar  5 13:49:44 2025
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

math.randomseed(os.time())
local n = 5

local xs = {}

for i = 1, n do
   xs[i] = math.random()
end

local average = 0
for i = 1, n do
   average = average + xs[i]
   print(string.format("%.16f", xs[i]))
end

print(string.format("Average = %.16f", average / n))
print(string.format("Min     = %.16f", math.min(table.unpack(xs))))
print(string.format("Max     = %.16f", math.max(table.unpack(xs))))
