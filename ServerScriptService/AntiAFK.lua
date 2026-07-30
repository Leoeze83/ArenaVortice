--[[
AntiAFK.lua
Detects player inactivity and warns/expels AFK players.
]]

local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")

local AFK_TIMEOUT = 30 -- seconds of inactivity before warning
local EXPULSION_COUNTDOWN = 10 -- seconds after warning before kick

local AFKWarningEvent = Instance.new("RemoteEvent")
AFKWarningEvent.Name = "AFKWarning"
AFKWarningEvent.Parent = ReplicatedStorage:FindFirstChild("GameEvents") or ReplicatedStorage

local PlayerAFKEvent = Instance.new("RemoteEvent")
PlayerAFKEvent.Name = "PlayerAFK"
PlayerAFKEvent.Parent = ReplicatedStorage:FindFirstChild("GameEvents") or ReplicatedStorage

local playerLastInput = {}

local function onPlayerAdded(player)
    playerLastInput[player] = tick()
    -- reset on any input
    local function onInput()
        playerLastInput[player] = tick()
    end
    UserInputService.InputBegan:Connect(onInput)
    UserInputService.InputEnded:Connect(onInput)
end

local function checkAFK()
    for player, lastTime in pairs(playerLastInput) do
        if player.Parent then -- player still in game
            local elapsed = tick() - lastTime
            if elapsed >= AFK_TIMEOUT then
                -- start warning if not already warned
                if not player:GetAttribute("AFKWarned") then
                    player:SetAttribute("AFKWarned", true)
                    AFKWarningEvent:FireClient(player, EXPULSION_COUNTDOWN)
                    -- start countdown
                    delay(EXPULSION_COUNTDOWN, function()
                        if player.Parent then
                            PlayerAFKEvent:FireServer(player)
                        end
                    end)
                end
            end
        end
    end
end

Players.PlayerAdded:Connect(onPlayerAdded)
RunService.Heartbeat:Connect(checkAFK)
