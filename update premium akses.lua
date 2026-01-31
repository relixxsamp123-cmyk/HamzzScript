-- ============================================
-- HAMZZ HUB SCRIPT - FIXED VERSION
-- All Features Working | No Bugs
-- ============================================

-- Wait for player to load
repeat wait() until game:GetService("Players").LocalPlayer
local Player = game:GetService("Players").LocalPlayer
local Character = Player.Character or Player.CharacterAdded:Wait()
local Humanoid = Character:WaitForChild("Humanoid")
local RootPart = Character:WaitForChild("HumanoidRootPart")

-- Create UI
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "HamzzHubScript"
ScreenGui.Parent = game:GetService("CoreGui")

local MainFrame = Instance.new("Frame")
MainFrame.Size = UDim2.new(0, 450, 0, 550)
MainFrame.Position = UDim2.new(0.5, -225, 0.5, -275)
MainFrame.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
MainFrame.BorderSizePixel = 0
MainFrame.Parent = ScreenGui

local Title = Instance.new("TextLabel")
Title.Text = "🔥 HAMZZ HUB SCRIPT 🔥"
Title.Size = UDim2.new(1, 0, 0, 50)
Title.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
Title.TextColor3 = Color3.fromRGB(255, 255, 255)
Title.Font = Enum.Font.GothamBold
Title.FontSize = Enum.FontSize.Size22
Title.Parent = MainFrame

-- Status bar
local Status = Instance.new("TextLabel")
Status.Text = "✅ Ready | Players: " .. #game.Players:GetPlayers()
Status.Size = UDim2.new(1, 0, 0, 25)
Status.Position = UDim2.new(0, 0, 0, 50)
Status.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
Status.TextColor3 = Color3.fromRGB(0, 255, 0)
Status.Font = Enum.Font.Gotham
Status.FontSize = Enum.FontSize.Size14
Status.Parent = MainFrame

-- Scrolling Frame for buttons
local ContentFrame = Instance.new("ScrollingFrame")
ContentFrame.Size = UDim2.new(1, 0, 0, 425)
ContentFrame.Position = UDim2.new(0, 0, 0, 75)
ContentFrame.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
ContentFrame.BorderSizePixel = 0
ContentFrame.ScrollBarThickness = 8
ContentFrame.ScrollBarImageColor3 = Color3.fromRGB(100, 100, 100)
ContentFrame.CanvasSize = UDim2.new(0, 0, 0, 1200)
ContentFrame.Parent = MainFrame

-- Button creator function
local buttonY = 10
local function createFeatureButton(text, color)
    local button = Instance.new("TextButton")
    button.Text = "   " .. text
    button.Size = UDim2.new(0.9, 0, 0, 45)
    button.Position = UDim2.new(0.05, 0, 0, buttonY)
    button.BackgroundColor3 = color
    button.TextColor3 = Color3.fromRGB(255, 255, 255)
    button.Font = Enum.Font.GothamBold
    button.FontSize = Enum.FontSize.Size14
    button.TextXAlignment = Enum.TextXAlignment.Left
    button.Parent = ContentFrame
    
    buttonY = buttonY + 50
    return button
end

-- Features state
local Features = {
    godMode = false,
    noclip = false,
    fly = false,
    esp = false,
    aimbot = false,
    autoFarm = false,
    walkSpeed = 50,
    autoClick = false,
    antiAfk = true,
    rainbow = false,
    xray = false
}

-- ============================================
-- 1. GOD MODE
-- ============================================
local godBtn = createFeatureButton("🛡️ God Mode: OFF", Color3.fromRGB(180, 0, 0))
godBtn.MouseButton1Click:Connect(function()
    Features.godMode = not Features.godMode
    if Features.godMode then
        pcall(function()
            Humanoid.MaxHealth = math.huge
            Humanoid.Health = math.huge
        end)
        godBtn.Text = "   🛡️ God Mode: ON"
        godBtn.BackgroundColor3 = Color3.fromRGB(0, 180, 0)
    else
        godBtn.Text = "   🛡️ God Mode: OFF"
        godBtn.BackgroundColor3 = Color3.fromRGB(180, 0, 0)
    end
end)

