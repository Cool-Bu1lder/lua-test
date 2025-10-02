---@class Vector3
---@field X number
---@field Y number
---@field Z number
local Vector3 = {}
Vector3.__index = Vector3

---@param a Vector3
---@param b Vector3
---@return Vector3
function Vector3.__add(a, b)
    return Vector3.new(a.X + b.X, a.Y + b.Y, a.Z + b.Z)
end

---@param a Vector3
---@param b Vector3
---@return Vector3
function Vector3.__sub(a, b)
    return Vector3.new(a.X - b.X, a.Y - b.Y, a.Z - b.Z)
end

---@param a Vector3 | number
---@param b Vector3 | number
---@return Vector3
function Vector3.__mul(a, b)
    if type(a) == "number" then
        return Vector3.new(a * b.X, a * b.Y, a * b.Z)
    elseif type(b) == "number" then
        return Vector3.new(a.X * b, a.Y * b, a.Z * b)
    else
        return Vector3.new(a.X * b.X, a.Y * b.Y, a.Z * b.Z)
    end
end

---@param a Vector3 | number
---@param b Vector3 | number
---@return Vector3
function Vector3.__div(a, b)
    if type(a) == "number" then
        return Vector3.new(a / b.X, a / b.Y, a / b.Z)
    elseif type(b) == "number" then
        return Vector3.new(a.X / b, a.Y / b, a.Z / b)
    else
        return Vector3.new(a.X / b.X, a.Y / b.Y, a.Z / b.Z)
    end
end

---@param v Vector3
---@return Vector3
function Vector3.__unm(v)
    return Vector3.new(-v.X, -v.Y, -v.Z)
end

---@param a Vector3 | number
---@param b Vector3 | number
---@return Vector3
function Vector3.__nmod(a, b)
    if type(a) == "number" then
        return Vector3.new(a % b.X, a % b.Y, a % b.Z)
    elseif type(b) == "number" then
        return Vector3.new(a.X % b, a.Y % b, a.Z % b)
    else
        return Vector3.new(a.X % b.X, a.Y % b.Y, a.Z % b.Z)
    end
end

---@param a Vector3 | number
---@param b Vector3 | number
---@return Vector3
function Vector3.__pow(a, b)
    if type(a) == "number" then
        return Vector3.new(a ^ b.X, a ^ b.Y, a ^ b.Z)
    elseif type(b) == "number" then
        return Vector3.new(a.X ^ b, a.Y ^ b, a.Z ^ b)
    else
        return Vector3.new(a.X ^ b.X, a.Y ^ b.Y, a.Z ^ b.Z)
    end
end

---@param v Vector3
---@return string
function Vector3.__tostring(v)
    return string.format("[%.3f, %.3f, %.3f]", v.X, v.Y, v.Z)
end

---@param x number
---@param y number
---@param z number
---@return Vector3
function Vector3.new(x, y, z)
    local self = setmetatable({}, Vector3)

    self.X = x
    self.Y = y
    self.Z = z

    return self
end

Vector3.Zero = Vector3.new(0, 0, 0)
Vector3.One = Vector3.new(1, 1, 1)

---@return number
function Vector3.Magnitude(self)
    return math.sqrt(self.X^2 + self.Y^2 + self.Z^2)
end

---@return Vector3
function Vector3.Unit(self)
    local mag = self:Magnitude()
    return mag == 0 and Vector3.Zero or self/mag
end

---@param a Vector3
---@param b Vector3
---@return number
function Vector3.Dot(a, b)
    return a.X * b.X + a.Y * b.Y + a.Z * b.Z
end

return Vector3