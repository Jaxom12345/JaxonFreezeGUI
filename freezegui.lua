--[[
    Premium Freeze GUI
    Made By Jaxon_8883
]]--

local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local player = Players.LocalPlayer
local camera = workspace.CurrentCamera

-- Create GUI
local gui = Instance.new("ScreenGui", player:WaitForChild("PlayerGui"))
gui.Name = "PremiumFreezeUI"
gui.ResetOnSpawn = false

-- Main frame
local frame = Instance.new("Frame", gui)
frame.Size = UDim2.new(0, 380, 0, 200)
frame.Position = UDim2.new(0.5, -190, 0.5, -100)
frame.BackgroundColor3 = Color3.fromRGB(20,20,20)
frame.BackgroundTransparency = 0.15
frame.Visible = false

local frameCorner = Instance.new("UICorner", frame)
frameCorner.CornerRadius = UDim.new(0, 16)

-- Glow effect
local glow = Instance.new("ImageLabel", frame)
glow.Size = UDim2.new(1, 40, 1, 40)
glow.Position = UDim2.new(-0.2, 0, -0.2, 0)
glow.BackgroundTransparency = 1
glow.Image = "rbxassetid://4996891970"
glow.ImageColor3 = Color3.fromRGB(0, 150, 255)
glow.ImageTransparency = 0.75

-- Title
local title = Instance.new("TextLabel", frame)
title.Size = UDim2.new(1, 0, 0, 50)
title.BackgroundTransparency = 1
title.Font = Enum.Font.GothamBlack
title.TextScaled = true
title.TextColor3 = Color3.fromRGB(255,255,255)
title.Text = "Made By Jaxon_8883"

-- Button
local button = Instance.new("TextButton", frame)
button.Size = UDim2.new(0.8, 0, 0, 60)
button.Position = UDim2.new(0.1, 0, 0.55, 0)
button.BackgroundColor3 = Color3.fromRGB(40,40,40)
button.TextColor3 = Color3.fromRGB(255,255,255)
button.Font = Enum.Font.GothamBold
button.TextScaled = true
button.Text = "Freeze Player"

local btnCorner = Instance.new("UICorner", button)
btnCorner.CornerRadius = UDim.new(0, 10)

-- Sound
local clickSound = Instance.new("Sound", frame)
clickSound.SoundId = "rbxassetid://6541046592"
clickSound.Volume = 1

-- Blur effect
local blur = Instance.new("BlurEffect")
blur.Parent = camera
blur.Size = 0

local frozen = false
local uiOpen = false

-- Tween function
local function Tween(obj, time, props)
    TweenService:Create(obj, TweenInfo.new(time, Enum.EasingStyle.Quad), props):Play()
end

-- Toggle GUI with RightShift
game:GetService("UserInputService").InputBegan:Connect(function(key)
    if key.KeyCode == Enum.KeyCode.RightShift then
        uiOpen = not uiOpen
        frame.Visible = uiOpen
        if uiOpen then
            Tween(frame, 0.25, {BackgroundTransparency = 0.15})
        else
            Tween(frame, 0.25, {BackgroundTransparency = 1})
            task.wait(0.25)
            frame.Visible = false
        end
    end
end)

-- Freeze Effect
button.MouseButton1Click:Connect(function()
    if frozen then return end
    frozen = true
    clickSound:Play()

    -- Blur animation
    for i = 1, 25 do
        blur.Size = i
        task.wait(0.02)
    end

    -- Freeze movement
    local char = player.Character or player.CharacterAdded:Wait()
    local hum = char:FindFirstChildWhichIsA("Humanoid")
    hum.WalkSpeed = 0
    hum.JumpPower = 0

    -- Lock camera
    camera.CameraType = Enum.CameraType.Scriptable

    -- Freeze GUI in place
    Tween(frame, 0.3, {Position = UDim2.new(0.5, -190, 0.5, -100)})
end)