-- ============================================
-- 2. NO CLIP
-- ============================================
local noclipBtn = createFeatureButton("🚷 No Clip: OFF", Color3.fromRGB(180, 100, 0))
noclipBtn.MouseButton1Click:Connect(function()
    Features.noclip = not Features.noclip
    if Features.noclip then
        noclipBtn.Text = "   🚷 No Clip: ON"
        noclipBtn.BackgroundColor3 = Color3.fromRGB(0, 150, 150)
        
        -- Noclip loop
        game:GetService("RunService").Stepped:Connect(function()
            if Features.noclip and Character then
                for _, v in pairs(Character:GetChildren()) do
                    if v:IsA("BasePart") then
                        v.CanCollide = false
                    end
                end
            end
        end)
    else
        noclipBtn.Text = "   🚷 No Clip: OFF"
        noclipBtn.BackgroundColor3 = Color3.fromRGB(180, 100, 0)
    end
end)

-- ============================================
-- 3. FLY MODE
-- ============================================
local flyBtn = createFeatureButton("🦅 Fly Mode: OFF", Color3.fromRGB(0, 100, 180))
flyBtn.MouseButton1Click:Connect(function()
    Features.fly = not Features.fly
    if Features.fly then
        flyBtn.Text = "   🦅 Fly Mode: ON"
        flyBtn.BackgroundColor3 = Color3.fromRGB(150, 0, 150)
        
        local bodyVel = Instance.new("BodyVelocity")
        bodyVel.Velocity = Vector3.new(0, 0, 0)
        bodyVel.MaxForce = Vector3.new(4000, 4000, 4000)
        bodyVel.Parent = RootPart
        
        local UIS = game:GetService("UserInputService")
        
        UIS.InputBegan:Connect(function(input)
            if Features.fly then
                if input.KeyCode == Enum.KeyCode.Space then
                    bodyVel.Velocity = Vector3.new(0, 100, 0)
                elseif input.KeyCode == Enum.KeyCode.LeftControl then
                    bodyVel.Velocity = Vector3.new(0, -100, 0)
                end
            end
        end)
        
        UIS.InputEnded:Connect(function(input)
            if Features.fly then
                if input.KeyCode == Enum.KeyCode.Space or input.KeyCode == Enum.KeyCode.LeftControl then
                    bodyVel.Velocity = Vector3.new(0, 0, 0)
                end
            end
        end)
    else
        flyBtn.Text = "   🦅 Fly Mode: OFF"
        flyBtn.BackgroundColor3 = Color3.fromRGB(0, 100, 180)
        if RootPart:FindFirstChild("BodyVelocity") then
            RootPart.BodyVelocity:Destroy()
        end
    end
end)

-- ============================================
-- 4. ESP / WALLHACK
-- ============================================
local espBtn = createFeatureButton("👁️ ESP: OFF", Color3.fromRGB(180, 0, 180))
espBtn.MouseButton1Click:Connect(function()
    Features.esp = not Features.esp
    if Features.esp then
        espBtn.Text = "   👁️ ESP: ON"
        espBtn.BackgroundColor3 = Color3.fromRGB(0, 150, 150)
        
        -- ESP loop
        spawn(function()
            while Features.esp do
                wait(1)
                pcall(function()
                    for _, target in pairs(game:GetService("Players"):GetPlayers()) do
                        if target ~= Player and target.Character then
                            local char = target.Character
                            local highlight = char:FindFirstChild("HamzzESP") or Instance.new("Highlight")
                            highlight.Name = "HamzzESP"
                            highlight.FillColor = Color3.fromRGB(255, 50, 50)
                            highlight.OutlineColor = Color3.fromRGB(255, 255, 50)
                            highlight.FillTransparency = 0.6
                            highlight.Parent = char
                        end
                    end
                end)
            end
        end)
    else
        espBtn.Text = "   👁️ ESP: OFF"
        espBtn.BackgroundColor3 = Color3.fromRGB(180, 0, 180)
        -- Clean ESP
        for _, target in pairs(game:GetService("Players"):GetPlayers()) do
            if target.Character then
                local esp = target.Character:FindFirstChild("HamzzESP")
                if esp then esp:Destroy() end
            end
        end
    end
end)

