local Vector3 = require "Vector3"

---@class Entity
---@field Position Vector3
---@field Rotation Vector3
---@field Scale Vector3
---@field Character string
local Entity = {}
Entity.__index = Entity

---@param e Entity
---@return string
function Entity.__tostring(e)
    return string.format("Entity = {\n Position: %s,\n Rotation: %s,\n Scale: %s\n}", e.Position, e.Rotation, e.Scale)
end

---@param character string
---@return Entity
function Entity.new(character)
    local self = setmetatable({}, Entity)

    self.Position = Vector3.Zero
    self.Rotation = Vector3.Zero
    self.Scale = Vector3.One

    self.Character = character

    return self
end

return Entity