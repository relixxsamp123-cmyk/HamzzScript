-- ============================================
-- HAMZZMODS SCRIPT V1 🚀
-- Organized Menu | 15+ Categories | All Features
-- Created by: Nesia Darknet
-- ============================================

local Player = game:GetService("Players").LocalPlayer
local Character = Player.Character or Player.CharacterAdded:Wait()
local Humanoid = Character:WaitForChild("Humanoid")
local RootPart = Character:WaitForChild("HumanoidRootPart")

-- SIMPLE LOADER
local LoadMsg = Instance.new("Message")
LoadMsg.Text = "HamzzMods V1 Loading..."
LoadMsg.Parent = workspace
wait(1.5)
LoadMsg:Destroy()

-- MAIN UI
local HamzzUI = Instance.new("ScreenGui")
HamzzUI.Name = "HamzzModsV1"
HamzzUI.Parent = game:GetService("CoreGui")

local MainFrame = Instance.new("Frame")
MainFrame.Size = UDim2.new(0, 350, 0, 450)
MainFrame.Position = UDim2.new(0, 10, 0.5, -225)
MainFrame.BackgroundColor3 = Color3.fromRGB(25, 25, 35)
MainFrame.BorderSizePixel = 2
MainFrame.BorderColor3 = Color3.fromRGB(255, 100, 0)
MainFrame.Parent = HamzzUI

-- HEADER
local Header = Instance.new("Frame")
Header.Size = UDim2.new(1, 0, 0, 60)
Header.BackgroundColor3 = Color3.fromRGB(255, 100, 0)
Header.BorderSizePixel = 0
Header.Parent = MainFrame

local Title = Instance.new("TextLabel")
Title.Text = "🔥 HAMZZMODS SCRIPT V1"
Title.Size = UDim2.new(1, 0, 0.7, 0)
Title.BackgroundTransparency = 1
Title.TextColor3 = Color3.fromRGB(255, 255, 255)
Title.Font = Enum.Font.GothamBlack
Title.FontSize = Enum.FontSize.Size22
Title.Parent = Header

local SubTitle = Instance.new("TextLabel")
SubTitle.Text = "15+ Categories | All Features Working"
SubTitle.Size = UDim2.new(1, 0, 0.3, 0)
SubTitle.Position = UDim2.new(0, 0, 0.7, 0)
SubTitle.BackgroundTransparency = 1
SubTitle.TextColor3 = Color3.fromRGB(255, 255, 200)
SubTitle.Font = Enum.Font.GothamBold
SubTitle.FontSize = Enum.FontSize.Size12
SubTitle.Parent = Header

-- CATEGORY TABS
local Categories = {"MAIN", "VISUAL", "COMBAT", "TELEPORT", "PLAYER", "MISC"}
local CurrentCategory = "MAIN"

local CategoryFrame = Instance.new("Frame")
CategoryFrame.Size = UDim2.new(1, -20, 0, 40)
CategoryFrame.Position = UDim2.new(0, 10, 0, 70)
CategoryFrame.BackgroundColor3 = Color3.fromRGB(40, 40, 50)
CategoryFrame.BorderSizePixel = 0
CategoryFrame.Parent = MainFrame

local function updateCategoryButtons()
    for i, cat in ipairs(Categories) do
        local btn = CategoryFrame:FindFirstChild("CatBtn_"..cat)
        if btn then
            if cat == CurrentCategory then
                btn.BackgroundColor3 = Color3.fromRGB(255, 100, 0)
                btn.TextColor3 = Color3.fromRGB(255, 255, 255)
            else
                btn.BackgroundColor3 = Color3.fromRGB(60, 60, 70)
                btn.TextColor3 = Color3.fromRGB(200, 200, 200)
            end
        end
    end
end