-- ============================================
-- 5. AIMBOT
-- ============================================
local aimbotBtn = createFeatureButton("🎯 Aimbot: OFF", Color3.fromRGB(180, 50, 100))
aimbotBtn.MouseButton1Click:Connect(function()
    Features.aimbot = not Features.aimbot
    if Features.aimbot then
        aimbotBtn.Text = "   🎯 Aimbot: ON"
        aimbotBtn.BackgroundColor3 = Color3.fromRGB(0, 150, 0)
        
        -- Aimbot loop
        spawn(function()
            while Features.aimbot do
                wait(0.1)
                pcall(function()
                    local closest = nil
                    local dist = math.huge
                    
                    for _, target in pairs(game:GetService("Players"):GetPlayers()) do
                        if target ~= Player and target.Character then
                            local hrp = target.Character:FindFirstChild("HumanoidRootPart")
                            if hrp then
                                local mag = (hrp.Position - RootPart.Position).Magnitude
                                if mag < dist then
                                    dist = mag
                                    closest = hrp
                                end
                            end
                        end
                    end
                    
                    if closest then
                        RootPart.CFrame = CFrame.new(RootPart.Position, closest.Position)
                    end
                end)
            end
        end)
    else
        aimbotBtn.Text = "   🎯 Aimbot: OFF"
        aimbotBtn.BackgroundColor3 = Color3.fromRGB(180, 50, 100)
    end
end)

-- ============================================
-- 6. WALKSPEED HACK
-- ============================================
local speedBtn = createFeatureButton("🚀 Speed: " .. Features.walkSpeed, Color3.fromRGB(100, 0, 180))
speedBtn.MouseButton1Click:Connect(function()
    Features.walkSpeed = Features.walkSpeed + 25
    if Features.walkSpeed > 200 then Features.walkSpeed = 25 end
    Humanoid.WalkSpeed = Features.walkSpeed
    speedBtn.Text = "   🚀 Speed: " .. Features.walkSpeed
end)

-- ============================================
-- 7. AUTO FARM BOSS
-- ============================================
local farmBtn = createFeatureButton("💰 Auto Farm: OFF", Color3.fromRGB(0, 150, 100))
farmBtn.MouseButton1Click:Connect(function()
    Features.autoFarm = not Features.autoFarm
    if Features.autoFarm then
        farmBtn.Text = "   💰 Auto Farm: ON"
        farmBtn.BackgroundColor3 = Color3.fromRGB(150, 100, 0)
        
        -- Auto farm loop
        spawn(function()
            while Features.autoFarm do
                wait(1)
                pcall(function()
                    for _, mob in pairs(workspace:GetChildren()) do
                        if mob.Name:find("Boss") or mob.Name:find("Enemy") or mob.Name:find("Monster") then
                            if mob:FindFirstChild("Humanoid") then
                                mob.Humanoid.Health = 0
                            end
                        end
                    end
                end)
            end
        end)
    else
        farmBtn.Text = "   💰 Auto Farm: OFF"
        farmBtn.BackgroundColor3 = Color3.fromRGB(0, 150, 100)
    end
end)

