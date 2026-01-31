-- ============================================
-- HAMZZ MODS - VOLT NITRO SPEED EDITION ⚡
-- ULTRA FAST LOADING | PERFORMANCE OPTIMIZED
-- Created by: Nesia Darknet
-- ============================================

local Player = game:GetService("Players").LocalPlayer
local Character = Player.Character or Player.CharacterAdded:Wait()
local Humanoid = Character:WaitForChild("Humanoid")
local RootPart = Character:WaitForChild("HumanoidRootPart")

-- ⚡ ULTRA FAST LOADING - NO WAITS ⚡
local StartTime = tick()

-- MAIN UI - LOAD INSTANTLY
local VoltUI = Instance.new("ScreenGui")
VoltUI.Name = "HamzzVoltUI"
VoltUI.Parent = game:GetService("CoreGui")

-- VOLT NITRO MAIN FRAME
local MainFrame = Instance.new("Frame")
MainFrame.Size = UDim2.new(0, 380, 0, 500)
MainFrame.Position = UDim2.new(0, 20, 0.5, -250)
MainFrame.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
MainFrame.BorderSizePixel = 2
MainFrame.BorderColor3 = Color3.fromRGB(0, 255, 255)
MainFrame.Parent = VoltUI

-- VOLT SPEED LINES BACKGROUND
local SpeedLines = Instance.new("Frame")
SpeedLines.Size = UDim2.new(1, 0, 1, 0)
SpeedLines.BackgroundColor3 = Color3.fromRGB(5, 5, 10)
SpeedLines.BorderSizePixel = 0
SpeedLines.Parent = MainFrame

-- ANIMATED SPEED LINES
spawn(function()
    while true do
        for i = 1, 20 do
            local line = Instance.new("Frame")
            line.Size = UDim2.new(0, 2, 0, math.random(20, 50))
            line.Position = UDim2.new(0, math.random(0, 380), 0, math.random(0, 500))
            line.BackgroundColor3 = Color3.fromRGB(0, 150, 255)
            line.BackgroundTransparency = 0.7
            line.BorderSizePixel = 0
            line.Parent = SpeedLines
            
            spawn(function()
                for j = 1, 50 do
                    line.Position = UDim2.new(line.Position.X.Scale, line.Position.X.Offset + 10, 0, line.Position.Y.Offset)
                    wait(0.01)
                end
                line:Destroy()
            end)
        end
        wait(0.1)
    end
end)

-- VOLT NITRO HEADER
local Header = Instance.new("Frame")
Header.Size = UDim2.new(1, 0, 0, 70)
Header.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
Header.BorderSizePixel = 0
Header.Parent = MainFrame

-- VOLT GRADIENT
local VoltGradient = Instance.new("UIGradient")
VoltGradient.Color = ColorSequence.new{
    ColorSequenceKeypoint.new(0, Color3.fromRGB(0, 255, 255)),
    ColorSequenceKeypoint.new(1, Color3.fromRGB(0, 150, 255))
}
VoltGradient.Rotation = 90
VoltGradient.Parent = Header

-- VOLT TITLE - ULTRA FAST
local Title = Instance.new("TextLabel")
Title.Text = "⚡ VOLT NITRO SPEED ⚡"
Title.Size = UDim2.new(1, 0, 0.6, 0)
Title.BackgroundTransparency = 1
Title.TextColor3 = Color3.fromRGB(255, 255, 255)
Title.Font = Enum.Font.GothamBlack
Title.FontSize = Enum.FontSize.Size24
Title.TextStrokeTransparency = 0
Title.TextStrokeColor3 = Color3.fromRGB(0, 100, 255)
Title.Parent = Header

local SubTitle = Instance.new("TextLabel")
SubTitle.Text = "HAMZZ MODS | ULTRA FAST LOADING"
SubTitle.Size = UDim2.new(1, 0, 0.4, 0)
SubTitle.Position = UDim2.new(0, 0, 0.6, 0)
SubTitle.BackgroundTransparency = 1
SubTitle.TextColor3 = Color3.fromRGB(200, 255, 255)
SubTitle.Font = Enum.Font.GothamBold
SubTitle.FontSize = Enum.FontSize.Size14
SubTitle.Parent = Header

-- LOAD TIME DISPLAY
local LoadTime = Instance.new("TextLabel")
LoadTime.Text = "LOADED: " .. string.format("%.3f", tick() - StartTime) .. "s"
LoadTime.Size = UDim2.new(0, 120, 0, 25)
LoadTime.Position = UDim2.new(1, -125, 0, 10)
LoadTime.BackgroundColor3 = Color3.fromRGB(0, 50, 100)
LoadTime.TextColor3 = Color3.fromRGB(0, 255, 255)
LoadTime.Font = Enum.Font.GothamBold
LoadTime.FontSize = Enum.FontSize.Size12
LoadTime.Parent = Header

-- VOLT CATEGORY TABS
local Categories = {"MAIN", "VISUAL", "COMBAT", "TELEPORT", "PLAYER", "INFO"}
local CurrentCategory = "MAIN"

