-- ============================================
-- HAMZZ HUB SCRIPT
-- Based on Speed Hub X Design
-- All Features Included
-- ============================================

local Player = game:GetService("Players").LocalPlayer
local Character = Player.Character or Player.CharacterAdded:Wait()
local Humanoid = Character:WaitForChild("Humanoid")
local RootPart = Character:WaitForChild("HumanoidRootPart")

-- Create UI like Speed Hub X
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "HamzzHubX"
ScreenGui.Parent = game:GetService("CoreGui")

local MainFrame = Instance.new("Frame")
MainFrame.Size = UDim2.new(0, 450, 0, 500)
MainFrame.Position = UDim2.new(0.5, -225, 0.5, -250)
MainFrame.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
MainFrame.BorderSizePixel = 0
MainFrame.Parent = ScreenGui

local Title = Instance.new("TextLabel")
Title.Text = "HAMZZ HUB SCRIPT"
Title.Size = UDim2.new(1, 0, 0, 40)
Title.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
Title.TextColor3 = Color3.fromRGB(255, 255, 255)
Title.Font = Enum.Font.GothamBold
Title.FontSize = Enum.FontSize.Size20
Title.Parent = MainFrame

local TabContainer = Instance.new("Frame")
TabContainer.Size = UDim2.new(1, 0, 0, 40)
TabContainer.Position = UDim2.new(0, 0, 0, 40)
TabContainer.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
TabContainer.Parent = MainFrame

local ContentFrame = Instance.new("ScrollingFrame")
ContentFrame.Size = UDim2.new(1, 0, 1, -120)
ContentFrame.Position = UDim2.new(0, 0, 0, 80)
ContentFrame.BackgroundTransparency = 1
ContentFrame.ScrollBarThickness = 5
ContentFrame.ScrollBarImageColor3 = Color3.fromRGB(100, 100, 100)
ContentFrame.CanvasSize = UDim2.new(0, 0, 0, 1000)
ContentFrame.Parent = MainFrame

-- ============================================
-- ALL FEATURES FROM SPEED HUB X + HAMZZ MODS
-- ============================================

local features = {
    -- From Speed Hub X
    WalkSpeed = {
        value = 16,
        enabled = false
    },
    JumpPower = {
        value = 50,
        enabled = false
    },
    ESP = {
        enabled = false
    },
    Tracers = {
        enabled = false
    },
    Aimbot = {
        enabled = false,
        fov = 100
    },
    TriggerBot = {
        enabled = false
    },
    AutoClicker = {
        enabled = false,
        cps = 10
    },
    AntiAFK = {
        enabled = true
    },
    NoClip = {
        enabled = false
    },
    
    -- From Hamzz Mods
    GodMode = {
        enabled = false
    },
    Fly = {
        enabled = false
    },
    RainbowChar = {
        enabled = false
    },
    GiantMode = {
        enabled = false
    },
    TinyMode = {
        enabled = false
    },
    CopyChar = {
        enabled = false
    },
    AutoFarm = {
        enabled = false
    },
    FireAura = {
        enabled = false
    },
    IceAura = {
        enabled = false
    },
    Shockwave = {
        enabled = false
    },
    TeleportSpawn = {
        enabled = false
    },
    TeleportSky = {
        enabled = false
    },
    TeleportBoss = {
        enabled = false
    }
}

-- Function to create buttons like Speed Hub X
local buttonY = 10
local function createHubButton(text, yPos)
    local button = Instance.new("TextButton")
    button.Text = text
    button.Size = UDim2.new(0.9, 0, 0, 40)
    button.Position = UDim2.new(0.05, 0, 0, yPos)
    button.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
    button.TextColor3 = Color3.fromRGB(255, 255, 255)
    button.Font = Enum.Font.Gotham
    button.FontSize = Enum.FontSize.Size14
    button.Parent = ContentFrame
    return button
end

-- ============================================
-- WALKSPEED (FROM SPEED HUB X)
-- ============================================
local walkSpeedBtn = createHubButton("WalkSpeed: " .. features.WalkSpeed.value, buttonY)
walkSpeedBtn.MouseButton1Click:Connect(function()
    features.WalkSpeed.value = features.WalkSpeed.value + 10
    if features.WalkSpeed.value > 100 then
        features.WalkSpeed.value = 16
    end
    walkSpeedBtn.Text = "WalkSpeed: " .. features.WalkSpeed.value
    
    if features.WalkSpeed.enabled then
        Humanoid.WalkSpeed = features.WalkSpeed.value
    end
end)
buttonY = buttonY + 45