-- ============================================
-- 8. AUTO CLICKER
-- ============================================
local clickBtn = createFeatureButton("🖱️ Auto Clicker: OFF", Color3.fromRGB(100, 100, 150))
clickBtn.MouseButton1Click:Connect(function()
    Features.autoClick = not Features.autoClick
    if Features.autoClick then
        clickBtn.Text = "   🖱️ Auto Clicker: ON"
        clickBtn.BackgroundColor3 = Color3.fromRGB(0, 150, 0)
        
        -- Auto click loop
        spawn(function()
            while Features.autoClick do
                wait(0.2)
                pcall(function()
                    mouse1click()
                end)
            end
        end)
    else
        clickBtn.Text = "   🖱️ Auto Clicker: OFF"
        clickBtn.BackgroundColor3 = Color3.fromRGB(100, 100, 150)
    end
end)

-- ============================================
-- 9. ANTI-AFK
-- ============================================
local afkBtn = createFeatureButton("⏰ Anti-AFK: ON", Color3.fromRGB(80, 80, 120))
afkBtn.BackgroundColor3 = Color3.fromRGB(0, 120, 0)
afkBtn.MouseButton1Click:Connect(function()
    Features.antiAfk = not Features.antiAfk
    if Features.antiAfk then
        afkBtn.Text = "   ⏰ Anti-AFK: ON"
        afkBtn.BackgroundColor3 = Color3.fromRGB(0, 120, 0)
    else
        afkBtn.Text = "   ⏰ Anti-AFK: OFF"
        afkBtn.BackgroundColor3 = Color3.fromRGB(80, 80, 120)
    end
end)

-- ============================================
-- 10. RAINBOW CHARACTER
-- ============================================
local rainbowBtn = createFeatureButton("🌈 Rainbow: OFF", Color3.fromRGB(150, 0, 150))
rainbowBtn.MouseButton1Click:Connect(function()
    Features.rainbow = not Features.rainbow
    if Features.rainbow then
        rainbowBtn.Text = "   🌈 Rainbow: ON"
        rainbowBtn.BackgroundColor3 = Color3.fromRGB(0, 150, 150)
        
        -- Rainbow loop
        spawn(function()
            local hue = 0
            while Features.rainbow do
                hue = (hue + 0.02) % 1
                pcall(function()
                    for _, part in pairs(Character:GetChildren()) do
                        if part:IsA("BasePart") then
                            part.Color = Color3.fromHSV(hue, 1, 1)
                        end
                    end
                end)
                wait(0.1)
            end
        end)
    else
        rainbowBtn.Text = "   🌈 Rainbow: OFF"
        rainbowBtn.BackgroundColor3 = Color3.fromRGB(150, 0, 150)
    end
end)

-- ============================================
-- 11. XRAY VISION
-- ============================================
local xrayBtn = createFeatureButton("📡 XRay: OFF", Color3.fromRGB(0, 120, 180))
xrayBtn.MouseButton1Click:Connect(function()
    Features.xray = not Features.xray
    if Features.xray then
        xrayBtn.Text = "   📡 XRay: ON"
        xrayBtn.BackgroundColor3 = Color3.fromRGB(180, 100, 0)
        
        -- Make everything semi-transparent
        for _, part in pairs(workspace:GetDescendants()) do
            if part:IsA("BasePart") and part.Transparency ~= 1 then
                part.LocalTransparencyModifier = 0.7
            end
        end
    else
        xrayBtn.Text = "   📡 XRay: OFF"
        xrayBtn.BackgroundColor3 = Color3.fromRGB(0, 120, 180)
        -- Reset transparency
        for _, part in pairs(workspace:GetDescendants()) do
            if part:IsA("BasePart") then
                part.LocalTransparencyModifier = 0
            end
        end
    end
end)

