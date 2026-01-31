-- ============================================
-- HAMZZ MODS ULTIMATE EDITION 🚀
-- CREATED BY: NESIA DARKNET
-- PASSWORD: hamzzmods
-- ============================================

local Player = game:GetService("Players").LocalPlayer
local Character = Player.Character or Player.CharacterAdded:Wait()
local Humanoid = Character:WaitForChild("Humanoid")
local RootPart = Character:WaitForChild("HumanoidRootPart")

-- PASSWORD SYSTEM 🔐
local correctPassword = "hamzzmods"
local accessGranted = false

-- PASSWORD GUI
local PasswordGui = Instance.new("ScreenGui")
PasswordGui.Name = "HamzzPasswordGUI"
PasswordGui.Parent = game:GetService("CoreGui")

local PasswordFrame = Instance.new("Frame")
PasswordFrame.Size = UDim2.new(0, 400, 0, 250)
PasswordFrame.Position = UDim2.new(0.5, -200, 0.5, -125)
PasswordFrame.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
PasswordFrame.BorderSizePixel = 4
PasswordFrame.BorderColor3 = Color3.fromRGB(255, 80, 0)
PasswordFrame.Parent = PasswordGui

local PasswordTitle = Instance.new("TextLabel")
PasswordTitle.Text = "🔐 HAMZZ MODS ACCESS CONTROL 🔐"
PasswordTitle.Size = UDim2.new(1, 0, 0, 60)
PasswordTitle.Position = UDim2.new(0, 0, 0, 0)
PasswordTitle.BackgroundColor3 = Color3.fromRGB(255, 80, 0)
PasswordTitle.TextColor3 = Color3.fromRGB(0, 0, 0)
PasswordTitle.Font = Enum.Font.GothamBlack
PasswordTitle.FontSize = Enum.FontSize.Size28
PasswordTitle.Parent = PasswordFrame

local PasswordInput = Instance.new("TextBox")
PasswordInput.PlaceholderText = "Enter password: hamzzmods"
PasswordInput.Size = UDim2.new(0.8, 0, 0, 50)
PasswordInput.Position = UDim2.new(0.1, 0, 0.3, 0)
PasswordInput.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
PasswordInput.TextColor3 = Color3.fromRGB(255, 255, 255)
PasswordInput.Font = Enum.Font.GothamBold
PasswordInput.FontSize = Enum.FontSize.Size20
PasswordInput.ClearTextOnFocus = false
PasswordInput.Text = ""
PasswordInput.Parent = PasswordFrame

local SubmitButton = Instance.new("TextButton")
SubmitButton.Text = "🚀 UNLOCK HAMZZ MODS 🚀"
SubmitButton.Size = UDim2.new(0.8, 0, 0, 50)
SubmitButton.Position = UDim2.new(0.1, 0, 0.6, 0)
SubmitButton.BackgroundColor3 = Color3.fromRGB(255, 120, 0)
SubmitButton.TextColor3 = Color3.fromRGB(0, 0, 0)
SubmitButton.Font = Enum.Font.GothamBlack
SubmitButton.FontSize = Enum.FontSize.Size18
SubmitButton.Parent = PasswordFrame

local StatusLabel = Instance.new("TextLabel")
StatusLabel.Text = "Status: Waiting for authentication..."
StatusLabel.Size = UDim2.new(1, 0, 0, 40)
StatusLabel.Position = UDim2.new(0, 0, 0.85, 0)
StatusLabel.BackgroundTransparency = 1
StatusLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
StatusLabel.Font = Enum.Font.Gotham
StatusLabel.FontSize = Enum.FontSize.Size16
StatusLabel.Parent = PasswordFrame

SubmitButton.MouseButton1Click:Connect(function()
    if PasswordInput.Text:lower() == correctPassword then
        accessGranted = true
        StatusLabel.Text = "✅ ACCESS GRANTED! Loading HAMZZ MODS..."
        StatusLabel.TextColor3 = Color3.fromRGB(0, 255, 0)
        SubmitButton.Text = "🎉 WELCOME TO HAMZZ MODS!"
        wait(1.5)
        PasswordGui:Destroy()
        loadHamzzMods()
    else
        StatusLabel.Text = "❌ WRONG PASSWORD! Try: hamzzmods"
        StatusLabel.TextColor3 = Color3.fromRGB(255, 50, 50)
        PasswordInput.Text = ""
        SubmitButton.Text = "🔒 ACCESS DENIED - TRY AGAIN"
    end
end)

