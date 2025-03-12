#!/usr/local/bin/lua
----
--   Name:               intops.lua
--
--   Started:            Sat Feb  8 23:02:17 2025
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

local a = arg[1]
local b = arg[2]

local sum = a + b
local difference = a - b
local product = a * b
local quotient = a // b
-- local quotient = math.modf(a / b)
local remainder = math.fmod(a, b)
local power = a ^ b

print(a .. " + " .. b .. " = " .. sum)
print(a .. " - " .. b .. " = " .. difference)
print(a .. " * " .. b .. " = " .. product)
print(a .. " / " .. b .. " = " .. quotient)
print(a .. " % " .. b .. " = " .. remainder)
print(a .. " ^ " .. b .. " = " .. power)