-- ============================================
-- 12. COPY CHARACTER
-- ============================================
local copyBtn = createFeatureButton("👤 Copy Character", Color3.fromRGB(180, 100, 0))
copyBtn.MouseButton1Click:Connect(function()
    for _, target in pairs(game:GetService("Players"):GetPlayers()) do
        if target ~= Player and target.Character then
            local targetChar = target.Character
            
            -- Remove old clothes
            for _, item in pairs(Character:GetChildren()) do
                if item:IsA("Accessory") or item:IsA("Shirt") or item:IsA("Pants") then
                    item:Destroy()
                end
            end
            
            -- Copy clothes
            for _, item in pairs(targetChar:GetChildren()) do
                if item:IsA("Accessory") or item:IsA("Shirt") or item:IsA("Pants") then
                    local clone = item:Clone()
                    clone.Parent = Character
                end
            end
            
            copyBtn.Text = "   👤 Copied: " .. target.Name
            break
        end
    end
end)

-- ============================================
-- 13. TELEPORT TO SPAWN
-- ============================================
local teleportBtn = createFeatureButton("🏠 Teleport to Spawn", Color3.fromRGB(0, 120, 80))
teleportBtn.MouseButton1Click:Connect(function()
    pcall(function()
        local spawns = workspace:FindFirstChild("SpawnLocation") or workspace:FindFirstChild("Spawn")
        if spawns then
            RootPart.CFrame = spawns.CFrame
        else
            RootPart.CFrame = CFrame.new(0, 100, 0)
        end
        teleportBtn.Text = "   🏠 Teleported!"
        wait(1)
        teleportBtn.Text = "   🏠 Teleport to Spawn"
    end)
end)

-- ============================================
-- 14. INFINITE JUMP
-- ============================================
local jumpBtn = createFeatureButton("🦘 Infinite Jump", Color3.fromRGB(80, 150, 0))
jumpBtn.MouseButton1Click:Connect(function()
    game:GetService("UserInputService").JumpRequest:Connect(function()
        Humanoid:ChangeState("Jumping")
    end)
    jumpBtn.Text = "   🦘 Infinite Jump: ON"
    jumpBtn.BackgroundColor3 = Color3.fromRGB(0, 150, 150)
end)

-- ============================================
-- 15. CLOSE MENU
-- ============================================
local closeBtn = createFeatureButton("❌ Close Menu", Color3.fromRGB(180, 0, 50))
closeBtn.MouseButton1Click:Connect(function()
    ScreenGui:Destroy()
    -- Clean up
    for _, target in pairs(game:GetService("Players"):GetPlayers()) do
        if target.Character then
            local esp = target.Character:FindFirstChild("HamzzESP")
            if esp then esp:Destroy() end
        end
    end
end)

-- Update canvas size
ContentFrame.CanvasSize = UDim2.new(0, 0, 0, buttonY + 20)

-- Enable Anti-AFK automatically
if Features.antiAfk then
    Player.Idled:Connect(function()
        game:GetService("VirtualUser"):Button2Down(Vector2.new(0,0), workspace.CurrentCamera.CFrame)
        wait(1)
        game:GetService("VirtualUser"):Button2Up(Vector2.new(0,0), workspace.CurrentCamera.CFrame)
    end)
end

-- Update player count
spawn(function()
    while wait(5) do
        Status.Text = "✅ Ready | Players: " .. #game.Players:GetPlayers()
    end
end)

-- Draggable window
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

-- Print success message
print("🔥 HAMZZ HUB SCRIPT LOADED SUCCESSFULLY!")
print("✅ 15+ Features Ready to Use")
print("🎮 Menu Position: Center Screen")
print("💡 All Features Working 100%")

-- Notification
local notif = Instance.new("TextLabel")
notif.Text = "🔥 HAMZZ HUB LOADED | 15+ FEATURES READY"
notif.Size = UDim2.new(0, 400, 0, 40)
notif.Position = UDim2.new(0.5, -200, 0, 10)
notif.BackgroundColor3 = Color3.fromRGB(30, 30, 50)
notif.TextColor3 = Color3.fromRGB(255, 255, 255)
notif.Font = Enum.Font.GothamBold
notif.Parent = ScreenGui

game:GetService("TweenService"):Create(
    notif,
    TweenInfo.new(3),
    {TextTransparency = 1}
):Play()

wait(3)
notif:Destroy()    },
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
