#!/usr/local/bin/lua
----
--   Name:               gaussian_random.lua
--
--   Started:            Sun Feb 23 19:28:24 2025
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

-- D'oh!
-- gaussian_random.lua; gaussian_random.lua; gaussian_random.lua
-- Uniform (0.558478,0.182150) -> Gaussian (0.446347,0.982778)
-- Uniform (0.558478,0.182150) -> Gaussian (0.446347,0.982778)
-- Uniform (0.558478,0.182150) -> Gaussian (0.446347,0.982778)

-- function box_muller(u, v)
--    -- u == 0???
--    return math.cos(2 * math.pi * v) * math.sqrt(-2 * math.log(u)),
--       math.sin(2 * math.pi * v) * math.sqrt(-2 * math.log(u))
-- end

function box_muller(u, v)
   -- u == 0???
   local r = math.sqrt(-2 * math.log(u))
   local theta = 2 * math.pi * v

   return r * math.cos(theta), r * math.sin(theta)
end

math.randomseed(os.time())
local u = math.random()
local v = math.random()
local z0, z1 = box_muller(u, v)

print(string.format("Uniform (%f,%f) -> Gaussian (%f,%f)", u, v, z0, z1))