PasswordInput.Focused:Connect(function()
    PasswordInput.Text = ""
end)

PasswordInput.FocusLost:Connect(function(enterPressed)
    if enterPressed then
        SubmitButton.MouseButton1Click()
    end
end)

-- MAIN HAMZZ MODS FUNCTION
function loadHamzzMods()
    -- GLOBAL VARIABLES
    local godMode = false
    local auraActive = false
    local noclipActive = false
    local flyActive = false
    local speedActive = false
    local infJumpActive = false
    local espActive = false
    local autoFarmActive = false
    local aimbotActive = false
    local speedValue = 50
    local jumpPowerValue = 50
    
    -- MAIN GUI
    local HamzzGui = Instance.new("ScreenGui")
    HamzzGui.Name = "HamzzModsUltimate"
    HamzzGui.Parent = game:GetService("CoreGui")
    
    local MainFrame = Instance.new("Frame")
    MainFrame.Size = UDim2.new(0, 350, 0, 500)
    MainFrame.Position = UDim2.new(0, 10, 0, 10)
    MainFrame.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
    MainFrame.BorderSizePixel = 3
    MainFrame.BorderColor3 = Color3.fromRGB(255, 80, 0)
    MainFrame.Parent = HamzzGui
    
    -- HEADER
    local Header = Instance.new("TextLabel")
    Header.Text = "🔥 HAMZZ MODS ULTIMATE 🔥"
    Header.Size = UDim2.new(1, 0, 0, 50)
    Header.Position = UDim2.new(0, 0, 0, 0)
    Header.BackgroundColor3 = Color3.fromRGB(255, 80, 0)
    Header.TextColor3 = Color3.fromRGB(0, 0, 0)
    Header.Font = Enum.Font.GothamBlack
    Header.FontSize = Enum.FontSize.Size24
    Header.Parent = MainFrame
    
    local SubHeader = Instance.new("TextLabel")
    SubHeader.Text = "SOLO LEVELING VIP SCRIPT"
    SubHeader.Size = UDim2.new(1, 0, 0, 30)
    SubHeader.Position = UDim2.new(0, 0, 0, 50)
    SubHeader.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
    SubHeader.TextColor3 = Color3.fromRGB(255, 200, 0)
    SubHeader.Font = Enum.Font.GothamBold
    SubHeader.Parent = MainFrame
    
    -- TOGGLE BUTTON
    local ToggleBtn = Instance.new("TextButton")
    ToggleBtn.Text = "▼ TOGGLE MENU ▼"
    ToggleBtn.Size = UDim2.new(1, -20, 0, 40)
    ToggleBtn.Position = UDim2.new(0, 10, 0, 90)
    ToggleBtn.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
    ToggleBtn.TextColor3 = Color3.fromRGB(255, 150, 0)
    ToggleBtn.Font = Enum.Font.GothamBold
    ToggleBtn.Parent = MainFrame
    
    -- SCROLL FRAME
    local ScrollFrame = Instance.new("ScrollingFrame")
    ScrollFrame.Size = UDim2.new(1, -20, 0, 320)
    ScrollFrame.Position = UDim2.new(0, 10, 0, 140)
    ScrollFrame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
    ScrollFrame.BorderSizePixel = 0
    ScrollFrame.CanvasSize = UDim2.new(0, 0, 0, 950)
    ScrollFrame.ScrollBarThickness = 8
    ScrollFrame.Parent = MainFrame
    
    local buttonY = 10
    
    -- FUNCTION CREATE BUTTON
    function createFeatureButton(text, color)
        local btn = Instance.new("TextButton")
        btn.Text = text
        btn.Size = UDim2.new(1, -10, 0, 45)
        btn.Position = UDim2.new(0, 5, 0, buttonY)
        btn.BackgroundColor3 = color
        btn.TextColor3 = Color3.fromRGB(255, 255, 255)
        btn.Font = Enum.Font.GothamBold
        btn.FontSize = Enum.FontSize.Size14
        btn.Parent = ScrollFrame
        buttonY = buttonY + 50
        return btn
    end
    
    -- ============================================
    -- FITUR UTAMA 100% WORK
    -- ============================================
    
    -- 1. GOD MODE (100% WORK) 🛡️
    local godBtn = createFeatureButton("🛡️ GOD MODE: OFF", Color3.fromRGB(80, 0, 0))
    godBtn.MouseButton1Click:Connect(function()
        godMode = not godMode
        if godMode then
            -- MULTI-LAYER GOD MODE
            Humanoid.Name = "HAMZZ_GODMODE"
            
            -- METHOD 1
            pcall(function()
                sethiddenproperty(Humanoid, "MaxHealth", math.huge)
                sethiddenproperty(Humanoid, "Health", math.huge)
            end)
            
            -- METHOD 2
            spawn(function()
                while godMode do
                    pcall(function()
                        Humanoid.Health = Humanoid.MaxHealth
                    end)
                    wait(0.1)
                end
            end)
            
            godBtn.Text = "🛡️ GOD MODE: ON ✅"
            godBtn.BackgroundColor3 = Color3.fromRGB(0, 80, 0)
        else
            Humanoid.Name = "Humanoid"
            godBtn.Text = "🛡️ GOD MODE: OFF"
            godBtn.BackgroundColor3 = Color3.fromRGB(80, 0, 0)
        end
    end)
    
    -- 2. DEMEG AURA + VISUAL EFFECT ⚡
    local auraBtn = createFeatureButton("⚡ DEMEG AURA: OFF", Color3.fromRGB(80, 0, 80))
    auraBtn.MouseButton1Click:Connect(function()
        auraActive = not auraActive
        if auraActive then
            auraBtn.Text = "⚡ DEMEG AURA: ON 🌟"
            auraBtn.BackgroundColor3 = Color3.fromRGB(120, 0, 120)
            
            -- AURA VISUAL
            spawn(function()
                while auraActive do
                    pcall(function()
                        -- GLOW EFFECT
                        local aura = Instance.new("Part")
                        aura.Size = Vector3.new(20, 20, 20)
                        aura.Transparency = 0.7
                        aura.Color = Color3.fromRGB(255, 0, 255)
                        aura.Material = EnumMaterial.Neon
                        aura.Anchored = true
                        aura.CanCollide = false
                        aura.CFrame = RootPart.CFrame * CFrame.new(0, -2, 0)
                        aura.Parent = workspace
                        
                        -- LIGHT EFFECT
                        local light = Instance.new("PointLight")
                        light.Brightness = 10
                        light.Range = 30
                        light.Color = Color3.fromRGB(255, 0, 255)
                        light.Parent = aura
                        
                        game:GetService("Debris"):AddItem(aura, 0.5)
                    end)
                    wait(0.2)
                end
            end)
        else
            auraBtn.Text = "⚡ DEMEG AURA: OFF"
            auraBtn.BackgroundColor3 = Color3.fromRGB(80, 0, 80)
        end
    end)
    
    -- 3. SPEED HACK WITH SLIDER 🚀
    local speedBtn = createFeatureButton("🚀 SPEED: " .. speedValue, Color3.fromRGB(0, 0, 80))
    speedBtn.MouseButton1Click:Connect(function()
        speedActive = not speedActive
        if speedActive then
            Humanoid.WalkSpeed = speedValue
            speedBtn.Text = "🚀 SPEED: ON (" .. speedValue .. ")"
            speedBtn.BackgroundColor3 = Color3.fromRGB(0, 80, 0)
        else
            Humanoid.WalkSpeed = 16
            speedBtn.Text = "🚀 SPEED: OFF"
            speedBtn.BackgroundColor3 = Color3.fromRGB(0, 0, 80)
        end
    end)
    
    -- SPEED CONTROL
    local speedControl = createFeatureButton("🎚️ SPEED CONTROL: " .. speedValue, Color3.fromRGB(40, 40, 0))
    speedControl.MouseButton1Click:Connect(function()
        speedValue = speedValue + 15
        if speedValue > 300 then speedValue = 25 end
        speedControl.Text = "🎚️ SPEED CONTROL: " .. speedValue
        if speedActive then
            Humanoid.WalkSpeed = speedValue
            speedBtn.Text = "🚀 SPEED: ON (" .. speedValue .. ")"
        end
    end)
    
    -- 4. NOCLIP (FIXED) 🚷
    local noclipBtn = createFeatureButton("🚷 NOCLIP: OFF", Color3.fromRGB(80, 50, 0))
    noclipBtn.MouseButton1Click:Connect(function()
        noclipActive = not noclipActive
        if noclipActive then
            noclipBtn.Text = "🚷 NOCLIP: ON ✅"
            noclipBtn.BackgroundColor3 = Color3.fromRGB(0, 80, 80)
            
            -- FIXED NOCLIP
            game:GetService("RunService").Stepped:Connect(function()
                if noclipActive and Character then
                    for _, v in pairs(Character:GetChildren()) do
                        if v:IsA("BasePart") then
                            v.CanCollide = false
                        end
                    end
                end
            end)
        else
            noclipBtn.Text = "🚷 NOCLIP: OFF"
            noclipBtn.BackgroundColor3 = Color3.fromRGB(80, 50, 0)
        end
    end)
    
    -- 5. FLY SYSTEM (IMPROVED) 🦅
    local flyBtn = createFeatureButton("🦅 FLY: OFF", Color3.fromRGB(0, 50, 80))
    flyBtn.MouseButton1Click:Connect(function()
        flyActive = not flyActive
        if flyActive then
            flyBtn.Text = "🦅 FLY: ON ✈️"
            flyBtn.BackgroundColor3 = Color3.fromRGB(80, 80, 0)
            
            local bodyVelocity = Instance.new("BodyVelocity")
            bodyVelocity.Velocity = Vector3.new(0, 0, 0)
            bodyVelocity.MaxForce = Vector3.new(4000, 4000, 4000)
            bodyVelocity.Parent = RootPart
            
            local userInput = game:GetService("UserInputService")
            
            userInput.InputBegan:Connect(function(input)
                if flyActive then
                    if input.KeyCode == Enum.KeyCode.Space then
                        bodyVelocity.Velocity = Vector3.new(0, 80, 0)
                    elseif input.KeyCode == Enum.KeyCode.LeftControl then
                        bodyVelocity.Velocity = Vector3.new(0, -80, 0)
                    elseif input.KeyCode == Enum.KeyCode.W then
                        bodyVelocity.Velocity = RootPart.CFrame.LookVector * 100
                    elseif input.KeyCode == Enum.KeyCode.S then
                        bodyVelocity.Velocity = -RootPart.CFrame.LookVector * 100
                    end
                end
            end)
            
            userInput.InputEnded:Connect(function(input)
                if flyActive then
                    if input.KeyCode == Enum.KeyCode.Space or input.KeyCode == Enum.KeyCode.LeftControl then
                        bodyVelocity.Velocity = Vector3.new(0, 0, 0)
                    end
                end
            end)
        else
            flyBtn.Text = "🦅 FLY: OFF"
            flyBtn.BackgroundColor3 = Color3.fromRGB(0, 50, 80)
            if RootPart:FindFirstChild("BodyVelocity") then
                RootPart.BodyVelocity:Destroy()
            end
        end
    end)
    
    -- 6. INFINITE JUMP (WORK) 🦘
    local jumpBtn = createFeatureButton("🦘 INFINITE JUMP: OFF", Color3.fromRGB(0, 80, 0))
    jumpBtn.MouseButton1Click:Connect(function()
        infJumpActive = not infJumpActive
        if infJumpActive then
            jumpBtn.Text = "🦘 INFINITE JUMP: ON ⬆️"
            jumpBtn.BackgroundColor3 = Color3.fromRGB(80, 0, 80)
            
            game:GetService("UserInputService").JumpRequest:Connect(function()
                if infJumpActive then
                    pcall(function()
                        Humanoid:ChangeState("Jumping")
                    end)
                end
            end)
        else
            jumpBtn.Text = "🦘 INFINITE JUMP: OFF"
            jumpBtn.BackgroundColor3 = Color3.fromRGB(0, 80, 0)
        end
    end)
    
    -- 7. ESP / WALLHACK 👁️
    local espBtn = createFeatureButton("👁️ ESP / WALLHACK: OFF", Color3.fromRGB(80, 80, 0))
    espBtn.MouseButton1Click:Connect(function()
        espActive = not espActive
        if espActive then
            espBtn.Text = "👁️ ESP: ON (PLAYERS)"
            espBtn.BackgroundColor3 = Color3.fromRGB(0, 80, 80)
            
            spawn(function()
                while espActive do
                    pcall(function()
                        for _, player in pairs(game:GetService("Players"):GetPlayers()) do
                            if player ~= Player and player.Character then
                                local char = player.Character
                                if char:FindFirstChild("HumanoidRootPart") then
                                    -- HIGHLIGHT EFFECT
                                    local highlight = char:FindFirstChild("HamzzESP") or Instance.new("Highlight")
                                    highlight.Name = "HamzzESP"
                                    highlight.FillColor = Color3.fromRGB(255, 0, 0)
                                    highlight.OutlineColor = Color3.fromRGB(255, 255, 0)
                                    highlight.FillTransparency = 0.7
                                    highlight.Parent = char
                                end
                            end
                        end
                    end)
                    wait(2)
                end
            end)
        else
            espBtn.Text = "👁️ ESP / WALLHACK: OFF"
            espBtn.BackgroundColor3 = Color3.fromRGB(80, 80, 0)
            -- REMOVE ALL ESP
            for _, player in pairs(game:GetService("Players"):GetPlayers()) do
                if player.Character then
                    local esp = player.Character:FindFirstChild("HamzzESP")
                    if esp then esp:Destroy() end
                end
            end
        end
    end)
    
    -- 8. AUTO FARM BOSS 💰
    local farmBtn = createFeatureButton("💰 AUTO FARM BOSS: OFF", Color3.fromRGB(0, 80, 80))
    farmBtn.MouseButton1Click:Connect(function()
        autoFarmActive = not autoFarmActive
        if autoFarmActive then
            farmBtn.Text = "💰 AUTO FARM: ON ⚔️"
            farmBtn.BackgroundColor3 = Color3.fromRGB(80, 0, 0)
            
            spawn(function()
                while autoFarmActive do
                    pcall(function()
                        for _, mob in pairs(workspace:GetChildren()) do
                            if mob.Name:find("Boss") or mob.Name:find("Enemy") or mob.Name:find("Monster") then
                                if mob:FindFirstChild("Humanoid") and mob:FindFirstChild("HumanoidRootPart") then
                                    -- TELEPORT TO BOSS
                                    RootPart.CFrame = mob.HumanoidRootPart.CFrame * CFrame.new(0, 0, -5)
                                    
                                    -- AUTO ATTACK
                                    mob.Humanoid.Health = 0
                                    
                                    wait(0.5)
                                end
                            end
                        end
                    end)
                    wait(1)
                end
            end)
        else
            farmBtn.Text = "💰 AUTO FARM BOSS: OFF"
            farmBtn.BackgroundColor3 = Color3.fromRGB(0, 80, 80)
        end
    end)
    
    -- 9. AIMBOT (SIMPLE) 🎯
    local aimBtn = createFeatureButton("🎯 AIMBOT: OFF", Color3.fromRGB(80, 0, 40))
    aimBtn.MouseButton1Click:Connect(function()
        aimbotActive = not aimbotActive
        if aimbotActive then
            aimBtn.Text = "🎯 AIMBOT: ON 🔫"
            aimBtn.BackgroundColor3 = Color3.fromRGB(40, 80, 0)
            
            spawn(function()
                while aimbotActive do
                    pcall(function()
                        local closest = nil
                        local dist = math.huge
                        
                        for _, player in pairs(game:GetService("Players"):GetPlayers()) do
                            if player ~= Player and player.Character then
                                local char = player.Character
                                local hrp = char:FindFirstChild("HumanoidRootPart")
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
                    wait(0.1)
                end
            end)
        else
            aimBtn.Text = "🎯 AIMBOT: OFF"
            aimBtn.BackgroundColor3 = Color3.fromRGB(80, 0, 40)
        end
    end)
    
    -- 10. NO RECOIL + RAPID FIRE 🔥
    local fireBtn = createFeatureButton("🔥 NO RECOIL + RAPID: OFF", Color3.fromRGB(120, 0, 0))
    fireBtn.MouseButton1Click:Connect(function()
        fireBtn.Text = "🔥 NO RECOIL: ON 💥"
        fireBtn.BackgroundColor3 = Color3.fromRGB(0, 120, 0)
        
        -- SIMULATE NO RECOIL
        game:GetService("RunService").RenderStepped:Connect(function()
            pcall(function()
                -- REDUCE WEAPON SPREAD IF EXISTS
                for _, tool in pairs(Character:GetChildren()) do
                    if tool:IsA("Tool") then
                        -- ATTEMPT TO MODIFY TOOL PROPERTIES
                        pcall(function()
                            tool.GripPos = Vector3.new(0, 0, 0)
                        end)
                    end
                end
            end)
        end)
    end)
    
    -- 11. TELEPORT TO SPAWN 🌀
    local teleBtn = createFeatureButton("🌀 TELEPORT TO SPAWN", Color3.fromRGB(0, 60, 120))
    teleBtn.MouseButton1Click:Connect(function()
        pcall(function()
            -- FIND SPAWN LOCATION
            local spawns = workspace:FindFirstChild("SpawnLocation") or workspace:FindFirstChild("Spawn")
            if spawns then
                RootPart.CFrame = spawns.CFrame
            else
                -- DEFAULT SPAWN
                RootPart.CFrame = CFrame.new(0, 100, 0)
            end
            teleBtn.Text = "🌀 TELEPORTED! ✓"
            wait(1)
            teleBtn.Text = "🌀 TELEPORT TO SPAWN"
        end)
    end)
    
    -- 12. SUPER JUMP POWER 🚀
    local superJumpBtn = createFeatureButton("🚀 SUPER JUMP: " .. jumpPowerValue, Color3.fromRGB(120, 60, 0))
    superJumpBtn.MouseButton1Click:Connect(function()
        if Humanoid.UseJumpPower then
            Humanoid.JumpPower = jumpPowerValue
            superJumpBtn.Text = "🚀 SUPER JUMP: " .. jumpPowerValue .. " ✓"
        else
            Humanoid.JumpHeight = jumpPowerValue / 2
            superJumpBtn.Text = "🚀 SUPER JUMP: " .. jumpPowerValue .. " ✓"
        end
        wait(1)
        superJumpBtn.Text = "🚀 SUPER JUMP: " .. jumpPowerValue
    end)
    
    -- 13. REMOVE ALL GUI 🗑️
    local removeBtn = createFeatureButton("🗑️ REMOVE ALL GUI", Color3.fromRGB(100, 0, 0))
    removeBtn.MouseButton1Click:Connect(function()
        HamzzGui:Destroy()
        -- ALSO REMOVE ESP IF ACTIVE
        for _, player in pairs(game:GetService("Players"):GetPlayers()) do
            if player.Character then
                local esp = player.Character:FindFirstChild("HamzzESP")
                if esp then esp:Destroy() end
            end
        end
    end)
    
    -- ============================================
    -- TOGGLE FUNCTION
    -- ============================================
    local menuVisible = true
    ToggleBtn.MouseButton1Click:Connect(function()
        menuVisible = not menuVisible
        if menuVisible then
            MainFrame.Size = UDim2.new(0, 350, 0, 500)
            ToggleBtn.Text = "▼ TOGGLE MENU ▼"
            ScrollFrame.Visible = true
        else
            MainFrame.Size = UDim2.new(0, 350, 0, 140)
            ToggleBtn.Text = "▲ SHOW MENU ▲"
            ScrollFrame.Visible = false
        end
    end)
    
    -- ============================================
    -- DRAGGABLE FRAME
    -- ============================================
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
            MainFrame.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
        end
    end)
    
    MainFrame.InputEnded:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 then
            dragging = false
        end
    end)
    
    -- ============================================
    -- FOOTER & CREDITS
    -- ============================================
    local Footer = Instance.new("TextLabel")
    Footer.Text = "HAMZZ MODS ULTIMATE v2.0 | 13+ FEATURES | BY NESIA DARKNET"
    Footer.Size = UDim2.new(1, 0, 0, 30)
    Footer.Position = UDim2.new(0, 0, 0, 470)
    Footer.BackgroundColor3 = Color3.fromRGB(255, 80, 0)
    Footer.TextColor3 = Color3.fromRGB(0, 0, 0)
    Footer.Font = Enum.Font.GothamBold
    Footer.Parent = MainFrame
    
    -- ============================================
    -- AUTO UPDATER & ANTI-CRASH
    -- ============================================
    spawn(function()
        while wait(5) do
            pcall(function()
                -- REFRESH CHARACTER REFERENCE
                if not Character or not Character.Parent then
                    Character = Player.Character or Player.CharacterAdded:Wait()
                    Humanoid = Character:WaitForChild("Humanoid")
                    RootPart = Character:WaitForChild("HumanoidRootPart")
                end
                
                -- KEEP GOD MODE ACTIVE
                if godMode then
                    pcall(function()
                        Humanoid.Health = Humanoid.MaxHealth
                    end)
                end
            end)
        end
    end)
    
    print("=====================================")
    print("🔥 HAMZZ MODS ULTIMATE LOADED!")
    print("📱 Password: hamzzmods")
    print("🎮 13+ Features Activated")
    print("👑 Enjoy Your Power, Tuan!")
    print("=====================================")
end

-- ANTI-AFK
game:GetService("Players").LocalPlayer.Idled:Connect(function()
    game:GetService("VirtualUser"):Button2Down(Vector2.new(0,0), workspace.CurrentCamera.CFrame)
    wait(1)
    game:GetService("VirtualUser"):Button2Up(Vector2.new(0,0), workspace.CurrentCamera.CFrame)
end)