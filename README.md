# JaxonFreezeGUI
-- Freeze GUI by Jaxon_8883

local player = game.Players.LocalPlayer
local camera = workspace.CurrentCamera

-- Make GUI
local gui = Instance.new("ScreenGui", player:WaitForChild("PlayerGui"))
gui.Name = "FreezeGUI"

local frame = Instance.new("Frame", gui)
frame.Size = UDim2.new(0, 300, 0, 150)
frame.Position = UDim2.new(0.35, 0, 0.3, 0)
frame.BackgroundColor3 = Color3.fromRGB(25,25,25)

local uic = Instance.new("UICorner", frame)
uic.CornerRadius = UDim.new(0, 12)

local title = Instance.new("TextLabel", frame)
title.Size = UDim2.new(1,0,0,40)
title.BackgroundTransparency = 1
title.Font = Enum.Font.GothamBold
title.TextScaled = true
title.Text = "Made By Jaxon_8883"
title.TextColor3 = Color3.new(1,1,1)

local button = Instance.new("TextButton", frame)
button.Size = UDim2.new(0.8, 0, 0, 50)
button.Position = UDim2.new(0.1, 0, 0.45, 0)
button.Font = Enum.Font.GothamBold
button.TextScaled = true
button.Text = "Freeze Player"
button.TextColor3 = Color3.new(1,1,1)
button.BackgroundColor3 = Color3.fromRGB(70,70,70)

local uic2 = Instance.new("UICorner", button)
uic2.CornerRadius = UDim.new(0, 10)

-- Blur effect
local blur = Instance.new("BlurEffect", camera)
blur.Size = 0

local frozen = false

button.MouseButton1Click:Connect(function()
    if frozen == true then return end
    frozen = true

    -- Blur screen
    for i = 1,25 do
        blur.Size = i
        task.wait(0.02)
    end

    -- Freeze camera
    camera.CameraType = Enum.CameraType.Scriptable

    -- Freeze movement
    local char = player.Character or player.CharacterAdded:Wait()
    local hum = char:FindFirstChildOfClass("Humanoid")
    hum.WalkSpeed = 0
    hum.JumpPower = 0
end)
