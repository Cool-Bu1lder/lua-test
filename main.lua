print("Hello World")

local t = {}
t.__index = t

function t.new()
    local self = setmetatable({}, t)

    return self
end

function t:Write(msg)
    print(msg)
end

local e = t.new()
e:Write("Hi from Object")