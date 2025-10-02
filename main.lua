local Vector3 = require "Vector3"

local f = Vector3.new(1, 0, 0)
local a = Vector3.new(1, 2, 3)
local b = Vector3.new(4, 5, 6)

---@type Vector3
local c = a + b

---@type Vector3
local d = a - b

---@type Vector3
local e = f:Unit()

local g = f:Magnitude()

local h = Vector3.Dot(a, b)

print(c)
print(d)
print(e)
print(h)