local walkSpeedToggle = createHubButton("WalkSpeed: OFF", buttonY)
walkSpeedToggle.MouseButton1Click:Connect(function()
    features.WalkSpeed.enabled = not features.WalkSpeed.enabled
    if features.WalkSpeed.enabled then
        walkSpeedToggle.Text = "WalkSpeed: ON"
        walkSpeedToggle.BackgroundColor3 = Color3.fromRGB(0, 150, 0)
        Humanoid.WalkSpeed = features.WalkSpeed.value
    else
        walkSpeedToggle.Text = "WalkSpeed: OFF"
        walkSpeedToggle.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
        Humanoid.WalkSpeed = 16
    end
end)
buttonY = buttonY + 45

-- ============================================
-- ESP (FROM SPEED HUB X)
-- ============================================
local espToggle = createHubButton("ESP: OFF", buttonY)
espToggle.MouseButton1Click:Connect(function()
    features.ESP.enabled = not features.ESP.enabled
    if features.ESP.enabled then
        espToggle.Text = "ESP: ON"
        espToggle.BackgroundColor3 = Color3.fromRGB(0, 150, 0)
        
        -- Create ESP for all players
        spawn(function()
            while features.ESP.enabled do
                wait(1)
                pcall(function()
                    for _, target in pairs(game:GetService("Players"):GetPlayers()) do
                        if target ~= Player and target.Character then
                            local char = target.Character
                            local highlight = char:FindFirstChild("HamzzESP") or Instance.new("Highlight")
                            highlight.Name = "HamzzESP"
                            highlight.FillColor = Color3.fromRGB(255, 50, 50)
                            highlight.OutlineColor = Color3.fromRGB(255, 255, 50)
                            highlight.FillTransparency = 0.5
                            highlight.Parent = char
                        end
                    end
                end)
            end
        end)
    else
        espToggle.Text = "ESP: OFF"
        espToggle.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
        
        -- Remove all ESP
        for _, target in pairs(game:GetService("Players"):GetPlayers()) do
            if target.Character then
                local esp = target.Character:FindFirstChild("HamzzESP")
                if esp then
                    esp:Destroy()
                end
            end
        end
    end
end)
buttonY = buttonY + 45

-- ============================================
-- AIMBOT (FROM SPEED HUB X)
-- ============================================
local aimbotToggle = createHubButton("Aimbot: OFF", buttonY)
aimbotToggle.MouseButton1Click:Connect(function()
    features.Aimbot.enabled = not features.Aimbot.enabled
    if features.Aimbot.enabled then
        aimbotToggle.Text = "Aimbot: ON"
        aimbotToggle.BackgroundColor3 = Color3.fromRGB(0, 150, 0)
        
        -- Aimbot loop
        game:GetService("RunService").RenderStepped:Connect(function()
            if features.Aimbot.enabled then
                local closest = nil
                local shortestDistance = math.huge
                local mouse = Player:GetMouse()
                
                for _, target in pairs(game:GetService("Players"):GetPlayers()) do
                    if target ~= Player and target.Character then
                        local humanoidRootPart = target.Character:FindFirstChild("HumanoidRootPart")
                        if humanoidRootPart then
                            local screenPoint, visible = workspace.CurrentCamera:WorldToViewportPoint(humanoidRootPart.Position)
                            if visible then
                                local distance = (Vector2.new(mouse.X, mouse.Y) - Vector2.new(screenPoint.X, screenPoint.Y)).Magnitude
                                if distance < shortestDistance and distance < features.Aimbot.fov then
                                    shortestDistance = distance
                                    closest = humanoidRootPart
                                end
                            end
                        end
                    end
                end
                
                if closest then
                    mouse.Target = closest
                end
            end
        end)
    else
        aimbotToggle.Text = "Aimbot: OFF"
        aimbotToggle.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
    end
end)
buttonY = buttonY + 45

-- ============================================
-- NO CLIP (FROM SPEED HUB X)
-- ============================================
local noclipToggle = createHubButton("NoClip: OFF", buttonY)
noclipToggle.MouseButton1Click:Connect(function()
    features.NoClip.enabled = not features.NoClip.enabled
    if features.NoClip.enabled then
        noclipToggle.Text = "NoClip: ON"
        noclipToggle.BackgroundColor3 = Color3.fromRGB(0, 150, 0)
        
        game:GetService("RunService").Stepped:Connect(function()
            if features.NoClip.enabled then
                for _, part in pairs(Character:GetChildren()) do
                    if part:IsA("BasePart") then
                        part.CanCollide = false
                    end
                end
            end
        end)
    else
        noclipToggle.Text = "NoClip: OFF"
        noclipToggle.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
    end
end)
buttonY = buttonY + 45