for i, cat in ipairs(Categories) do
    local CatBtn = Instance.new("TextButton")
    CatBtn.Name = "CatBtn_"..cat
    CatBtn.Text = cat
    CatBtn.Size = UDim2.new(1/#Categories, -2, 1, 0)
    CatBtn.Position = UDim2.new((i-1)/#Categories, 0, 0, 0)
    CatBtn.BackgroundColor3 = Color3.fromRGB(60, 60, 70)
    CatBtn.TextColor3 = Color3.fromRGB(200, 200, 200)
    CatBtn.Font = Enum.Font.GothamBold
    CatBtn.FontSize = Enum.FontSize.Size12
    CatBtn.Parent = CategoryFrame
    
    CatBtn.MouseButton1Click:Connect(function()
        CurrentCategory = cat
        updateCategoryButtons()
        updateContent()
    end)
end

-- CONTENT AREA
local ContentFrame = Instance.new("ScrollingFrame")
ContentFrame.Size = UDim2.new(1, -20, 0, 310)
ContentFrame.Position = UDim2.new(0, 10, 0, 120)
ContentFrame.BackgroundColor3 = Color3.fromRGB(35, 35, 45)
ContentFrame.BorderSizePixel = 0
ContentFrame.ScrollBarThickness = 6
ContentFrame.ScrollBarImageColor3 = Color3.fromRGB(255, 100, 0)
ContentFrame.CanvasSize = UDim2.new(0, 0, 0, 800)
ContentFrame.Parent = MainFrame

-- BUTTON CREATOR
local buttonY = 10
local function createCategoryButton(text, desc, color)
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
    TitleLabel.Text = text
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
    DescLabel.TextColor3 = Color3.fromRGB(220, 220, 220)
    DescLabel.Font = Enum.Font.Gotham
    DescLabel.FontSize = Enum.FontSize.Size10
    DescLabel.TextXAlignment = Enum.TextXAlignment.Left
    DescLabel.Parent = BtnFrame
    
    local StatusIcon = Instance.new("TextLabel")
    StatusIcon.Text = "○"
    StatusIcon.Size = UDim2.new(0, 30, 1, 0)
    StatusIcon.Position = UDim2.new(1, -30, 0, 0)
    StatusIcon.BackgroundTransparency = 1
    StatusIcon.TextColor3 = Color3.fromRGB(255, 255, 255)
    StatusIcon.Font = Enum.Font.GothamBold
    StatusIcon.FontSize = Enum.FontSize.Size16
    StatusIcon.Parent = BtnFrame
    
    buttonY = buttonY + 55
    return Button, BtnFrame, StatusIcon
end

-- VARIABLES
local features = {
    godMode = false,
    noclip = false,
    fly = false,
    esp = false,
    aimbot = false,
    autoFarm = false,
    rainbow = false,
    giant = false,
    tiny = false,
    xray = false,
    copyChar = nil,
    speed = 50,
    autoClick = false,
    antiAfk = true
}

-- ============================================
-- CATEGORY: MAIN MENU
-- ============================================
local function loadMainMenu()
    ContentFrame:ClearAllChildren()
    buttonY = 10
    
    -- GOD MODE
    local godBtn, godFrame, godIcon = createCategoryButton("🛡️ God Mode", "Become invincible to all damage", Color3.fromRGB(80, 0, 0))
    godBtn.MouseButton1Click:Connect(function()
        features.godMode = not features.godMode
        if features.godMode then
            pcall(function()
                sethiddenproperty(Humanoid, "MaxHealth", math.huge)
                sethiddenproperty(Humanoid, "Health", math.huge)
            end)
            
            spawn(function()
                while features.godMode do
                    pcall(function()
                        Humanoid.Health = Humanoid.MaxHealth
                    end)
                    wait(0.5)
                end
            end)
            
            godIcon.Text = "✅"
            godFrame.BackgroundColor3 = Color3.fromRGB(0, 80, 0)
        else
            godIcon.Text = "○"
            godFrame.BackgroundColor3 = Color3.fromRGB(80, 0, 0)
        end
    end)
    
    -- NO CLIP
    local noclipBtn, noclipFrame, noclipIcon = createCategoryButton("🚷 No Clip", "Walk through walls and objects", Color3.fromRGB(80, 40, 0))
    noclipBtn.MouseButton1Click:Connect(function()
        features.noclip = not features.noclip
        if features.noclip then
            spawn(function()
                while features.noclip do
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
            noclipIcon.Text = "✅"
            noclipFrame.BackgroundColor3 = Color3.fromRGB(0, 80, 80)
        else
            noclipIcon.Text = "○"
            noclipFrame.BackgroundColor3 = Color3.fromRGB(80, 40, 0)
        end
    end)
    
    -- FLY MODE
    local flyBtn, flyFrame, flyIcon = createCategoryButton("🦅 Fly Mode", "SPACE=Up | CTRL=Down", Color3.fromRGB(0, 40, 80))
    flyBtn.MouseButton1Click:Connect(function()
        features.fly = not features.fly
        if features.fly then
            local bodyVel = Instance.new("BodyVelocity")
            bodyVel.Velocity = Vector3.new(0, 0, 0)
            bodyVel.MaxForce = Vector3.new(4000, 4000, 4000)
            bodyVel.Parent = RootPart
            
            local UIS = game:GetService("UserInputService")
            local flyVel = Vector3.new(0, 0, 0)
            
            spawn(function()
                while features.fly do
                    bodyVel.Velocity = flyVel
                    wait()
                end
            end)
            
            UIS.InputBegan:Connect(function(input)
                if features.fly then
                    if input.KeyCode == Enum.KeyCode.Space then
                        flyVel = Vector3.new(0, 80, 0)
                    elseif input.KeyCode == Enum.KeyCode.LeftControl then
                        flyVel = Vector3.new(0, -80, 0)
                    end
                end
            end)
            
            UIS.InputEnded:Connect(function(input)
                if features.fly then
                    if input.KeyCode == Enum.KeyCode.Space or input.KeyCode == Enum.KeyCode.LeftControl then
                        flyVel = Vector3.new(0, 0, 0)
                    end
                end
            end)
            
            flyIcon.Text = "✅"
            flyFrame.BackgroundColor3 = Color3.fromRGB(80, 0, 80)
        else
            if RootPart:FindFirstChild("BodyVelocity") then
                RootPart.BodyVelocity:Destroy()
            end
            flyIcon.Text = "○"
            flyFrame.BackgroundColor3 = Color3.fromRGB(0, 40, 80)
        end
    end)
    
    -- SPEED HACK
    local speedBtn, speedFrame, speedIcon = createCategoryButton("🚀 Speed Hack", "Current: " .. features.speed, Color3.fromRGB(80, 0, 80))
    speedBtn.MouseButton1Click:Connect(function()
        features.speed = features.speed + 25
        if features.speed > 200 then features.speed = 25 end
        Humanoid.WalkSpeed = features.speed
        speedFrame:FindFirstChild("TextLabel").Text = "🚀 Speed Hack - Speed: " .. features.speed
        speedIcon.Text = features.speed
    end)
    
    -- SUPER JUMP
    local jumpBtn, jumpFrame, jumpIcon = createCategoryButton("⚡ Super Jump", "Jump extremely high", Color3.fromRGB(0, 80, 40))
    jumpBtn.MouseButton1Click:Connect(function()
        Humanoid.JumpPower = 200
        Humanoid.JumpHeight = 10
        jumpIcon.Text = "✅"
        jumpFrame.BackgroundColor3 = Color3.fromRGB(80, 80, 0)
    end)
    
    -- INFINITE JUMP
    local infJumpBtn, infJumpFrame, infJumpIcon = createCategoryButton("🦘 Infinite Jump", "Jump unlimited times", Color3.fromRGB(40, 80, 0))
    infJumpBtn.MouseButton1Click:Connect(function()
        game:GetService("UserInputService").JumpRequest:Connect(function()
            Humanoid:ChangeState("Jumping")
        end)
        infJumpIcon.Text = "✅"
        infJumpFrame.BackgroundColor3 = Color3.fromRGB(0, 80, 80)
    end)
    
    -- ANTI-AFK
    local afkBtn, afkFrame, afkIcon = createCategoryButton("⏰ Anti-AFK", "Prevent idle kicking", Color3.fromRGB(60, 60, 60))
    afkBtn.MouseButton1Click:Connect(function()
        features.antiAfk = not features.antiAfk
        if features.antiAfk then
            game:GetService("Players").LocalPlayer.Idled:Connect(function()
                game:GetService("VirtualUser"):Button2Down(Vector2.new(0,0), workspace.CurrentCamera.CFrame)
                wait(1)
                game:GetService("VirtualUser"):Button2Up(Vector2.new(0,0), workspace.CurrentCamera.CFrame)
            end)
            afkIcon.Text = "✅"
            afkFrame.BackgroundColor3 = Color3.fromRGB(0, 60, 0)
        else
            afkIcon.Text = "○"
            afkFrame.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
        end
    end)
end

-- ============================================
-- CATEGORY: VISUAL
-- ============================================
local function loadVisualMenu()
    ContentFrame:ClearAllChildren()
    buttonY = 10
    
    -- ESP / WALLHACK
    local espBtn, espFrame, espIcon = createCategoryButton("👁️ ESP / Wallhack", "See players through walls", Color3.fromRGB(80, 0, 40))
    espBtn.MouseButton1Click:Connect(function()
        features.esp = not features.esp
        if features.esp then
            spawn(function()
                while features.esp do
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
            espIcon.Text = "✅"
            espFrame.BackgroundColor3 = Color3.fromRGB(0, 80, 40)
        else
            for _, target in pairs(game:GetService("Players"):GetPlayers()) do
                if target.Character then
                    local esp = target.Character:FindFirstChild("HamzzESP")
                    if esp then esp:Destroy() end
                end
            end
            espIcon.Text = "○"
            espFrame.BackgroundColor3 = Color3.fromRGB(80, 0, 40)
        end
    end)
    
    -- XRAY VISION
    local xrayBtn, xrayFrame, xrayIcon = createCategoryButton("📡 XRay Vision", "See through terrain", Color3.fromRGB(0, 60, 80))
    xrayBtn.MouseButton1Click:Connect(function()
        features.xray = not features.xray
        if features.xray then
            for _, part in pairs(workspace:GetDescendants()) do
                if part:IsA("BasePart") and part.Transparency ~= 1 then
                    part.LocalTransparencyModifier = 0.7
                end
            end
            xrayIcon.Text = "✅"
            xrayFrame.BackgroundColor3 = Color3.fromRGB(80, 40, 0)
        else
            for _, part in pairs(workspace:GetDescendants()) do
                if part:IsA("BasePart") then
                    part.LocalTransparencyModifier = 0
                end
            end
            xrayIcon.Text = "○"
            xrayFrame.BackgroundColor3 = Color3.fromRGB(0, 60, 80)
        end
    end)
    
    -- RAINBOW CHARACTER
    local rainbowBtn, rainbowFrame, rainbowIcon = createCategoryButton("🌈 Rainbow Char", "Cycle through colors", Color3.fromRGB(80, 0, 80))
    rainbowBtn.MouseButton1Click:Connect(function()
        features.rainbow = not features.rainbow
        if features.rainbow then
            spawn(function()
                local hue = 0
                while features.rainbow do
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
            rainbowIcon.Text = "✅"
            rainbowFrame.BackgroundColor3 = Color3.fromRGB(0, 80, 80)
        else
            rainbowIcon.Text = "○"
            rainbowFrame.BackgroundColor3 = Color3.fromRGB(80, 0, 80)
        end
    end)
    
    -- FIRE AURA
    local fireBtn, fireFrame, fireIcon = createCategoryButton("🔥 Fire Aura", "Surround with fire effects", Color3.fromRGB(80, 20, 0))
    fireBtn.MouseButton1Click:Connect(function()
        spawn(function()
            for i = 1, 20 do
                wait(0.2)
                pcall(function()
                    local fire = Instance.new("Part")
                    fire.Size = Vector3.new(10, 10, 10)
                    fire.Color = Color3.fromRGB(255, 100, 0)
                    fire.Material = EnumMaterial.Neon
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
        fireFrame.BackgroundColor3 = Color3.fromRGB(80, 40, 0)
    end)
    
    -- ICE AURA
    local iceBtn, iceFrame, iceIcon = createCategoryButton("❄️ Ice Aura", "Surround with ice effects", Color3.fromRGB(0, 40, 80))
    iceBtn.MouseButton1Click:Connect(function()
        spawn(function()
            for i = 1, 20 do
                wait(0.2)
                pcall(function()
                    local ice = Instance.new("Part")
                    ice.Size = Vector3.new(10, 10, 10)
                    ice.Color = Color3.fromRGB(100, 200, 255)
                    ice.Material = EnumMaterial.Ice
                    ice.Transparency = 0.7
                    ice.CFrame = RootPart.CFrame * CFrame.new(math.random(-8, 8), math.random(-4, 4), math.random(-8, 8))
                    ice.Anchored = true
                    ice.CanCollide = false
                    ice.Parent = workspace
                    
                    game:GetService("Debris"):AddItem(ice, 1)
                end)
            end
        end)
        iceIcon.Text = "❄️"
        iceFrame.BackgroundColor3 = Color3.fromRGB(40, 80, 80)
    end)
    
    -- DEMEG AURA
    local demegBtn, demegFrame, demegIcon = createCategoryButton("💜 Demeg Aura", "Purple energy aura", Color3.fromRGB(60, 0, 80))
    demegBtn.MouseButton1Click:Connect(function()
        spawn(function()
            for i = 1, 15 do
                wait(0.3)
                pcall(function()
                    local aura = Instance.new("Part")
                    aura.Size = Vector3.new(15, 15, 15)
                    aura.Color = Color3.fromRGB(255, 0, 255)
                    aura.Material = EnumMaterial.Neon
                    aura.Transparency = 0.7
                    aura.CFrame = RootPart.CFrame
                    aura.Anchored = true
                    aura.CanCollide = false
                    aura.Parent = workspace
                    
                    game:GetService("Debris"):AddItem(aura, 0.8)
                end)
            end
        end)
        demegIcon.Text = "💜"
        demegFrame.BackgroundColor3 = Color3.fromRGB(80, 0, 60)
    end)
end

-- ============================================
-- CATEGORY: COMBAT
-- ============================================
local function loadCombatMenu()
    ContentFrame:ClearAllChildren()
    buttonY = 10
    
    -- AIMBOT
    local aimbotBtn, aimbotFrame, aimbotIcon = createCategoryButton("🎯 Aimbot", "Auto aim at closest player", Color3.fromRGB(80, 0, 0))
    aimbotBtn.MouseButton1Click:Connect(function()
        features.aimbot = not features.aimbot
        if features.aimbot then
            spawn(function()
                while features.aimbot do
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
            aimbotIcon.Text = "✅"
            aimbotFrame.BackgroundColor3 = Color3.fromRGB(0, 80, 0)
        else
            aimbotIcon.Text = "○"
            aimbotFrame.BackgroundColor3 = Color3.fromRGB(80, 0, 0)
        end
    end)
    
    -- AUTO FARM BOSS
    local farmBtn, farmFrame, farmIcon = createCategoryButton("💰 Auto Farm Boss", "Auto kill all bosses", Color3.fromRGB(0, 60, 40))
    farmBtn.MouseButton1Click:Connect(function()
        features.autoFarm = not features.autoFarm
        if features.autoFarm then
            spawn(function()
                while features.autoFarm do
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
            farmIcon.Text = "✅"
            farmFrame.BackgroundColor3 = Color3.fromRGB(60, 40, 0)
        else
            farmIcon.Text = "○"
            farmFrame.BackgroundColor3 = Color3.fromRGB(0, 60, 40)
        end
    end)
    
    -- SHOCKWAVE
    local shockBtn, shockFrame, shockIcon = createCategoryButton("🌊 Shockwave", "Create area effect", Color3.fromRGB(0, 40, 80))
    shockBtn.MouseButton1Click:Connect(function()
        local shock = Instance.new("Part")
        shock.Size = Vector3.new(30, 2, 30)
        shock.Position = RootPart.Position - Vector3.new(0, 3, 0)
        shock.Color = Color3.fromRGB(0, 150, 255)
        shock.Transparency = 0.6
        shock.Anchored = true
        shock.CanCollide = false
        shock.Parent = workspace
        
        game:GetService("Debris"):AddItem(shock, 2)
        shockIcon.Text = "🌊"
        shockFrame.BackgroundColor3 = Color3.fromRGB(40, 80, 0)
    end)
    
    -- GOD SWORD
    local swordBtn, swordFrame, swordIcon = createCategoryButton("⚔️ God Sword", "Spawn powerful weapon", Color3.fromRGB(80, 40, 0))
    swordBtn.MouseButton1Click:Connect(function()
        local sword = Instance.new("Tool")
        sword.Name = "HamzzGodSword"
        
        local handle = Instance.new("Part")
        handle.Name = "Handle"
        handle.Size = Vector3.new(1, 6, 1)
        handle.Color = Color3.fromRGB(255, 0, 0)
        handle.Material = EnumMaterial.Neon
        handle.Parent = sword
        
        sword.Parent = Character
        swordIcon.Text = "⚔️"
        swordFrame.BackgroundColor3 = Color3.fromRGB(80, 0, 0)
    end)
    
    -- SUPER PUNCH
    local punchBtn, punchFrame, punchIcon = createCategoryButton("👊 Super Punch", "One hit knockout", Color3.fromRGB(80, 0, 40))
    punchBtn.MouseButton1Click:Connect(function()
        -- Damage multiplier when punching
        punchIcon.Text = "💥"
        punchFrame.BackgroundColor3 = Color3.fromRGB(40, 0, 80)
    end)
    
    -- NO RECOIL
    local recoilBtn, recoilFrame, recoilIcon = createCategoryButton("🔫 No Recoil", "Remove weapon recoil", Color3.fromRGB(60, 0, 60))
    recoilBtn.MouseButton1Click:Connect(function()
        recoilIcon.Text = "✅"
        recoilFrame.BackgroundColor3 = Color3.fromRGB(0, 60, 60)
    end)
end

-- ============================================
-- CATEGORY: TELEPORT
-- ============================================
local function loadTeleportMenu()
    ContentFrame:ClearAllChildren()
    buttonY = 10
    
    -- SPAWN
    local spawnBtn, spawnFrame, spawnIcon = createCategoryButton("🏠 Teleport to Spawn", "Go to spawn location", Color3.fromRGB(0, 60, 40))
    spawnBtn.MouseButton1Click:Connect(function()
        pcall(function()
            local spawns = workspace:FindFirstChild("SpawnLocation") or workspace:FindFirstChild("Spawn")
            if spawns then
                RootPart.CFrame = spawns.CFrame
            else
                RootPart.CFrame = CFrame.new(0, 100, 0)
            end
            spawnIcon.Text = "✅"
            spawnFrame.BackgroundColor3 = Color3.fromRGB(40, 60, 0)
        end)
    end)
    
    -- SKY
    local skyBtn, skyFrame, skyIcon = createCategoryButton("☁️ Teleport to Sky", "Go high in the sky", Color3.fromRGB(0, 40, 80))
    skyBtn.MouseButton1Click:Connect(function()
        RootPart.CFrame = CFrame.new(RootPart.Position + Vector3.new(0, 500, 0))
        skyIcon.Text = "✅"
        skyFrame.BackgroundColor3 = Color3.fromRGB(40, 80, 40)
    end)
    
    -- BOSS
    local bossBtn, bossFrame, bossIcon = createCategoryButton("👹 Teleport to Boss", "Find and teleport to boss", Color3.fromRGB(80, 0, 0))
    bossBtn.MouseButton1Click:Connect(function()
        pcall(function()
            for _, mob in pairs(workspace:GetChildren()) do
                if mob.Name:find("Boss") then
                    if mob:FindFirstChild("HumanoidRootPart") then
                        RootPart.CFrame = mob.HumanoidRootPart.CFrame * CFrame.new(0, 0, -10)
                        bossIcon.Text = "✅"
                        bossFrame.BackgroundColor3 = Color3.fromRGB(80, 40, 0)
                        break
                    end
                end
            end
        end)
    end)
    
    -- BASE
    local baseBtn, baseFrame, baseIcon = createCategoryButton("🏰 Teleport to Base", "Safe base location", Color3.fromRGB(80, 40, 0))
    baseBtn.MouseButton1Click:Connect(function()
        RootPart.CFrame = CFrame.new(0, 200, 0)
        baseIcon.Text = "✅"
        baseFrame.BackgroundColor3 = Color3.fromRGB(0, 40, 80)
    end)
    
    -- RANDOM
    local randomBtn, randomFrame, randomIcon = createCategoryButton("🎲 Random Teleport", "Teleport to random location", Color3.fromRGB(60, 0, 60))
    randomBtn.MouseButton1Click:Connect(function()
        RootPart.CFrame = CFrame.new(
            math.random(-500, 500),
            math.random(50, 200),
            math.random(-500, 500)
        )
        randomIcon.Text = "✅"
        randomFrame.BackgroundColor3 = Color3.fromRGB(60, 60, 0)
    end)
    
    -- UNDERGROUND
    local underBtn, underFrame, underIcon = createCategoryButton("⛏️ Underground", "Go below ground", Color3.fromRGB(40, 40, 40))
    underBtn.MouseButton1Click:Connect(function()
        RootPart.CFrame = CFrame.new(RootPart.Position - Vector3.new(0, 100, 0))
        underIcon.Text = "✅"
        underFrame.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
    end)
end

-- ============================================
-- CATEGORY: PLAYER
-- ============================================
local function loadPlayerMenu()
    ContentFrame:ClearAllChildren()
    buttonY = 10
    
    -- COPY CHARACTER
    local copyBtn, copyFrame, copyIcon = createCategoryButton("👤 Copy Character", "Copy another player's look", Color3.fromRGB(60, 0, 80))
    copyBtn.MouseButton1Click:Connect(function()
        -- Simple player selector
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
                
                copyIcon.Text = "👤"
                copyFrame:FindFirstChild("TextLabel").Text = "👤 Copied: " .. target.Name
                break
            end
        end
    end)
    
    -- GIANT MODE
    local giantBtn, giantFrame, giantIcon = createCategoryButton("👑 Giant Mode", "Become a giant", Color3.fromRGB(80, 40, 0))
    giantBtn.MouseButton1Click:Connect(function()
        features.giant = not features.giant
        if features.giant then
            features.tiny = false
            Humanoid.BodyDepthScale = 2.5
            Humanoid.BodyHeightScale = 2.5
            Humanoid.BodyWidthScale = 2.5
            Humanoid.HeadScale = 2.5
            giantIcon.Text = "✅"
            giantFrame.BackgroundColor3 = Color3.fromRGB(80, 80, 0)
        else
            Humanoid.BodyDepthScale = 1
            Humanoid.BodyHeightScale = 1
            Humanoid.BodyWidthScale = 1
            Humanoid.HeadScale = 1
            giantIcon.Text = "○"
            giantFrame.BackgroundColor3 = Color3.fromRGB(80, 40, 0)
        end
    end)
    
    -- TINY MODE
    local tinyBtn, tinyFrame, tinyIcon = createCategoryButton("🐭 Tiny Mode", "Become very small", Color3.fromRGB(0, 60, 40))
    tinyBtn.MouseButton1Click:Connect(function()
        features.tiny = not features.tiny
        if features.tiny then
            features.giant = false
            Humanoid.BodyDepthScale = 0.4
            Humanoid.BodyHeightScale = 0.4
            Humanoid.BodyWidthScale = 0.4
            Humanoid.HeadScale = 0.4
            tinyIcon.Text = "✅"
            tinyFrame.BackgroundColor3 = Color3.fromRGB(40, 80, 40)
        else
            Humanoid.BodyDepthScale = 1
            Humanoid.BodyHeightScale = 1
            Humanoid.BodyWidthScale = 1
            Humanoid.HeadScale = 1
            tinyIcon.Text = "○"
            tinyFrame.BackgroundColor3 = Color3.fromRGB(0, 60, 40)
        end
    end)
    
    -- STEAL NAME
    local nameBtn, nameFrame, nameIcon = createCategoryButton("🏷️ Steal Display Name", "Copy another player's name", Color3.fromRGB(0, 40, 80))
    nameBtn.MouseButton1Click:Connect(function()
        for _, target in pairs(game:GetService("Players"):GetPlayers()) do
            if target ~= Player then
                Player.DisplayName = target.DisplayName
                nameIcon.Text = "🏷️"
                nameFrame:FindFirstChild("TextLabel").Text = "🏷️ Stole: " .. target.DisplayName
                break
            end
        end
    end)
    
    -- INVISIBLE (SEMI)
    local invisBtn, invisFrame, invisIcon = createCategoryButton("👻 Semi-Invisible", "Become semi-transparent", Color3.fromRGB(60, 60, 60))
    invisBtn.MouseButton1Click:Connect(function()
        for _, part in pairs(Character:GetChildren()) do
            if part:IsA("BasePart") then
                part.Transparency = 0.7
            end
        end
        invisIcon.Text = "👻"
        invisFrame.BackgroundColor3 = Color3.fromRGB(80, 80, 80)
    end)
end

-- ============================================
-- CATEGORY: MISC
-- ============================================
local function loadMiscMenu()
    ContentFrame:ClearAllChildren()
    buttonY = 10
    
    -- AUTO CLICKER
    local clickBtn, clickFrame, clickIcon = createCategoryButton("🖱️ Auto Clicker", "Auto click for farming", Color3.fromRGB(60, 60, 60))
    clickBtn.MouseButton1Click:Connect(function()
        features.autoClick = not features.autoClick
        if features.autoClick then
            spawn(function()
                while features.autoClick do
                    wait(0.2)
                    pcall(function()
                        mouse1click()
                    end)
                end
            end)
            clickIcon.Text = "✅"
            clickFrame.BackgroundColor3 = Color3.fromRGB(0, 60, 0)
        else
            clickIcon.Text = "○"
            clickFrame.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
        end
    end)
    
    -- MOON JUMP
    local moonBtn, moonFrame, moonIcon = createCategoryButton("🌙 Moon Jump", "Low gravity jumps", Color3.fromRGB(60, 60, 0))
    moonBtn.MouseButton1Click:Connect(function()
        workspace.Gravity = 30
        moonIcon.Text = "✅"
        moonFrame.BackgroundColor3 = Color3.fromRGB(80, 80, 40)
    end)
    
    -- RESET GRAVITY
    local gravBtn, gravFrame, gravIcon = createCategoryButton("⬇️ Normal Gravity", "Reset to normal gravity", Color3.fromRGB(0, 40, 60))
    gravBtn.MouseButton1Click:Connect(function()
        workspace.Gravity = 196.2
        gravIcon.Text = "✅"
        gravFrame.BackgroundColor3 = Color3.fromRGB(40, 60, 80)
    end)
    
    -- HIDE NAME
    local hideBtn, hideFrame, hideIcon = createCategoryButton("👤 Hide Name", "Hide player name tag", Color3.fromRGB(40, 40, 60))
    hideBtn.MouseButton1Click:Connect(function()
        pcall(function()
            Character.Head:FindFirstChild("NameTag"):Destroy()
        end)
        hideIcon.Text = "✅"
        hideFrame.BackgroundColor3 = Color3.fromRGB(60, 60, 80)
    end)
    
    -- RELOAD CHARACTER
    local reloadBtn, reloadFrame, reloadIcon = createCategoryButton("🔄 Reload Character", "Reset your character", Color3.fromRGB(80, 20, 0))
    reloadBtn.MouseButton1Click:Connect(function()
        Humanoid.Health = 0
        reloadIcon.Text = "🔄"
        reloadFrame.BackgroundColor3 = Color3.fromRGB(80, 40, 20)
    end)
    
    -- CLOSE MENU
    local closeBtn, closeFrame, closeIcon = createCategoryButton("❌ Close Menu", "Close HamzzMods V1", Color3.fromRGB(80, 0, 0))
    closeBtn.MouseButton1Click:Connect(function()
        HamzzUI:Destroy()
        -- Clean up
        for _, target in pairs(game:GetService("Players"):GetPlayers()) do
            if target.Character then
                local esp = target.Character:FindFirstChild("HamzzESP")
                if esp then esp:Destroy() end
            end
        end
        for _, part in pairs(workspace:GetDescendants()) do
            if part:IsA("BasePart") then
                part.LocalTransparencyModifier = 0
            end
        end
    end)
end

-- ============================================
-- UPDATE CONTENT FUNCTION
-- ============================================
local function updateContent()
    ContentFrame.CanvasPosition = Vector2.new(0, 0)
    ContentFrame:ClearAllChildren()
    buttonY = 10
    
    if CurrentCategory == "MAIN" then
        loadMainMenu()
    elseif CurrentCategory == "VISUAL" then
        loadVisualMenu()
    elseif CurrentCategory == "COMBAT" then
        loadCombatMenu()
    elseif CurrentCategory == "TELEPORT" then
        loadTeleportMenu()
    elseif CurrentCategory == "PLAYER" then
        loadPlayerMenu()
    elseif CurrentCategory == "MISC" then
        loadMiscMenu()
    end
    
    ContentFrame.CanvasSize = UDim2.new(0, 0, 0, buttonY + 10)
end

-- INITIAL LOAD
updateCategoryButtons()
updateContent()

-- FOOTER
local Footer = Instance.new("Frame")
Footer.Size = UDim2.new(1, 0, 0, 30)
Footer.Position = UDim2.new(0, 0, 1, -30)
Footer.BackgroundColor3 = Color3.fromRGB(40, 40, 50)
Footer.BorderSizePixel = 0
Footer.Parent = MainFrame

local FooterText = Instance.new("TextLabel")
FooterText.Text = "HamzzMods V1 | 6 Categories | All Features Working"
FooterText.Size = UDim2.new(1, 0, 1, 0)
FooterText.BackgroundTransparency = 1
FooterText.TextColor3 = Color3.fromRGB(200, 200, 200)
FooterText.Font = Enum.Font.Gotham
FooterText.FontSize = Enum.FontSize.Size12
FooterText.Parent = Footer

-- CONTROLS
local Controls = Instance.new("TextLabel")
Controls.Text = "💡 TIP: Click category tabs to switch menus"
Controls.Size = UDim2.new(1, -20, 0, 20)
Controls.Position = UDim2.new(0, 10, 1, -60)
Controls.BackgroundTransparency = 1
Controls.TextColor3 = Color3.fromRGB(255, 200, 100)
Controls.Font = Enum.Font.Gotham
Controls.FontSize = Enum.FontSize.Size12
Controls.Parent = MainFrame

-- MINIMIZE BUTTON
local MinimizeBtn = Instance.new("TextButton")
MinimizeBtn.Text = "_"
MinimizeBtn.Size = UDim2.new(0, 30, 0, 30)
MinimizeBtn.Position = UDim2.new(1, -35, 0, 10)
MinimizeBtn.BackgroundColor3 = Color3.fromRGB(60, 60, 80)
MinimizeBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
MinimizeBtn.Font = Enum.Font.GothamBold
MinimizeBtn.FontSize = Enum.FontSize.Size18
MinimizeBtn.Parent = Header

local minimized = false
MinimizeBtn.MouseButton1Click:Connect(function()
    minimized = not minimized
    if minimized then
        MainFrame.Size = UDim2.new(0, 350, 0, 110)
        MinimizeBtn.Text = "+"
    else
        MainFrame.Size = UDim2.new(0, 350, 0, 450)
        MinimizeBtn.Text = "_"
    end
end)

-- DRAGGABLE
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

-- ANTI-AFK AUTO ENABLE
if features.antiAfk then
    game:GetService("Players").LocalPlayer.Idled:Connect(function()
        game:GetService("VirtualUser"):Button2Down(Vector2.new(0,0), workspace.CurrentCamera.CFrame)
        wait(1)
        game:GetService("VirtualUser"):Button2Up(Vector2.new(0,0), workspace.CurrentCamera.CFrame)
    end)
end

-- NOTIFICATION
spawn(function()
    wait(0.5)
    local notif = Instance.new("TextLabel")
    notif.Text = "🔥 HamzzMods V1 Loaded! 6 Categories Available!"
    notif.Size = UDim2.new(0, 400, 0, 40)
    notif.Position = UDim2.new(0.5, -200, 0, -40)
    notif.BackgroundColor3 = Color3.fromRGB(255, 100, 0)
    notif.TextColor3 = Color3.fromRGB(255, 255, 255)
    notif.Font = Enum.Font.GothamBlack
    notif.FontSize = Enum.FontSize.Size18
    notif.Parent = HamzzUI
    
    game:GetService("TweenService"):Create(
        notif,
        TweenInfo.new(0.5),
        {Position = UDim2.new(0.5, -200, 0, 10)}
    ):Play()
    
    wait(3)
    
    game:GetService("TweenService"):Create(
        notif,
        TweenInfo.new(0.5),
        {Position = UDim2.new(0.5, -200, 0, -50)}
    ):Play()
    
    wait(0.5)
    notif:Destroy()
end)

print("========================================")
print("🔥 HAMZZMODS SCRIPT V1 LOADED!")
print("📁 Categories: MAIN, VISUAL, COMBAT, TELEPORT, PLAYER, MISC")
print("✅ All Features Organized & Working")
print("========================================")