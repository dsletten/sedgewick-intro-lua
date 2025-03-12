#!/usr/local/bin/lua
----
--   Name:               mercator-projection.lua
--
--   Started:            Fri Mar  7 15:23:08 2025
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
--   Notes: Ex. 1.2.28
--
----

function is_valid(n, p)
   return n ~= nil and p(n)
end

local r = 6378137.0 -- Earth equatorial mean radius (m) https://en.wikipedia.org/wiki/World_Geodetic_System

function mercator_projection_degrees(long0, long, lat)
   return mercator_projection(math.rad(long0), math.rad(long), math.rad(lat))
end

function mercator_projection(long0, long, lat)
   return r * (long - long0), r * 0.5 * math.log((1 + math.sin(lat)) / (1 - math.sin(lat)))
end

if #arg == 3 then
   local long0 = tonumber(arg[1])
   local lat = tonumber(arg[2])
   local long = tonumber(arg[3])

   if is_valid(long0, function(long0) return -180 <= long0 and long0 <= 180 end) then
      if is_valid(lat, function(lat) return -90 < lat and lat < 90 end) then
         if is_valid(long, function(long) return -180 <= long and long <= 180 end) then
            local x, y = mercator_projection_degrees(long0, long, lat)

            print(string.format("Latitude: %f° Longitude: %f° -> (%.16f m, %.16f m)", lat, long, x, y))
         else
            print(string.format("Invalid longitude: %s", arg[3]))
         end
      else
         print(string.format("Invalid latitude: %s", arg[2]))
      end
   else
      print(string.format("Invalid center: %s", arg[1]))
   end
end      

