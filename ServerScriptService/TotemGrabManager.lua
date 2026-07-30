-- TotemGrabManager.lua
-- Manages totem pickup requirement for players before starting a match

local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local GameEvents = ReplicatedStorage:FindFirstChild("GameEvents") or Instance.new("Folder", ReplicatedStorage)
GameEvents.Name = "GameEvents"

-- RemoteEvent to notify client when totem is required or acquired
local RequireTotemPickup = GameEvents:FindFirstChild("RequireTotemPickup")
if not RequireTotemPickup then
    RequireTotemPickup = Instance.new("RemoteEvent")
    RequireTotemPickup.Name = "RequireTotemPickup"
    RequireTotemPickup.Parent = GameEvents
end

local playerHasTotem = {}

local function onPlayerAdded(player)
    playerHasTotem[player] = false
    -- Ensure client knows they need a totem at start
    RequireTotemPickup:FireClient(player, true)
end

local function onPlayerRemoving(player)
    playerHasTotem[player] = nil
end

local function onTotemTouched(totem, otherPart)
    local character = otherPart.Parent
    if not character then return end
    local player = Players:GetPlayerFromCharacter(character)
    if player and not playerHasTotem[player] then
        playerHasTotem[player] = true
        -- Hide the prompt for this player
        RequireTotemPickup:FireClient(player, false)
    end
end

-- Connect to all existing totems in the workspace
local function connectTotems()
    for _, obj in ipairs(workspace:GetDescendants()) do
        if obj:IsA("BasePart") and obj.Name == "Totem" then
            obj.Touched:Connect(function(hit) onTotemTouched(obj, hit) end)
        end
    end
end

connectTotems()

Players.PlayerAdded:Connect(onPlayerAdded)
Players.PlayerRemoving:Connect(onPlayerRemoving)

local function allPlayersHaveTotem()
    for player, has in pairs(playerHasTotem) do
        if not has then
            return false
        end
    end
    return true
end

return {
    AllPlayersHaveTotem = allPlayersHaveTotem,
    SetPlayerTotem = function(player) playerHasTotem[player] = true end,
}