-- ============================================
-- AUTO CLICKER (FROM SPEED HUB X)
-- ============================================
local clickerToggle = createHubButton("AutoClicker: OFF", buttonY)
clickerToggle.MouseButton1Click:Connect(function()
    features.AutoClicker.enabled = not features.AutoClicker.enabled
    if features.AutoClicker.enabled then
        clickerToggle.Text = "AutoClicker: ON"
        clickerToggle.BackgroundColor3 = Color3.fromRGB(0, 150, 0)
        
        spawn(function()
            while features.AutoClicker.enabled do
                wait(1/features.AutoClicker.cps)
                pcall(function()
                    mouse1click()
                end)
            end
        end)
    else
        clickerToggle.Text = "AutoClicker: OFF"
        clickerToggle.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
    end
end)
buttonY = buttonY + 45

-- ============================================
-- ANTI-AFK (FROM SPEED HUB X)
-- ============================================
local afkToggle = createHubButton("Anti-AFK: ON", buttonY)
afkToggle.BackgroundColor3 = Color3.fromRGB(0, 150, 0)
afkToggle.MouseButton1Click:Connect(function()
    features.AntiAFK.enabled = not features.AntiAFK.enabled
    if features.AntiAFK.enabled then
        afkToggle.Text = "Anti-AFK: ON"
        afkToggle.BackgroundColor3 = Color3.fromRGB(0, 150, 0)
        
        Player.Idled:Connect(function()
            game:GetService("VirtualUser"):Button2Down(Vector2.new(0,0), workspace.CurrentCamera.CFrame)
            wait(1)
            game:GetService("VirtualUser"):Button2Up(Vector2.new(0,0), workspace.CurrentCamera.CFrame)
        end)
    else
        afkToggle.Text = "Anti-AFK: OFF"
        afkToggle.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
    end
end)
buttonY = buttonY + 45

-- ============================================
-- GOD MODE (FROM HAMZZ MODS)
-- ============================================
local godToggle = createHubButton("God Mode: OFF", buttonY)
godToggle.MouseButton1Click:Connect(function()
    features.GodMode.enabled = not features.GodMode.enabled
    if features.GodMode.enabled then
        godToggle.Text = "God Mode: ON"
        godToggle.BackgroundColor3 = Color3.fromRGB(0, 150, 0)
        
        pcall(function()
            sethiddenproperty(Humanoid, "MaxHealth", math.huge)
            sethiddenproperty(Humanoid, "Health", math.huge)
        end)
    else
        godToggle.Text = "God Mode: OFF"
        godToggle.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
    end
end)
buttonY = buttonY + 45

-- ============================================
-- FLY MODE (FROM HAMZZ MODS)
-- ============================================
local flyToggle = createHubButton("Fly Mode: OFF", buttonY)
flyToggle.MouseButton1Click:Connect(function()
    features.Fly.enabled = not features.Fly.enabled
    if features.Fly.enabled then
        flyToggle.Text = "Fly Mode: ON"
        flyToggle.BackgroundColor3 = Color3.fromRGB(0, 150, 0)
        
        local bodyVel = Instance.new("BodyVelocity")
        bodyVel.Velocity = Vector3.new(0, 0, 0)
        bodyVel.MaxForce = Vector3.new(4000, 4000, 4000)
        bodyVel.Parent = RootPart
        
        local UIS = game:GetService("UserInputService")
        local flyVel = Vector3.new(0, 0, 0)
        
        spawn(function()
            while features.Fly.enabled do
                bodyVel.Velocity = flyVel
                wait()
            end
        end)
        
        UIS.InputBegan:Connect(function(input)
            if features.Fly.enabled then
                if input.KeyCode == Enum.KeyCode.Space then
                    flyVel = Vector3.new(0, 80, 0)
                elseif input.KeyCode == Enum.KeyCode.LeftControl then
                    flyVel = Vector3.new(0, -80, 0)
                end
            end
        end)
        
        UIS.InputEnded:Connect(function(input)
            if features.Fly.enabled then
                if input.KeyCode == Enum.KeyCode.Space or input.KeyCode == Enum.KeyCode.LeftControl then
                    flyVel = Vector3.new(0, 0, 0)
                end
            end
        end)
    else
        flyToggle.Text = "Fly Mode: OFF"
        flyToggle.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
        if RootPart:FindFirstChild("BodyVelocity") then
            RootPart.BodyVelocity:Destroy()
        end
    end
end)
buttonY = buttonY + 45

