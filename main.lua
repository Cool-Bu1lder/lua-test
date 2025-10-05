local Vector3 = require "Vector3"
local Entity = require "Entity"

---@type Entity
local player = Entity.new("C")
player.Position = Vector3.new(1,1,0)

local Entities = {}
table.insert(Entities, player)

while true do
    os.execute("clear")

    local board = ""
    for y=1, 10 do
        board = board .. "\n"
        for x=1, 10 do
            local character = "-"
            local position = Vector3.new(x, y, 0)
            for _, entitiy in ipairs(Entities) do
                if entitiy.Position == position then
                    character = entitiy.Character
                end
            end
            board = board .. string.format("[%s]", character)
        end
    end
    print(board)

    local char = io.read(1)
    if char == "x" then
        os.exit()
    elseif char == "w" then
        player.Position = player.Position + Vector3.new(0,-1,0)
    elseif char == "a" then
        player.Position = player.Position + Vector3.new(-1,0,0)
    elseif char == "s" then
        player.Position = player.Position + Vector3.new(0,1,0)
    elseif char == "d" then
        player.Position = player.Position + Vector3.new(1,0,0)
    end
end