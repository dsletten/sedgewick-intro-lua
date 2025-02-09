#!/usr/local/bin/lua
----
--   Name:               floatops.lua
--
--   Started:            Sun Feb  9 11:31:48 2025
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

local a = tonumber(arg[1])
local b = tonumber(arg[2])

local sum = a + b
local difference = a - b
local product = a * b
local quotient = a / b
local remainder = math.fmod(a, b)
local power = a ^ b

print(string.format("%f + %f = %f", a, b, sum))
--print(a .. " + " .. b .. " = " .. sum)
print(a .. " - " .. b .. " = " .. difference)
print(a .. " * " .. b .. " = " .. product)
print(a .. " / " .. b .. " = " .. quotient)
print(a .. " % " .. b .. " = " .. remainder)
print(a .. " ^ " .. b .. " = " .. power)