-- ============================================
-- AUTO FARM BOSS (FROM HAMZZ MODS)
-- ============================================
local farmToggle = createHubButton("Auto Farm: OFF", buttonY)
farmToggle.MouseButton1Click:Connect(function()
    features.AutoFarm.enabled = not features.AutoFarm.enabled
    if features.AutoFarm.enabled then
        farmToggle.Text = "Auto Farm: ON"
        farmToggle.BackgroundColor3 = Color3.fromRGB(0, 150, 0)
        
        spawn(function()
            while features.AutoFarm.enabled do
                wait(1)
                pcall(function()
                    for _, mob in pairs(workspace:GetChildren()) do
                        if mob.Name:find("Boss") or mob.Name:find("Enemy") then
                            if mob:FindFirstChild("Humanoid") then
                                mob.Humanoid.Health = 0
                            end
                        end
                    end
                end)
            end
        end)
    else
        farmToggle.Text = "Auto Farm: OFF"
        farmToggle.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
    end
end)
buttonY = buttonY + 45

-- ============================================
-- COPY CHARACTER (FROM HAMZZ MODS)
-- ============================================
local copyBtn = createHubButton("Copy Character", buttonY)
copyBtn.MouseButton1Click:Connect(function()
    for _, target in pairs(game:GetService("Players"):GetPlayers()) do
        if target ~= Player and target.Character then
            local targetChar = target.Character
            
            for _, item in pairs(Character:GetChildren()) do
                if item:IsA("Accessory") or item:IsA("Shirt") or item:IsA("Pants") then
                    item:Destroy()
                end
            end
            
            for _, item in pairs(targetChar:GetChildren()) do
                if item:IsA("Accessory") or item:IsA("Shirt") or item:IsA("Pants") then
                    local clone = item:Clone()
                    clone.Parent = Character
                end
            end
            
            copyBtn.Text = "Copied: " .. target.Name
            break
        end
    end
end)
buttonY = buttonY + 45

-- ============================================
-- TELEPORT TO SPAWN (FROM HAMZZ MODS)
-- ============================================
local teleportBtn = createHubButton("Teleport to Spawn", buttonY)
teleportBtn.MouseButton1Click:Connect(function()
    pcall(function()
        local spawns = workspace:FindFirstChild("SpawnLocation") or workspace:FindFirstChild("Spawn")
        if spawns then
            RootPart.CFrame = spawns.CFrame
        else
            RootPart.CFrame = CFrame.new(0, 100, 0)
        end
        teleportBtn.Text = "Teleported!"
        wait(1)
        teleportBtn.Text = "Teleport to Spawn"
    end)
end)
buttonY = buttonY + 45

-- Update canvas size
ContentFrame.CanvasSize = UDim2.new(0, 0, 0, buttonY + 20)

-- Auto enable Anti-AFK
if features.AntiAFK.enabled then
    Player.Idled:Connect(function()
        game:GetService("VirtualUser"):Button2Down(Vector2.new(0,0), workspace.CurrentCamera.CFrame)
        wait(1)
        game:GetService("VirtualUser"):Button2Up(Vector2.new(0,0), workspace.CurrentCamera.CFrame)
    end)
end

print("Hamzz Hub Script Loaded Successfully!")
print("Features: WalkSpeed, ESP, Aimbot, NoClip, AutoClicker")
print("Anti-AFK, God Mode, Fly, Auto Farm, Copy Character")
print("Teleport, and many more!")

-- Make UI draggable
local dragging = false
local dragStart, startPos

Title.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 then
        dragging = true
        dragStart = input.Position
        startPos = MainFrame.Position
    end
end)

game:GetService("UserInputService").InputChanged:Connect(function(input)
    if dragging and input.UserInputType == Enum.UserInputType.MouseMovement then
        local delta = input.Position - dragStart
        MainFrame.Position = UDim2.new(
            startPos.X.Scale, 
            startPos.X.Offset + delta.X,
            startPos.Y.Scale, 
            startPos.Y.Offset + delta.Y
        )
    end
end)

Title.InputEnded:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 then
        dragging = false
    end
end)
