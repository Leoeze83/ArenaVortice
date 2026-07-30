-- HitStopManager.lua
-- Manages hit‑stop and screen‑shake per super ability

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")
local Players = game:GetService("Players")

local GameEvents = ReplicatedStorage:FindFirstChild("GameEvents") or Instance.new("Folder", ReplicatedStorage)
GameEvents.Name = "GameEvents"

local HitStopEvent = GameEvents:FindFirstChild("HitStopEvent")
if not HitStopEvent then
    HitStopEvent = Instance.new("RemoteEvent")
    HitStopEvent.Name = "HitStopEvent"
    HitStopEvent.Parent = GameEvents
end

-- Mapping of super ability name → shake intensity (0‑1)
local ShakeIntensity = {
    Grom = 1.0,          -- strong, long
    Yssa = 0.6,          -- medium, fast
    Kael = 0.3,          -- minimal, dry
    Pyra = 0.6,          -- medium, wavy
}

-- Called by server‑side combat script when a super hits a target
local function triggerHitStop(player, superName)
    local intensity = ShakeIntensity[superName] or 0.4
    -- Fire to the client that performed the hit (or to all in range)
    HitStopEvent:FireClient(player, intensity)
end

return {
    Trigger = triggerHitStop,
}