local TabContainer = Instance.new("Frame")
TabContainer.Size = UDim2.new(1, -20, 0, 35)
TabContainer.Position = UDim2.new(0, 10, 0, 75)
TabContainer.BackgroundColor3 = Color3.fromRGB(10, 20, 30)
TabContainer.BorderSizePixel = 0
TabContainer.Parent = MainFrame

-- VOLT TAB BUTTONS
for i, cat in ipairs(Categories) do
    local TabBtn = Instance.new("TextButton")
    TabBtn.Name = "VoltTab_" .. cat
    TabBtn.Text = cat
    TabBtn.Size = UDim2.new(1/#Categories, -2, 1, 0)
    TabBtn.Position = UDim2.new((i-1)/#Categories, 0, 0, 0)
    TabBtn.BackgroundColor3 = Color3.fromRGB(20, 40, 60)
    TabBtn.TextColor3 = Color3.fromRGB(150, 200, 255)
    TabBtn.Font = Enum.Font.GothamBold
    TabBtn.FontSize = Enum.FontSize.Size12
    TabBtn.Parent = TabContainer
    
    TabBtn.MouseButton1Click:Connect(function()
        CurrentCategory = cat
        updateVoltTabs()
        updateVoltContent()
    end)
end

local function updateVoltTabs()
    for _, cat in ipairs(Categories) do
        local tab = TabContainer:FindFirstChild("VoltTab_" .. cat)
        if tab then
            if cat == CurrentCategory then
                tab.BackgroundColor3 = Color3.fromRGB(0, 150, 255)
                tab.TextColor3 = Color3.fromRGB(255, 255, 255)
            else
                tab.BackgroundColor3 = Color3.fromRGB(20, 40, 60)
                tab.TextColor3 = Color3.fromRGB(150, 200, 255)
            end
        end
    end
end

-- VOLT CONTENT AREA
local ContentFrame = Instance.new("ScrollingFrame")
ContentFrame.Size = UDim2.new(1, -20, 0, 350)
ContentFrame.Position = UDim2.new(0, 10, 0, 120)
ContentFrame.BackgroundColor3 = Color3.fromRGB(15, 25, 35)
ContentFrame.BorderSizePixel = 0
ContentFrame.ScrollBarThickness = 6
ContentFrame.ScrollBarImageColor3 = Color3.fromRGB(0, 200, 255)
ContentFrame.CanvasSize = UDim2.new(0, 0, 0, 800)
ContentFrame.Parent = MainFrame

-- VOLT BUTTON CREATOR - OPTIMIZED
local buttonY = 10
local function createVoltButton(text, desc, color)
    local BtnFrame = Instance.new("Frame")
    BtnFrame.Size = UDim2.new(1, -10, 0, 50)
    BtnFrame.Position = UDim2.new(0, 5, 0, buttonY)
    BtnFrame.BackgroundColor3 = color
    BtnFrame.BorderSizePixel = 0
    BtnFrame.Parent = ContentFrame
    
    local Button = Instance.new("TextButton")
    Button.Text = ""
    Button.Size = UDim2.new(1, 0, 1, 0)
    Button.BackgroundTransparency = 1
    Button.Parent = BtnFrame
    
    local TitleLabel = Instance.new("TextLabel")
    TitleLabel.Text = "⚡ " .. text
    TitleLabel.Size = UDim2.new(1, -40, 0.6, 0)
    TitleLabel.Position = UDim2.new(0, 10, 0, 5)
    TitleLabel.BackgroundTransparency = 1
    TitleLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
    TitleLabel.Font = Enum.Font.GothamBold
    TitleLabel.FontSize = Enum.FontSize.Size14
    TitleLabel.TextXAlignment = Enum.TextXAlignment.Left
    TitleLabel.Parent = BtnFrame
    
    local DescLabel = Instance.new("TextLabel")
    DescLabel.Text = desc
    DescLabel.Size = UDim2.new(1, -40, 0.4, 0)
    DescLabel.Position = UDim2.new(0, 10, 0.6, 0)
    DescLabel.BackgroundTransparency = 1
    DescLabel.TextColor3 = Color3.fromRGB(200, 220, 255)
    DescLabel.Font = Enum.Font.Gotham
    DescLabel.FontSize = Enum.FontSize.Size11
    DescLabel.TextXAlignment = Enum.TextXAlignment.Left
    DescLabel.Parent = BtnFrame
    
    local StatusIcon = Instance.new("TextLabel")
    StatusIcon.Text = "▶"
    StatusIcon.Size = UDim2.new(0, 30, 1, 0)
    StatusIcon.Position = UDim2.new(1, -30, 0, 0)
    StatusIcon.BackgroundTransparency = 1
    StatusIcon.TextColor3 = Color3.fromRGB(0, 255, 255)
    StatusIcon.Font = Enum.Font.GothamBold
    StatusIcon.FontSize = Enum.FontSize.Size16
    StatusIcon.Parent = BtnFrame
    
    buttonY = buttonY + 55
    return Button, BtnFrame, StatusIcon
end

-- VOLT VARIABLES
local voltFeatures = {
    godMode = false,
    noclip = false,
    fly = false,
    esp = false,
    aimbot = false,
    autoFarm = false,
    speed = 100,
    antiAfk = true
}

-- ============================================
-- CATEGORY: MAIN - VOLT SPEED
-- ============================================
local function loadMainCategory()
    ContentFrame:ClearAllChildren()
    buttonY = 10
    
    -- VOLT GOD MODE
    local godBtn, godFrame, godIcon = createVoltButton("GOD MODE", "Ultimate protection", Color3.fromRGB(255, 50, 50))
    godBtn.MouseButton1Click:Connect(function()
        voltFeatures.godMode = not voltFeatures.godMode
        if voltFeatures.godMode then
            pcall(function()
                sethiddenproperty(Humanoid, "MaxHealth", math.huge)
                sethiddenproperty(Humanoid, "Health", math.huge)
            end)
            godIcon.Text = "✓"
            godIcon.TextColor3 = Color3.fromRGB(0, 255, 0)
            godFrame.BackgroundColor3 = Color3.fromRGB(0, 100, 0)
        else
            godIcon.Text = "▶"
            godIcon.TextColor3 = Color3.fromRGB(0, 255, 255)
            godFrame.BackgroundColor3 = Color3.fromRGB(255, 50, 50)
        end
    end)
    
    -- VOLT NO CLIP
    local noclipBtn, noclipFrame, noclipIcon = createVoltButton("NO CLIP", "Phase through walls", Color3.fromRGB(255, 150, 0))
    noclipBtn.MouseButton1Click:Connect(function()
        voltFeatures.noclip = not voltFeatures.noclip
        if voltFeatures.noclip then
            spawn(function()
                while voltFeatures.noclip do
                    wait()
                    pcall(function()
                        for _, v in pairs(Character:GetChildren()) do
                            if v:IsA("BasePart") then
                                v.CanCollide = false
                            end
                        end
                    end)
                end
            end)
            noclipIcon.Text = "✓"
            noclipIcon.TextColor3 = Color3.fromRGB(0, 255, 0)
            noclipFrame.BackgroundColor3 = Color3.fromRGB(0, 100, 100)
        else
            noclipIcon.Text = "▶"
            noclipIcon.TextColor3 = Color3.fromRGB(0, 255, 255)
            noclipFrame.BackgroundColor3 = Color3.fromRGB(255, 150, 0)
        end
    end)
    
    -- VOLT FLY
    local flyBtn, flyFrame, flyIcon = createVoltButton("FLY MODE", "Space=Up | CTRL=Down", Color3.fromRGB(0, 150, 255))
    flyBtn.MouseButton1Click:Connect(function()
        voltFeatures.fly = not voltFeatures.fly
        if voltFeatures.fly then
            local bodyVel = Instance.new("BodyVelocity")
            bodyVel.Velocity = Vector3.new(0, 0, 0)
            bodyVel.MaxForce = Vector3.new(4000, 4000, 4000)
            bodyVel.Parent = RootPart
            
            local UIS = game:GetService("UserInputService")
            local flyVel = Vector3.new(0, 0, 0)
            
            spawn(function()
                while voltFeatures.fly do
                    bodyVel.Velocity = flyVel
                    wait()
                end
            end)
            
            UIS.InputBegan:Connect(function(input)
                if voltFeatures.fly then
                    if input.KeyCode == Enum.KeyCode.Space then
                        flyVel = Vector3.new(0, 100, 0)
                    elseif input.KeyCode == Enum.KeyCode.LeftControl then
                        flyVel = Vector3.new(0, -100, 0)
                    end
                end
            end)
            
            UIS.InputEnded:Connect(function(input)
                if voltFeatures.fly then
                    if input.KeyCode == Enum.KeyCode.Space or input.KeyCode == Enum.KeyCode.LeftControl then
                        flyVel = Vector3.new(0, 0, 0)
                    end
                end
            end)
            
            flyIcon.Text = "✓"
            flyIcon.TextColor3 = Color3.fromRGB(0, 255, 0)
            flyFrame.BackgroundColor3 = Color3.fromRGB(0, 50, 150)
        else
            if RootPart:FindFirstChild("BodyVelocity") then
                RootPart.BodyVelocity:Destroy()
            end
            flyIcon.Text = "▶"
            flyIcon.TextColor3 = Color3.fromRGB(0, 255, 255)
            flyFrame.BackgroundColor3 = Color3.fromRGB(0, 150, 255)
        end
    end)
    
    -- VOLT SPEED HACK
    local speedBtn, speedFrame, speedIcon = createVoltButton("SPEED HACK", "Velocity: " .. voltFeatures.speed, Color3.fromRGB(150, 0, 255))
    speedBtn.MouseButton1Click:Connect(function()
        voltFeatures.speed = voltFeatures.speed + 50
        if voltFeatures.speed > 300 then voltFeatures.speed = 50 end
        Humanoid.WalkSpeed = voltFeatures.speed
        speedFrame:FindFirstChild("TextLabel").Text = "⚡ SPEED HACK - " .. voltFeatures.speed
        speedIcon.Text = voltFeatures.speed
    end)
    
    -- VOLT JUMP
    local jumpBtn, jumpFrame, jumpIcon = createVoltButton("SUPER JUMP", "High velocity jumps", Color3.fromRGB(0, 255, 150))
    jumpBtn.MouseButton1Click:Connect(function()
        Humanoid.JumpPower = 200
        Humanoid.JumpHeight = 15
        jumpIcon.Text = "⚡"
        jumpIcon.TextColor3 = Color3.fromRGB(255, 255, 0)
    end)
    
    -- INFINITE JUMP
    local infJumpBtn, infJumpFrame, infJumpIcon = createVoltButton("INFINITE JUMP", "Unlimited air jumps", Color3.fromRGB(255, 100, 0))
    infJumpBtn.MouseButton1Click:Connect(function()
        game:GetService("UserInputService").JumpRequest:Connect(function()
            Humanoid:ChangeState("Jumping")
        end)
        infJumpIcon.Text = "♾️"
        infJumpIcon.TextColor3 = Color3.fromRGB(0, 255, 255)
    end)
    
    -- ANTI-AFK
    local afkBtn, afkFrame, afkIcon = createVoltButton("ANTI-AFK", "Prevent idle kicking", Color3.fromRGB(100, 100, 200))
    afkBtn.MouseButton1Click:Connect(function()
        voltFeatures.antiAfk = not voltFeatures.antiAfk
        if voltFeatures.antiAfk then
            game:GetService("Players").LocalPlayer.Idled:Connect(function()
                game:GetService("VirtualUser"):Button2Down(Vector2.new(0,0), workspace.CurrentCamera.CFrame)
                wait(1)
                game:GetService("VirtualUser"):Button2Up(Vector2.new(0,0), workspace.CurrentCamera.CFrame)
            end)
            afkIcon.Text = "✓"
            afkIcon.TextColor3 = Color3.fromRGB(0, 255, 0)
        else
            afkIcon.Text = "▶"
            afkIcon.TextColor3 = Color3.fromRGB(0, 255, 255)
        end
    end)
end

-- ============================================
-- CATEGORY: VISUAL - VOLT SPEED
-- ============================================
local function loadVisualCategory()
    ContentFrame:ClearAllChildren()
    buttonY = 10
    
    -- VOLT ESP
    local espBtn, espFrame, espIcon = createVoltButton("ESP", "See through walls", Color3.fromRGB(255, 0, 150))
    espBtn.MouseButton1Click:Connect(function()
        voltFeatures.esp = not voltFeatures.esp
        if voltFeatures.esp then
            spawn(function()
                while voltFeatures.esp do
                    wait(1)
                    pcall(function()
                        for _, target in pairs(game:GetService("Players"):GetPlayers()) do
                            if target ~= Player and target.Character then
                                local char = target.Character
                                local highlight = char:FindFirstChild("VoltESP") or Instance.new("Highlight")
                                highlight.Name = "VoltESP"
                                highlight.FillColor = Color3.fromRGB(255, 50, 50)
                                highlight.OutlineColor = Color3.fromRGB(0, 255, 255)
                                highlight.FillTransparency = 0.6
                                highlight.Parent = char
                            end
                        end
                    end)
                end
            end)
            espIcon.Text = "✓"
            espIcon.TextColor3 = Color3.fromRGB(0, 255, 0)
        else
            for _, target in pairs(game:GetService("Players"):GetPlayers()) do
                if target.Character then
                    local esp = target.Character:FindFirstChild("VoltESP")
                    if esp then esp:Destroy() end
                end
            end
            espIcon.Text = "▶"
            espIcon.TextColor3 = Color3.fromRGB(0, 255, 255)
        end
    end)
    
    -- XRAY
    local xrayBtn, xrayFrame, xrayIcon = createVoltButton("XRAY", "See through terrain", Color3.fromRGB(0, 200, 255))
    xrayBtn.MouseButton1Click:Connect(function()
        for _, part in pairs(workspace:GetDescendants()) do
            if part:IsA("BasePart") and part.Transparency ~= 1 then
                part.LocalTransparencyModifier = 0.7
            end
        end
        xrayIcon.Text = "✓"
        xrayIcon.TextColor3 = Color3.fromRGB(0, 255, 0)
    end)
    
    -- RAINBOW
    local rainbowBtn, rainbowFrame, rainbowIcon = createVoltButton("RAINBOW", "Cycling colors", Color3.fromRGB(255, 0, 255))
    rainbowBtn.MouseButton1Click:Connect(function()
        spawn(function()
            local hue = 0
            while true do
                hue = (hue + 0.05) % 1
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
        rainbowIcon.Text = "🌈"
        rainbowIcon.TextColor3 = Color3.fromRGB(255, 255, 0)
    end)
    
    -- FIRE AURA
    local fireBtn, fireFrame, fireIcon = createVoltButton("FIRE AURA", "Surround with fire", Color3.fromRGB(255, 100, 0))
    fireBtn.MouseButton1Click:Connect(function()
        spawn(function()
            for i = 1, 20 do
                wait(0.15)
                pcall(function()
                    local fire = Instance.new("Part")
                    fire.Size = Vector3.new(10, 10, 10)
                    fire.Color = Color3.fromRGB(255, 100, 0)
                    fire.Transparency = 0.7
                    fire.CFrame = RootPart.CFrame * CFrame.new(math.random(-8, 8), math.random(-4, 4), math.random(-8, 8))
                    fire.Anchored = true
                    fire.CanCollide = false
                    fire.Parent = workspace
                    
                    game:GetService("Debris"):AddItem(fire, 1)
                end)
            end
        end)
        fireIcon.Text = "🔥"
        fireIcon.TextColor3 = Color3.fromRGB(255, 255, 0)
    end)
    
    -- ICE AURA
    local iceBtn, iceFrame, iceIcon = createVoltButton("ICE AURA", "Freezing effects", Color3.fromRGB(0, 150, 255))
    iceBtn.MouseButton1Click:Connect(function()
        spawn(function()
            for i = 1, 15 do
                wait(0.2)
                pcall(function()
                    local ice = Instance.new("Part")
                    ice.Size = Vector3.new(8, 8, 8)
                    ice.Color = Color3.fromRGB(100, 200, 255)
                    ice.Transparency = 0.7
                    ice.CFrame = RootPart.CFrame * CFrame.new(math.random(-6, 6), math.random(-3, 3), math.random(-6, 6))
                    ice.Anchored = true
                    ice.CanCollide = false
                    ice.Parent = workspace
                    
                    game:GetService("Debris"):AddItem(ice, 1.5)
                end)
            end
        end)
        iceIcon.Text = "❄️"
        iceIcon.TextColor3 = Color3.fromRGB(255, 255, 255)
    end)
end

-- ============================================
-- CATEGORY: COMBAT - VOLT SPEED
-- ============================================
local function loadCombatCategory()
    ContentFrame:ClearAllChildren()
    buttonY = 10
    
    -- VOLT AIMBOT
    local aimbotBtn, aimbotFrame, aimbotIcon = createVoltButton("AIMBOT", "Auto target system", Color3.fromRGB(255, 50, 100))
    aimbotBtn.MouseButton1Click:Connect(function()
        voltFeatures.aimbot = not voltFeatures.aimbot
        if voltFeatures.aimbot then
            spawn(function()
                while voltFeatures.aimbot do
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
            aimbotIcon.Text = "✓"
            aimbotIcon.TextColor3 = Color3.fromRGB(0, 255, 0)
        else
            aimbotIcon.Text = "▶"
            aimbotIcon.TextColor3 = Color3.fromRGB(0, 255, 255)
        end
    end)
    
    -- AUTO FARM
    local farmBtn, farmFrame, farmIcon = createVoltButton("AUTO FARM", "Auto kill bosses", Color3.fromRGB(0, 200, 150))
    farmBtn.MouseButton1Click:Connect(function()
        voltFeatures.autoFarm = not voltFeatures.autoFarm
        if voltFeatures.autoFarm then
            spawn(function()
                while voltFeatures.autoFarm do
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
            farmIcon.Text = "✓"
            farmIcon.TextColor3 = Color3.fromRGB(0, 255, 0)
        else
            farmIcon.Text = "▶"
            farmIcon.TextColor3 = Color3.fromRGB(0, 255, 255)
        end
    end)
    
    -- SHOCKWAVE
    local shockBtn, shockFrame, shockIcon = createVoltButton("SHOCKWAVE", "Area blast effect", Color3.fromRGB(0, 150, 255))
    shockBtn.MouseButton1Click:Connect(function()
        local shock = Instance.new("Part")
        shock.Size = Vector3.new(30, 2, 30)
        shock.Position = RootPart.Position - Vector3.new(0, 3, 0)
        shock.Color = Color3.fromRGB(0, 200, 255)
        shock.Transparency = 0.6
        shock.Anchored = true
        shock.CanCollide = false
        shock.Parent = workspace
        
        game:GetService("Debris"):AddItem(shock, 2)
        shockIcon.Text = "🌊"
        shockIcon.TextColor3 = Color3.fromRGB(255, 255, 0)
    end)
    
    -- GOD SWORD
    local swordBtn, swordFrame, swordIcon = createVoltButton("GOD SWORD", "Spawn weapon", Color3.fromRGB(255, 0, 100))
    swordBtn.MouseButton1Click:Connect(function()
        local sword = Instance.new("Tool")
        sword.Name = "VoltGodSword"
        
        local handle = Instance.new("Part")
        handle.Name = "Handle"
        handle.Size = Vector3.new(1, 6, 1)
        handle.Color = Color3.fromRGB(255, 0, 0)
        handle.Parent = sword
        
        sword.Parent = Character
        swordIcon.Text = "⚔️"
        swordIcon.TextColor3 = Color3.fromRGB(255, 255, 0)
    end)
    
    -- NO RECOIL
    local recoilBtn, recoilFrame, recoilIcon = createVoltButton("NO RECOIL", "Zero weapon recoil", Color3.fromRGB(150, 100, 255))
    recoilBtn.MouseButton1Click:Connect(function()
        recoilIcon.Text = "✓"
        recoilIcon.TextColor3 = Color3.fromRGB(0, 255, 0)
    end)
    
    -- AUTO CLICKER
    local clickBtn, clickFrame, clickIcon = createVoltButton("AUTO CLICKER", "Rapid clicking", Color3.fromRGB(100, 200, 100))
    clickBtn.MouseButton1Click:Connect(function()
        spawn(function()
            while true do
                wait(0.15)
                pcall(function()
                    mouse1click()
                end)
            end
        end)
        clickIcon.Text = "✓"
        clickIcon.TextColor3 = Color3.fromRGB(0, 255, 0)
    end)
end

-- ============================================
-- CATEGORY: TELEPORT - VOLT SPEED
-- ============================================
local function loadTeleportCategory()
    ContentFrame:ClearAllChildren()
    buttonY = 10
    
    -- SPAWN
    local spawnBtn, spawnFrame, spawnIcon = createVoltButton("SPAWN", "Teleport to spawn", Color3.fromRGB(0, 180, 100))
    spawnBtn.MouseButton1Click:Connect(function()
        pcall(function()
            local spawns = workspace:FindFirstChild("SpawnLocation") or workspace:FindFirstChild("Spawn")
            if spawns then
                RootPart.CFrame = spawns.CFrame
            else
                RootPart.CFrame = CFrame.new(0, 100, 0)
            end
            spawnIcon.Text = "✓"
            spawnIcon.TextColor3 = Color3.fromRGB(0, 255, 0)
        end)
    end)
    
    -- SKY
    local skyBtn, skyFrame, skyIcon = createVoltButton("SKY", "Teleport upwards", Color3.fromRGB(0, 150, 255))
    skyBtn.MouseButton1Click:Connect(function()
        RootPart.CFrame = CFrame.new(RootPart.Position + Vector3.new(0, 500, 0))
        skyIcon.Text = "☁️"
        skyIcon.TextColor3 = Color3.fromRGB(255, 255, 255)
    end)
    
    -- BOSS
    local bossBtn, bossFrame, bossIcon = createVoltButton("BOSS", "Find and teleport", Color3.fromRGB(255, 50, 50))
    bossBtn.MouseButton1Click:Connect(function()
        pcall(function()
            for _, mob in pairs(workspace:GetChildren()) do
                if mob.Name:find("Boss") then
                    if mob:FindFirstChild("HumanoidRootPart") then
                        RootPart.CFrame = mob.HumanoidRootPart.CFrame * CFrame.new(0, 0, -10)
                        bossIcon.Text = "👹"
                        bossIcon.TextColor3 = Color3.fromRGB(255, 255, 0)
                        break
                    end
                end
            end
        end)
    end)
    
    -- BASE
    local baseBtn, baseFrame, baseIcon = createVoltButton("BASE", "Safe location", Color3.fromRGB(255, 150, 0))
    baseBtn.MouseButton1Click:Connect(function()
        RootPart.CFrame = CFrame.new(0, 200, 0)
        baseIcon.Text = "🏰"
        baseIcon.TextColor3 = Color3.fromRGB(255, 255, 255)
    end)
    
    -- RANDOM
    local randomBtn, randomFrame, randomIcon = createVoltButton("RANDOM", "Random teleport", Color3.fromRGB(180, 0, 255))
    randomBtn.MouseButton1Click:Connect(function()
        RootPart.CFrame = CFrame.new(
            math.random(-500, 500),
            math.random(50, 200),
            math.random(-500, 500)
        )
        randomIcon.Text = "🎲"
        randomIcon.TextColor3 = Color3.fromRGB(255, 255, 0)
    end)
end

-- ============================================
-- CATEGORY: PLAYER - VOLT SPEED
-- ============================================
local function loadPlayerCategory()
    ContentFrame:ClearAllChildren()
    buttonY = 10
    
    -- COPY CHARACTER
    local copyBtn, copyFrame, copyIcon = createVoltButton("COPY CHAR", "Copy appearance", Color3.fromRGB(180, 0, 255))
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
                
                copyIcon.Text = "👤"
                copyFrame:FindFirstChild("TextLabel").Text = "⚡ COPY CHAR - " .. target.Name
                break
            end
        end
    end)
    
    -- GIANT MODE
    local giantBtn, giantFrame, giantIcon = createVoltButton("GIANT", "Become huge", Color3.fromRGB(255, 200, 0))
    giantBtn.MouseButton1Click:Connect(function()
        Humanoid.BodyDepthScale = 3
        Humanoid.BodyHeightScale = 3
        Humanoid.BodyWidthScale = 3
        Humanoid.HeadScale = 3
        giantIcon.Text = "👑"
        giantIcon.TextColor3 = Color3.fromRGB(255, 255, 0)
    end)
    
    -- TINY MODE
    local tinyBtn, tinyFrame, tinyIcon = createVoltButton("TINY", "Become small", Color3.fromRGB(0, 200, 150))
    tinyBtn.MouseButton1Click:Connect(function()
        Humanoid.BodyDepthScale = 0.3
        Humanoid.BodyHeightScale = 0.3
        Humanoid.BodyWidthScale = 0.3
        Humanoid.HeadScale = 0.3
        tinyIcon.Text = "🐭"
        tinyIcon.TextColor3 = Color3.fromRGB(255, 255, 255)
    end)
    
    -- RESET SIZE
    local resetBtn, resetFrame, resetIcon = createVoltButton("RESET SIZE", "Normal size", Color3.fromRGB(255, 100, 100))
    resetBtn.MouseButton1Click:Connect(function()
        Humanoid.BodyDepthScale = 1
        Humanoid.BodyHeightScale = 1
        Humanoid.BodyWidthScale = 1
        Humanoid.HeadScale = 1
        resetIcon.Text = "🔄"
        resetIcon.TextColor3 = Color3.fromRGB(0, 255, 0)
    end)
end

-- ============================================
-- CATEGORY: INFO - HAMZZ MODS CREDITS
-- ============================================
local function loadInfoCategory()
    ContentFrame:ClearAllChildren()
    buttonY = 10
    
    -- HAMZZ MODS TITLE
    local titleBtn, titleFrame, titleIcon = createVoltButton("HAMZZ MODS", "Official Script", Color3.fromRGB(0, 100, 255))
    titleIcon.Text = "🔥"
    titleIcon.TextColor3 = Color3.fromRGB(255, 255, 0)
    
    -- CREDIT INFO
    local creditBtn, creditFrame, creditIcon = createVoltButton("CREATOR", "Nesia Darknet", Color3.fromRGB(50, 150, 200))
    creditIcon.Text = "👑"
    
    -- YOUTUBE CHANNEL
    local ytBtn, ytFrame, ytIcon = createVoltButton("YOUTUBE", "Hamzz Mods Channel", Color3.fromRGB(255, 50, 50))
    ytBtn.MouseButton1Click:Connect(function()
        setclipboard("https://www.youtube.com/@HamzzMods")
        ytIcon.Text = "📋"
        ytIcon.TextColor3 = Color3.fromRGB(0, 255, 0)
    end)
    ytIcon.Text = "▶"
    
    -- GITHUB REPO
    local gitBtn, gitFrame, gitIcon = createVoltButton("GITHUB", "Hamzz Mods Repository", Color3.fromRGB(100, 100, 200))
    gitBtn.MouseButton1Click:Connect(function()
        setclipboard("https://github.com/HamzzMods")
        gitIcon.Text = "📋"
        gitIcon.TextColor3 = Color3.fromRGB(0, 255, 0)
    end)
    gitIcon.Text = "🐙"
    
    -- DISCORD SERVER
    local discBtn, discFrame, discIcon = createVoltButton("DISCORD", "Join Community", Color3.fromRGB(100, 150, 255))
    discBtn.MouseButton1Click:Connect(function()
        setclipboard("https://discord.gg/hamzzmods")
        discIcon.Text = "📋"
        discIcon.TextColor3 = Color3.fromRGB(0, 255, 0)
    end)
    discIcon.Text = "💬"
    
    -- VERSION INFO
    local verBtn, verFrame, verIcon = createVoltButton("VERSION", "Volt Nitro Speed v1.0", Color3.fromRGB(150, 200, 100))
    verIcon.Text = "⚡"
    
    -- FEATURES COUNT
    local featBtn, featFrame, featIcon = createVoltButton("FEATURES", "25+ Working Features", Color3.fromRGB(200, 100, 255))
    featIcon.Text = "✅"
    
    -- SUPPORT
    local supBtn, supFrame, supIcon = createVoltButton("SUPPORT", "Report Issues/Bugs", Color3.fromRGB(255, 150, 50))
    supBtn.MouseButton1Click:Connect(function()
        setclipboard("Contact: HamzzMods@support.com")
        supIcon.Text = "📋"
        supIcon.TextColor3 = Color3.fromRGB(0, 255, 0)
    end)
    supIcon.Text = "🛠️"
end

-- ============================================
-- UPDATE CONTENT FUNCTION
-- ============================================
local function updateVoltContent()
    ContentFrame:ClearAllChildren()
    buttonY = 10
    
    if CurrentCategory == "MAIN" then
        loadMainCategory()
    elseif CurrentCategory == "VISUAL" then
        loadVisualCategory()
    elseif CurrentCategory == "COMBAT" then
        loadCombatCategory()
    elseif CurrentCategory == "TELEPORT" then
        loadTeleportCategory()
    elseif CurrentCategory == "PLAYER" then
        loadPlayerCategory()
    elseif CurrentCategory == "INFO" then
        loadInfoCategory()
    end
    
    ContentFrame.CanvasSize = UDim2.new(0, 0, 0, buttonY + 10)
end

-- INITIAL LOAD
updateVoltTabs()
updateVoltContent()

-- VOLT FOOTER
local Footer = Instance.new("Frame")
Footer.Size = UDim2.new(1, 0, 0, 30)
Footer.Position = UDim2.new(0, 0, 1, -30)
Footer.BackgroundColor3 = Color3.fromRGB(0, 20, 40)
Footer.BorderSizePixel = 0
Footer.Parent = MainFrame

local FooterText = Instance.new("TextLabel")
FooterText.Text = "⚡ VOLT NITRO SPEED | HAMZZ MODS | ULTRA FAST ⚡"
FooterText.Size = UDim2.new(1, 0, 1, 0)
FooterText.BackgroundTransparency = 1
FooterText.TextColor3 = Color3.fromRGB(0, 255, 255)
FooterText.Font = Enum.Font.GothamBold
FooterText.FontSize = Enum.FontSize.Size12
FooterText.Parent = Footer

-- VOLT CONTROLS
local Controls = Instance.new("TextLabel")
Controls.Text = "⚡ TIP: Click INFO tab for credits & links"
Controls.Size = UDim2.new(1, -20, 0, 20)
Controls.Position = UDim2.new(0, 10, 1, -60)
Controls.BackgroundTransparency = 1
Controls.TextColor3 = Color3.fromRGB(255, 200, 100)
Controls.Font = Enum.Font.Gotham
Controls.FontSize = Enum.FontSize.Size12
Controls.Parent = MainFrame

-- VOLT MINIMIZE
local MinimizeBtn = Instance.new("TextButton")
MinimizeBtn.Text = "─"
MinimizeBtn.Size = UDim2.new(0, 35, 0, 35)
MinimizeBtn.Position = UDim2.new(1, -40, 0, 10)
MinimizeBtn.BackgroundColor3 = Color3.fromRGB(0, 50, 100)
MinimizeBtn.TextColor3 = Color3.fromRGB(0, 255, 255)
MinimizeBtn.Font = Enum.Font.GothamBlack
MinimizeBtn.FontSize = Enum.FontSize.Size20
MinimizeBtn.Parent = Header

local minimized = false
MinimizeBtn.MouseButton1Click:Connect(function()
    minimized = not minimized
    if minimized then
        MainFrame.Size = UDim2.new(0, 380, 0, 110)
        MinimizeBtn.Text = "+"
    else
        MainFrame.Size = UDim2.new(0, 380, 0, 500)
        MinimizeBtn.Text = "─"
    end
end)

-- VOLT DRAGGABLE
local dragging = false
local dragStart, startPos

MainFrame.InputBegan:Connect(function(input)
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

MainFrame.InputEnded:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 then
        dragging = false
    end
end)

-- VOLT ANTI-AFK
if voltFeatures.antiAfk then
    game:GetService("Players").LocalPlayer.Idled:Connect(function()
        game:GetService("VirtualUser"):Button2Down(Vector2.new(0,0), workspace.CurrentCamera.CFrame)
        wait(1)
        game:GetService("VirtualUser"):Button2Up(Vector2.new(0,0), workspace.CurrentCamera.CFrame)
    end)
end

-- VOLT WELCOME NOTIFICATION
spawn(function()
    wait(0.1)
    local welcome = Instance.new("TextLabel")
    welcome.Text = "⚡ VOLT NITRO SPEED LOADED IN " .. string.format("%.3f", tick() - StartTime) .. "s ⚡"
    welcome.Size = UDim2.new(0, 450, 0, 40)
    welcome.Position = UDim2.new(0.5, -225, 0, -40)
    welcome.BackgroundColor3 = Color3.fromRGB(0, 50, 100)
    welcome.TextColor3 = Color3.fromRGB(0, 255, 255)
    welcome.Font = Enum.Font.GothamBlack
    welcome.FontSize = Enum.FontSize.Size18
    welcome.TextStrokeTransparency = 0.3
    welcome.TextStrokeColor3 = Color3.fromRGB(0, 0, 50)
    welcome.Parent = VoltUI
    
    game:GetService("TweenService"):Create(
        welcome,
        TweenInfo.new(0.3, Enum.EasingStyle.Back, Enum.EasingDirection.Out),
        {Position = UDim2.new(0.5, -225, 0, 10)}
    ):Play()
    
    wait(2)
    
    game:GetService("TweenService"):Create(
        welcome,
        TweenInfo.new(0.3, Enum.EasingStyle.Back, Enum.EasingDirection.In),
        {Position = UDim2.new(0.5, -225, 0, -50)}
    ):Play()
    
    wait(0.3)
    welcome:Destroy()
end)

-- UPDATE LOAD TIME DISPLAY
spawn(function()
    while true do
        wait(1)
        LoadTime.Text = "UPTIME: " .. string.format("%.1f", tick() - StartTime) .. "s"
    end
end)

print("⚡========================================⚡")
print("⚡ HAMZZ MODS - VOLT NITRO SPEED EDITION ⚡")
print("⚡ Load Time: " .. string.format("%.3f", tick() - StartTime) .. " seconds")
print("⚡ Theme: Volt Nitro Speed (Ultra Fast)")
print("⚡ Categories: MAIN, VISUAL, COMBAT, TELEPORT, PLAYER, INFO")
print("⚡========================================⚡")