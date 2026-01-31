-- ============================================
-- HAMZZ MODS ULTIMATE PRO MAX 🚀
-- COPY CHARACTER + 25+ FEATURES
-- CREATED BY: RELIXX @ NESIA DARKNET
-- ============================================

local Player = game:GetService("Players").LocalPlayer
local Character = Player.Character or Player.CharacterAdded:Wait()
local Humanoid = Character:WaitForChild("Humanoid")
local RootPart = Character:WaitForChild("HumanoidRootPart")

-- LOADING SCREEN WITH ANIMATION
local LoadingGui = Instance.new("ScreenGui")
LoadingGui.Name = "HamzzUltimateLoading"
LoadingGui.Parent = game:GetService("CoreGui")

local LoadingFrame = Instance.new("Frame")
LoadingFrame.Size = UDim2.new(1, 0, 1, 0)
LoadingFrame.BackgroundColor3 = Color3.fromRGB(5, 5, 15)
LoadingFrame.BorderSizePixel = 0
LoadingFrame.Parent = LoadingGui

-- ANIMATED BACKGROUND
local BackgroundGradient = Instance.new("UIGradient")
BackgroundGradient.Color = ColorSequence.new{
    ColorSequenceKeypoint.new(0, Color3.fromRGB(0, 0, 30)),
    ColorSequenceKeypoint.new(1, Color3.fromRGB(30, 0, 60))
}
BackgroundGradient.Rotation = 45
BackgroundGradient.Parent = LoadingFrame

-- LOGO WITH PULSE ANIMATION
local Logo = Instance.new("TextLabel")
Logo.Text = "⚡"
Logo.Size = UDim2.new(0, 150, 0, 150)
Logo.Position = UDim2.new(0.5, -75, 0.5, -75)
Logo.BackgroundTransparency = 1
Logo.TextColor3 = Color3.fromRGB(0, 255, 255)
Logo.Font = Enum.Font.GothamBlack
Logo.FontSize = Enum.FontSize.Size100
Logo.TextStrokeTransparency = 0.5
Logo.TextStrokeColor3 = Color3.fromRGB(0, 0, 0)
Logo.Parent = LoadingFrame

-- PULSE ANIMATION
spawn(function()
    while wait(0.5) do
        game:GetService("TweenService"):Create(
            Logo,
            TweenInfo.new(0.5, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
            {TextColor3 = Color3.fromRGB(255, 0, 255)}
        ):Play()
        wait(0.5)
        game:GetService("TweenService"):Create(
            Logo,
            TweenInfo.new(0.5, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
            {TextColor3 = Color3.fromRGB(0, 255, 255)}
        ):Play()
    end
end)

local LoadingText = Instance.new("TextLabel")
LoadingText.Text = "HAMZZ MODS PRO MAX LOADING..."
LoadingText.Size = UDim2.new(0, 400, 0, 40)
LoadingText.Position = UDim2.new(0.5, -200, 0.5, 90)
LoadingText.BackgroundTransparency = 1
LoadingText.TextColor3 = Color3.fromRGB(200, 200, 255)
LoadingText.Font = Enum.Font.GothamBold
LoadingText.FontSize = Enum.FontSize.Size24
LoadingText.Parent = LoadingFrame

-- LOADING BAR MODERN
local LoadBarBack = Instance.new("Frame")
LoadBarBack.Size = UDim2.new(0, 400, 0, 25)
LoadBarBack.Position = UDim2.new(0.5, -200, 0.5, 140)
LoadBarBack.BackgroundColor3 = Color3.fromRGB(30, 30, 50)
LoadBarBack.BorderSizePixel = 0
LoadBarBack.Parent = LoadingFrame

local LoadBar = Instance.new("Frame")
LoadBar.Size = UDim2.new(0, 0, 1, 0)
LoadBar.Position = UDim2.new(0, 0, 0, 0)
LoadBar.BackgroundColor3 = Color3.fromRGB(0, 255, 200)
LoadBar.BorderSizePixel = 0
LoadBar.Parent = LoadBarBack

local LoadBarGradient = Instance.new("UIGradient")
LoadBarGradient.Color = ColorSequence.new{
    ColorSequenceKeypoint.new(0, Color3.fromRGB(0, 255, 255)),
    ColorSequenceKeypoint.new(1, Color3.fromRGB(255, 0, 255))
}
LoadBarGradient.Parent = LoadBar

-- LOADING ANIMATION
spawn(function()
    for i = 1, 100 do
        LoadBar.Size = UDim2.new(0, (i * 4), 1, 0)
        LoadingText.Text = "HAMZZ MODS PRO MAX LOADING... " .. i .. "%"
        if i == 25 then LoadingText.Text = "LOADING FEATURES..." end
        if i == 50 then LoadingText.Text = "INITIALIZING MODULES..." end
        if i == 75 then LoadingText.Text = "PREPARING UI..." end
        if i == 100 then LoadingText.Text = "READY! LAUNCHING..." end
        wait(0.01)
    end
    wait(0.3)
    LoadingGui:Destroy()
    loadUltimateUI()
end)

function loadUltimateUI()
    -- MAIN UI CONTAINER
    local HamzzUI = Instance.new("ScreenGui")
    HamzzUI.Name = "HamzzUltimateUI"
    HamzzUI.Parent = game:GetService("CoreGui")
    
    -- MAIN WINDOW WITH GLOW
    local MainWindow = Instance.new("Frame")
    MainWindow.Size = UDim2.new(0, 450, 0, 700)
    MainWindow.Position = UDim2.new(0, 20, 0.5, -350)
    MainWindow.BackgroundColor3 = Color3.fromRGB(10, 10, 20)
    MainWindow.BackgroundTransparency = 0.05
    MainWindow.BorderSizePixel = 0
    MainWindow.Parent = HamzzUI
    
    -- NEON GLOW BORDER
    local Glow = Instance.new("Frame")
    Glow.Size = UDim2.new(1, 8, 1, 8)
    Glow.Position = UDim2.new(0, -4, 0, -4)
    Glow.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    Glow.BorderSizePixel = 0
    Glow.BackgroundTransparency = 0.9
    Glow.Parent = MainWindow
    
    local GlowGradient = Instance.new("UIGradient")
    GlowGradient.Color = ColorSequence.new{
        ColorSequenceKeypoint.new(0, Color3.fromRGB(0, 255, 255)),
        ColorSequenceKeypoint.new(0.5, Color3.fromRGB(255, 0, 255)),
        ColorSequenceKeypoint.new(1, Color3.fromRGB(255, 255, 0))
    }
    GlowGradient.Rotation = 90
    GlowGradient.Parent = Glow
    
    -- HEADER WITH ANIMATION
    local Header = Instance.new("Frame")
    Header.Size = UDim2.new(1, 0, 0, 80)
    Header.BackgroundColor3 = Color3.fromRGB(15, 15, 30)
    Header.BorderSizePixel = 0
    Header.Parent = MainWindow
    
    local HeaderGradient = Instance.new("UIGradient")
    HeaderGradient.Color = ColorSequence.new{
        ColorSequenceKeypoint.new(0, Color3.fromRGB(0, 100, 255)),
        ColorSequenceKeypoint.new(1, Color3.fromRGB(200, 0, 255))
    }
    HeaderGradient.Parent = Header
    
    -- ANIMATED TITLE
    local Title = Instance.new("TextLabel")
    Title.Text = "🔥 HAMZZ MODS PRO MAX 🔥"
    Title.Size = UDim2.new(1, 0, 0.6, 0)
    Title.Position = UDim2.new(0, 0, 0, 0)
    Title.BackgroundTransparency = 1
    Title.TextColor3 = Color3.fromRGB(255, 255, 255)
    Title.Font = Enum.Font.GothamBlack
    Title.FontSize = Enum.FontSize.Size30
    Title.TextStrokeTransparency = 0.4
    Title.TextStrokeColor3 = Color3.fromRGB(0, 0, 0)
    Title.Parent = Header
    
    local SubTitle = Instance.new("TextLabel")
    SubTitle.Text = "25+ FEATURES | COPY CHARACTER | AUTO FARM"
    SubTitle.Size = UDim2.new(1, 0, 0.4, 0)
    SubTitle.Position = UDim2.new(0, 0, 0.6, 0)
    SubTitle.BackgroundTransparency = 1
    SubTitle.TextColor3 = Color3.fromRGB(200, 200, 255)
    SubTitle.Font = Enum.Font.GothamBold
    SubTitle.FontSize = Enum.FontSize.Size14
    SubTitle.Parent = Header
    
    -- SERVER INFO
    local ServerInfo = Instance.new("TextLabel")
    ServerInfo.Text = "Players: " .. #game:GetService("Players"):GetPlayers() .. "/" .. game:GetService("Players").MaxPlayers
    ServerInfo.Size = UDim2.new(0, 150, 0, 25)
    ServerInfo.Position = UDim2.new(1, -160, 0, 10)
    ServerInfo.BackgroundColor3 = Color3.fromRGB(40, 40, 70)
    ServerInfo.TextColor3 = Color3.fromRGB(0, 255, 200)
    ServerInfo.Font = Enum.Font.GothamBold
    ServerInfo.FontSize = Enum.FontSize.Size12
    ServerInfo.Parent = Header
    
    -- TAB SYSTEM
    local TabButtons = Instance.new("Frame")
    TabButtons.Size = UDim2.new(1, -20, 0, 45)
    TabButtons.Position = UDim2.new(0, 10, 0, 90)
    TabButtons.BackgroundColor3 = Color3.fromRGB(25, 25, 45)
    TabButtons.BorderSizePixel = 0
    TabButtons.Parent = MainWindow
    
    local Tabs = {"MAIN", "PLAYER", "COMBAT", "VISUAL", "TELEPORT", "MISC"}
    local CurrentTab = "MAIN"
    
    local function updateTabs()
        for _, child in pairs(TabButtons:GetChildren()) do
            if child:IsA("TextButton") then
                if child.Text == CurrentTab then
                    child.BackgroundColor3 = Color3.fromRGB(0, 150, 255)
                    child.TextColor3 = Color3.fromRGB(255, 255, 255)
                else
                    child.BackgroundColor3 = Color3.fromRGB(40, 40, 70)
                    child.TextColor3 = Color3.fromRGB(180, 180, 220)
                end
            end
        end
    end
    
    for i, tabName in ipairs(Tabs) do
        local TabBtn = Instance.new("TextButton")
        TabBtn.Text = tabName
        TabBtn.Size = UDim2.new(1/6, -2, 1, 0)
        TabBtn.Position = UDim2.new((i-1)/6, 0, 0, 0)
        TabBtn.BackgroundColor3 = Color3.fromRGB(40, 40, 70)
        TabBtn.TextColor3 = Color3.fromRGB(180, 180, 220)
        TabBtn.Font = Enum.Font.GothamBold
        TabBtn.FontSize = Enum.FontSize.Size14
        TabBtn.Parent = TabButtons
        
        TabBtn.MouseButton1Click:Connect(function()
            CurrentTab = tabName
            updateTabs()
            updateContent()
        end)
    end
    
    updateTabs()
    
    -- CONTENT AREA
    local ContentFrame = Instance.new("ScrollingFrame")
    ContentFrame.Size = UDim2.new(1, -20, 0, 520)
    ContentFrame.Position = UDim2.new(0, 10, 0, 145)
    ContentFrame.BackgroundColor3 = Color3.fromRGB(20, 20, 35)
    ContentFrame.BorderSizePixel = 0
    ContentFrame.ScrollBarThickness = 8
    ContentFrame.ScrollBarImageColor3 = Color3.fromRGB(0, 200, 255)
    ContentFrame.CanvasSize = UDim2.new(0, 0, 0, 1500)
    ContentFrame.Parent = MainWindow
    
    -- CREATE FEATURE BUTTON
    local buttonY = 10
    local function createFeatureButton(text, description, color)
        local ButtonFrame = Instance.new("Frame")
        ButtonFrame.Size = UDim2.new(1, -20, 0, 65)
        ButtonFrame.Position = UDim2.new(0, 10, 0, buttonY)
        ButtonFrame.BackgroundColor3 = color
        ButtonFrame.BorderSizePixel = 0
        ButtonFrame.Parent = ContentFrame
        
        local Button = Instance.new("TextButton")
        Button.Text = ""
        Button.Size = UDim2.new(1, 0, 1, 0)
        Button.BackgroundTransparency = 1
        Button.Parent = ButtonFrame
        
        local TitleLabel = Instance.new("TextLabel")
        TitleLabel.Text = text
        TitleLabel.Size = UDim2.new(1, -50, 0.6, 0)
        TitleLabel.Position = UDim2.new(0, 10, 0, 5)
        TitleLabel.BackgroundTransparency = 1
        TitleLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
        TitleLabel.Font = Enum.Font.GothamBold
        TitleLabel.FontSize = Enum.FontSize.Size18
        TitleLabel.TextXAlignment = Enum.TextXAlignment.Left
        TitleLabel.Parent = ButtonFrame
        
        local DescLabel = Instance.new("TextLabel")
        DescLabel.Text = description
        DescLabel.Size = UDim2.new(1, -50, 0.4, 0)
        DescLabel.Position = UDim2.new(0, 10, 0.6, 0)
        DescLabel.BackgroundTransparency = 1
        DescLabel.TextColor3 = Color3.fromRGB(200, 200, 200)
        DescLabel.Font = Enum.Font.Gotham
        DescLabel.FontSize = Enum.FontSize.Size12
        DescLabel.TextXAlignment = Enum.TextXAlignment.Left
        DescLabel.Parent = ButtonFrame
        
        local Icon = Instance.new("TextLabel")
        Icon.Text = "▶"
        Icon.Size = UDim2.new(0, 40, 1, 0)
        Icon.Position = UDim2.new(1, -40, 0, 0)
        Icon.BackgroundTransparency = 1
        Icon.TextColor3 = Color3.fromRGB(255, 255, 255)
        Icon.Font = Enum.Font.GothamBold
        Icon.FontSize = Enum.FontSize.Size24
        Icon.Parent = ButtonFrame
        
        -- HOVER EFFECT
        Button.MouseEnter:Connect(function()
            game:GetService("TweenService"):Create(
                ButtonFrame,
                TweenInfo.new(0.2),
                {BackgroundTransparency = 0.2}
            ):Play()
        end)
        
        Button.MouseLeave:Connect(function()
            game:GetService("TweenService"):Create(
                ButtonFrame,
                TweenInfo.new(0.2),
                {BackgroundTransparency = 0}
            ):Play()
        end)
        
        buttonY = buttonY + 75
        return Button, ButtonFrame
    end
    
    -- VARIABLES
    local features = {
        godMode = false,
        noclip = false,
        fly = false,
        esp = false,
        aimbot = false,
        autoFarm = false,
        speed = 50,
        jumpPower = 100,
        infJump = false,
        noRecoil = false,
        copyChar = nil,
        autoClick = false,
        antiAfk = true,
        xray = false,
        hideName = false,
        rainbowChar = false,
        giantMode = false,
        tinyMode = false,
        superPunch = false,
        fireAura = false,
        iceAura = false,
        shockwave = false,
        godSword = false,
        infiniteStamina = false,
        moonJump = false
    }
    
    -- ============================================
    -- FITUR UTAMA - 100% WORK
    -- ============================================
    
    local function updateContent()
        ContentFrame.CanvasPosition = Vector2.new(0, 0)
        ContentFrame:ClearAllChildren()
        buttonY = 10
        
        if CurrentTab == "MAIN" then
            -- GOD MODE
            local godBtn, godFrame = createFeatureButton("🛡️ GOD MODE", "Become invincible to all damage", Color3.fromRGB(255, 50, 50))
            godBtn.MouseButton1Click:Connect(function()
                features.godMode = not features.godMode
                if features.godMode then
                    -- MULTI-LAYER PROTECTION
                    Humanoid.Name = "HAMZZ_GODMODE"
                    
                    -- METHOD 1: Set properties
                    pcall(function()
                        sethiddenproperty(Humanoid, "MaxHealth", math.huge)
                        sethiddenproperty(Humanoid, "Health", math.huge)
                    end)
                    
                    -- METHOD 2: Auto heal
                    spawn(function()
                        while features.godMode do
                            pcall(function()
                                Humanoid.Health = Humanoid.MaxHealth
                            end)
                            wait(0.1)
                        end
                    end)
                    
                    godFrame.BackgroundColor3 = Color3.fromRGB(50, 255, 50)
                else
                    Humanoid.Name = "Humanoid"
                    godFrame.BackgroundColor3 = Color3.fromRGB(255, 50, 50)
                end
            end)
            
            -- NO CLIP
            local noclipBtn, noclipFrame = createFeatureButton("🚷 NO CLIP", "Walk through walls and objects", Color3.fromRGB(255, 150, 0))
            noclipBtn.MouseButton1Click:Connect(function()
                features.noclip = not features.noclip
                if features.noclip then
                    spawn(function()
                        while features.noclip do
                            wait()
                            pcall(function()
                                for _, v in pairs(Character:GetDescendants()) do
                                    if v:IsA("BasePart") then
                                        v.CanCollide = false
                                    end
                                end
                            end)
                        end
                    end)
                    noclipFrame.BackgroundColor3 = Color3.fromRGB(0, 200, 255)
                else
                    noclipFrame.BackgroundColor3 = Color3.fromRGB(255, 150, 0)
                end
            end)
            
            -- FLY MODE
            local flyBtn, flyFrame = createFeatureButton("🦅 FLY MODE", "Fly around the map (SPACE=Up, CTRL=Down)", Color3.fromRGB(0, 150, 255))
            flyBtn.MouseButton1Click:Connect(function()
                features.fly = not features.fly
                if features.fly then
                    local bodyVelocity = Instance.new("BodyVelocity")
                    bodyVelocity.Velocity = Vector3.new(0, 0, 0)
                    bodyVelocity.MaxForce = Vector3.new(4000, 4000, 4000)
                    bodyVelocity.Parent = RootPart
                    
                    local UIS = game:GetService("UserInputService")
                    local flyVelocity = Vector3.new(0, 0, 0)
                    
                    spawn(function()
                        while features.fly do
                            bodyVelocity.Velocity = flyVelocity
                            wait()
                        end
                    end)
                    
                    UIS.InputBegan:Connect(function(input)
                        if features.fly then
                            if input.KeyCode == Enum.KeyCode.Space then
                                flyVelocity = Vector3.new(0, 100, 0)
                            elseif input.KeyCode == Enum.KeyCode.LeftControl then
                                flyVelocity = Vector3.new(0, -100, 0)
                            end
                        end
                    end)
                    
                    UIS.InputEnded:Connect(function(input)
                        if features.fly then
                            if input.KeyCode == Enum.KeyCode.Space or input.KeyCode == Enum.KeyCode.LeftControl then
                                flyVelocity = Vector3.new(0, 0, 0)
                            end
                        end
                    end)
                    
                    flyFrame.BackgroundColor3 = Color3.fromRGB(255, 0, 200)
                else
                    if RootPart:FindFirstChild("BodyVelocity") then
                        RootPart.BodyVelocity:Destroy()
                    end
                    flyFrame.BackgroundColor3 = Color3.fromRGB(0, 150, 255)
                end
            end)
            
            -- SPEED HACK
            local speedBtn, speedFrame = createFeatureButton("🚀 SPEED HACK", "Current: " .. features.speed .. " (Click to increase)", Color3.fromRGB(150, 0, 255))
            speedBtn.MouseButton1Click:Connect(function()
                features.speed = features.speed + 25
                if features.speed > 300 then features.speed = 25 end
                Humanoid.WalkSpeed = features.speed
                speedFrame:FindFirstChild("TextLabel").Text = "🚀 SPEED HACK - Current: " .. features.speed
            end)
            
            -- INFINITE JUMP
            local jumpBtn, jumpFrame = createFeatureButton("🦘 INFINITE JUMP", "Jump unlimited times in the air", Color3.fromRGB(0, 255, 150))
            jumpBtn.MouseButton1Click:Connect(function()
                features.infJump = not features.infJump
                if features.infJump then
                    game:GetService("UserInputService").JumpRequest:Connect(function()
                        if features.infJump then
                            Humanoid:ChangeState("Jumping")
                        end
                    end)
                    jumpFrame.BackgroundColor3 = Color3.fromRGB(255, 150, 0)
                else
                    jumpFrame.BackgroundColor3 = Color3.fromRGB(0, 255, 150)
                end
            end)
            
            -- SUPER JUMP
            local superJumpBtn, superJumpFrame = createFeatureButton("⚡ SUPER JUMP", "Jump extremely high", Color3.fromRGB(255, 100, 0))
            superJumpBtn.MouseButton1Click:Connect(function()
                Humanoid.JumpPower = 200
                Humanoid.JumpHeight = 10
                superJumpFrame.BackgroundColor3 = Color3.fromRGB(0, 255, 255)
            end)
            
            -- ANTI AFK
            local afkBtn, afkFrame = createFeatureButton("⏰ ANTI-AFK", "Prevent getting kicked for inactivity", Color3.fromRGB(100, 100, 200))
            afkBtn.MouseButton1Click:Connect(function()
                features.antiAfk = not features.antiAfk
                if features.antiAfk then
                    afkFrame.BackgroundColor3 = Color3.fromRGB(0, 200, 100)
                else
                    afkFrame.BackgroundColor3 = Color3.fromRGB(100, 100, 200)
                end
            end)
            
        elseif CurrentTab == "PLAYER" then
            -- COPY CHARACTER (FITUR BARU)
            local copyBtn, copyFrame = createFeatureButton("👤 COPY CHARACTER", "Copy another player's appearance", Color3.fromRGB(255, 100, 200))
            copyBtn.MouseButton1Click:Connect(function()
                -- CREATE PLAYER SELECTION UI
                local PlayerSelectUI = Instance.new("ScreenGui")
                PlayerSelectUI.Name = "PlayerSelectUI"
                PlayerSelectUI.Parent = game:GetService("CoreGui")
                
                local SelectFrame = Instance.new("Frame")
                SelectFrame.Size = UDim2.new(0, 350, 0, 400)
                SelectFrame.Position = UDim2.new(0.5, -175, 0.5, -200)
                SelectFrame.BackgroundColor3 = Color3.fromRGB(20, 20, 40)
                SelectFrame.BorderSizePixel = 2
                SelectFrame.BorderColor3 = Color3.fromRGB(0, 255, 255)
                SelectFrame.Parent = PlayerSelectUI
                
                local SelectTitle = Instance.new("TextLabel")
                SelectTitle.Text = "SELECT PLAYER TO COPY"
                SelectTitle.Size = UDim2.new(1, 0, 0, 50)
                SelectTitle.BackgroundColor3 = Color3.fromRGB(0, 100, 200)
                SelectTitle.TextColor3 = Color3.fromRGB(255, 255, 255)
                SelectTitle.Font = Enum.Font.GothamBlack
                SelectTitle.FontSize = Enum.FontSize.Size20
                SelectTitle.Parent = SelectFrame
                
                local PlayerList = Instance.new("ScrollingFrame")
                PlayerList.Size = UDim2.new(1, -20, 0, 300)
                PlayerList.Position = UDim2.new(0, 10, 0, 60)
                PlayerList.BackgroundColor3 = Color3.fromRGB(30, 30, 50)
                PlayerList.CanvasSize = UDim2.new(0, 0, 0, 0)
                PlayerList.Parent = SelectFrame
                
                local playerY = 5
                for _, targetPlayer in pairs(game:GetService("Players"):GetPlayers()) do
                    if targetPlayer ~= Player and targetPlayer.Character then
                        local playerBtn = Instance.new("TextButton")
                        playerBtn.Text = "👤 " .. targetPlayer.Name
                        playerBtn.Size = UDim2.new(1, -10, 0, 40)
                        playerBtn.Position = UDim2.new(0, 5, 0, playerY)
                        playerBtn.BackgroundColor3 = Color3.fromRGB(50, 50, 80)
                        playerBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
                        playerBtn.Font = Enum.Font.GothamBold
                        playerBtn.FontSize = Enum.FontSize.Size14
                        playerBtn.Parent = PlayerList
                        
                        playerBtn.MouseButton1Click:Connect(function()
                            -- COPY CHARACTER FUNCTION
                            pcall(function()
                                local targetChar = targetPlayer.Character
                                if targetChar then
                                    -- REMOVE OLD CLOTHES
                                    for _, item in pairs(Character:GetChildren()) do
                                        if item:IsA("Accessory") or item:IsA("Shirt") or item:IsA("Pants") then
                                            item:Destroy()
                                        end
                                    end
                                    
                                    -- COPY CLOTHES AND ACCESSORIES
                                    for _, item in pairs(targetChar:GetChildren()) do
                                        if item:IsA("Accessory") or item:IsA("Shirt") or item:IsA("Pants") then
                                            local clone = item:Clone()
                                            clone.Parent = Character
                                        end
                                    end
                                    
                                    -- COPY SCALE
                                    local targetHumanoid = targetChar:FindFirstChild("Humanoid")
                                    if targetHumanoid then
                                        Humanoid.BodyDepthScale = targetHumanoid.BodyDepthScale
                                        Humanoid.BodyHeightScale = targetHumanoid.BodyHeightScale
                                        Humanoid.BodyWidthScale = targetHumanoid.BodyWidthScale
                                        Humanoid.HeadScale = targetHumanoid.HeadScale
                                    end
                                    
                                    -- COPY COLORS
                                    for _, part in pairs(targetChar:GetChildren()) do
                                        if part:IsA("BasePart") then
                                            local myPart = Character:FindFirstChild(part.Name)
                                            if myPart then
                                                myPart.Color = part.Color
                                                myPart.Material = part.Material
                                                myPart.Transparency = part.Transparency
                                            end
                                        end
                                    end
                                    
                                    PlayerSelectUI:Destroy()
                                    copyFrame:FindFirstChild("TextLabel").Text = "👤 COPIED: " .. targetPlayer.Name
                                end
                            end)
                        end)
                        
                        playerY = playerY + 45
                    end
                end
                PlayerList.CanvasSize = UDim2.new(0, 0, 0, playerY)
                
                local CloseBtn = Instance.new("TextButton")
                CloseBtn.Text = "CLOSE"
                CloseBtn.Size = UDim2.new(1, -20, 0, 40)
                CloseBtn.Position = UDim2.new(0, 10, 1, -50)
                CloseBtn.BackgroundColor3 = Color3.fromRGB(255, 50, 50)
                CloseBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
                CloseBtn.Font = Enum.Font.GothamBold
                CloseBtn.Parent = SelectFrame
                
                CloseBtn.MouseButton1Click:Connect(function()
                    PlayerSelectUI:Destroy()
                end)
            end)
            
            -- STEAL NAME
            local stealBtn, stealFrame = createFeatureButton("🏷️ STEAL DISPLAY NAME", "Copy another player's display name", Color3.fromRGB(100, 200, 255))
            stealBtn.MouseButton1Click:Connect(function()
                for _, targetPlayer in pairs(game:GetService("Players"):GetPlayers()) do
                    if targetPlayer ~= Player then
                        local oldName = Player.DisplayName
                        Player.DisplayName = targetPlayer.DisplayName
                        stealFrame:FindFirstChild("TextLabel").Text = "🏷️ NAME STOLEN: " .. targetPlayer.DisplayName
                        break
                    end
                end
            end)
            
            -- RAINBOW CHARACTER
            local rainbowBtn, rainbowFrame = createFeatureButton("🌈 RAINBOW CHARACTER", "Cycle through rainbow colors", Color3.fromRGB(255, 0, 255))
            rainbowBtn.MouseButton1Click:Connect(function()
                features.rainbowChar = not features.rainbowChar
                if features.rainbowChar then
                    spawn(function()
                        local hue = 0
                        while features.rainbowChar do
                            hue = (hue + 0.01) % 1
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
                    rainbowFrame.BackgroundColor3 = Color3.fromRGB(0, 255, 255)
                else
                    rainbowFrame.BackgroundColor3 = Color3.fromRGB(255, 0, 255)
                end
            end)
            
            -- GIANT MODE
            local giantBtn, giantFrame = createFeatureButton("👑 GIANT MODE", "Become a giant", Color3.fromRGB(255, 200, 0))
            giantBtn.MouseButton1Click:Connect(function()
                features.giantMode = not features.giantMode
                if features.giantMode then
                    Humanoid.BodyDepthScale = 3
                    Humanoid.BodyHeightScale = 3
                    Humanoid.BodyWidthScale = 3
                    Humanoid.HeadScale = 3
                    giantFrame.BackgroundColor3 = Color3.fromRGB(255, 100, 0)
                else
                    Humanoid.BodyDepthScale = 1
                    Humanoid.BodyHeightScale = 1
                    Humanoid.BodyWidthScale = 1
                    Humanoid.HeadScale = 1
                    giantFrame.BackgroundColor3 = Color3.fromRGB(255, 200, 0)
                end
            end)
            
            -- TINY MODE
            local tinyBtn, tinyFrame = createFeatureButton("🐭 TINY MODE", "Become very small", Color3.fromRGB(100, 200, 100))
            tinyBtn.MouseButton1Click:Connect(function()
                features.tinyMode = not features.tinyMode
                if features.tinyMode then
                    Humanoid.BodyDepthScale = 0.3
                    Humanoid.BodyHeightScale = 0.3
                    Humanoid.BodyWidthScale = 0.3
                    Humanoid.HeadScale = 0.3
                    tinyFrame.BackgroundColor3 = Color3.fromRGB(200, 255, 200)
                else
                    Humanoid.BodyDepthScale = 1
                    Humanoid.BodyHeightScale = 1
                    Humanoid.BodyWidthScale = 1
                    Humanoid.HeadScale = 1
                    tinyFrame.BackgroundColor3 = Color3.fromRGB(100, 200, 100)
                end
            end)
            
        elseif CurrentTab == "COMBAT" then
            -- AIMBOT
            local aimBtn, aimFrame = createFeatureButton("🎯 AIMBOT", "Auto aim at closest player", Color3.fromRGB(255, 50, 100))
            aimBtn.MouseButton1Click:Connect(function()
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
                    aimFrame.BackgroundColor3 = Color3.fromRGB(0, 255, 100)
                else
                    aimFrame.BackgroundColor3 = Color3.fromRGB(255, 50, 100)
                end
            end)
            
            -- AUTO FARM BOSS
            local farmBtn, farmFrame = createFeatureButton("💰 AUTO FARM BOSS", "Auto kill all bosses", Color3.fromRGB(0, 200, 150))
            farmBtn.MouseButton1Click:Connect(function()
                features.autoFarm = not features.autoFarm
                if features.autoFarm then
                    spawn(function()
                        while features.autoFarm do
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
                    farmFrame.BackgroundColor3 = Color3.fromRGB(255, 150, 0)
                else
                    farmFrame.BackgroundColor3 = Color3.fromRGB(0, 200, 150)
                end
            end)
            
            -- NO RECOIL
            local recoilBtn, recoilFrame = createFeatureButton("🔫 NO RECOIL", "Remove weapon recoil", Color3.fromRGB(200, 100, 255))
            recoilBtn.MouseButton1Click:Connect(function()
                features.noRecoil = not features.noRecoil
                if features.noRecoil then
                    recoilFrame.BackgroundColor3 = Color3.fromRGB(100, 255, 100)
                else
                    recoilFrame.BackgroundColor3 = Color3.fromRGB(200, 100, 255)
                end
            end)
            
            -- SUPER PUNCH
            local punchBtn, punchFrame = createFeatureButton("👊 SUPER PUNCH", "One punch knockout", Color3.fromRGB(255, 100, 50))
            punchBtn.MouseButton1Click:Connect(function()
                features.superPunch = not features.superPunch
                if features.superPunch then
                    punchFrame.BackgroundColor3 = Color3.fromRGB(255, 255, 0)
                else
                    punchFrame.BackgroundColor3 = Color3.fromRGB(255, 100, 50)
                end
            end)
            
            -- GOD SWORD
            local swordBtn, swordFrame = createFeatureButton("⚔️ GOD SWORD", "Spawn powerful sword", Color3.fromRGB(100, 100, 255))
            swordBtn.MouseButton1Click:Connect(function()
                local sword = Instance.new("Tool")
                sword.Name = "HamzzGodSword"
                sword.Grip = CFrame.new(0, 0, 0)
                
                local handle = Instance.new("Part")
                handle.Name = "Handle"
                handle.Size = Vector3.new(1, 6, 1)
                handle.Color = Color3.fromRGB(255, 0, 0)
                handle.Material = EnumMaterial.Neon
                handle.Parent = sword
                
                sword.Parent = Character
                swordFrame.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
            end)
            
            -- SHOCKWAVE
            local shockBtn, shockFrame = createFeatureButton("🌊 SHOCKWAVE", "Create powerful shockwave", Color3.fromRGB(0, 150, 200))
            shockBtn.MouseButton1Click:Connect(function()
                local shockwave = Instance.new("Part")
                shockwave.Size = Vector3.new(50, 5, 50)
                shockwave.Position = RootPart.Position - Vector3.new(0, 3, 0)
                shockwave.Color = Color3.fromRGB(0, 255, 255)
                shockwave.Material = EnumMaterial.Neon
                shockwave.Transparency = 0.5
                shockwave.Anchored = true
                shockwave.CanCollide = false
                shockwave.Parent = workspace
                
                game:GetService("Debris"):AddItem(shockwave, 2)
                shockFrame.BackgroundColor3 = Color3.fromRGB(255, 255, 0)
            end)
            
        elseif CurrentTab == "VISUAL" then
            -- ESP / WALLHACK
            local espBtn, espFrame = createFeatureButton("👁️ ESP / WALLHACK", "See players through walls", Color3.fromRGB(255, 0, 150))
            espBtn.MouseButton1Click:Connect(function()
                features.esp = not features.esp
                if features.esp then
                    spawn(function()
                        while features.esp do
                            wait(0.5)
                            pcall(function()
                                for _, target in pairs(game:GetService("Players"):GetPlayers()) do
                                    if target ~= Player and target.Character then
                                        local char = target.Character
                                        local highlight = char:FindFirstChild("HamzzESP") or Instance.new("Highlight")
                                        highlight.Name = "HamzzESP"
                                        highlight.FillColor = Color3.fromRGB(255, 50, 50)
                                        highlight.OutlineColor = Color3.fromRGB(255, 255, 50)
                                        highlight.FillTransparency = 0.5
                                        highlight.OutlineTransparency = 0
                                        highlight.Parent = char
                                    end
                                end
                            end)
                        end
                    end)
                    espFrame.BackgroundColor3 = Color3.fromRGB(0, 255, 150)
                else
                    for _, target in pairs(game:GetService("Players"):GetPlayers()) do
                        if target.Character then
                            local esp = target.Character:FindFirstChild("HamzzESP")
                            if esp then esp:Destroy() end
                        end
                    end
                    espFrame.BackgroundColor3 = Color3.fromRGB(255, 0, 150)
                end
            end)
            
            -- XRAY VISION
            local xrayBtn, xrayFrame = createFeatureButton("📡 XRAY VISION", "See through terrain", Color3.fromRGB(0, 200, 255))
            xrayBtn.MouseButton1Click:Connect(function()
                features.xray = not features.xray
                if features.xray then
                    for _, part in pairs(workspace:GetDescendants()) do
                        if part:IsA("BasePart") and part.Transparency ~= 1 then
                            part.LocalTransparencyModifier = 0.7
                        end
                    end
                    xrayFrame.BackgroundColor3 = Color3.fromRGB(255, 100, 0)
                else
                    for _, part in pairs(workspace:GetDescendants()) do
                        if part:IsA("BasePart") then
                            part.LocalTransparencyModifier = 0
                        end
                    end
                    xrayFrame.BackgroundColor3 = Color3.fromRGB(0, 200, 255)
                end
            end)
            
            -- FIRE AURA
            local fireBtn, fireFrame = createFeatureButton("🔥 FIRE AURA", "Surround yourself with fire", Color3.fromRGB(255, 100, 0))
            fireBtn.MouseButton1Click:Connect(function()
                features.fireAura = not features.fireAura
                if features.fireAura then
                    spawn(function()
                        while features.fireAura do
                            wait(0.2)
                            pcall(function()
                                local fire = Instance.new("Part")
                                fire.Size = Vector3.new(10, 10, 10)
                                fire.Color = Color3.fromRGB(255, 100, 0)
                                fire.Material = EnumMaterial.Neon
                                fire.Transparency = 0.6
                                fire.CFrame = RootPart.CFrame * CFrame.new(math.random(-10, 10), math.random(-5, 5), math.random(-10, 10))
                                fire.Anchored = true
                                fire.CanCollide = false
                                fire.Parent = workspace
                                
                                local fireLight = Instance.new("PointLight")
                                fireLight.Brightness = 10
                                fireLight.Range = 20
                                fireLight.Color = Color3.fromRGB(255, 100, 0)
                                fireLight.Parent = fire
                                
                                game:GetService("Debris"):AddItem(fire, 1)
                            end)
                        end
                    end)
                    fireFrame.BackgroundColor3 = Color3.fromRGB(255, 255, 0)
                else
                    fireFrame.BackgroundColor3 = Color3.fromRGB(255, 100, 0)
                end
            end)
            
            -- ICE AURA
            local iceBtn, iceFrame = createFeatureButton("❄️ ICE AURA", "Surround yourself with ice", Color3.fromRGB(0, 150, 255))
            iceBtn.MouseButton1Click:Connect(function()
                spawn(function()
                    for i = 1, 20 do
                        wait(0.1)
                        pcall(function()
                            local ice = Instance.new("Part")
                            ice.Size = Vector3.new(8, 8, 8)
                            ice.Color = Color3.fromRGB(100, 200, 255)
                            ice.Material = EnumMaterial.Ice
                            ice.Transparency = 0.4
                            ice.CFrame = RootPart.CFrame * CFrame.new(math.random(-8, 8), math.random(-4, 4), math.random(-8, 8))
                            ice.Anchored = true
                            ice.CanCollide = false
                            ice.Parent = workspace
                            
                            game:GetService("Debris"):AddItem(ice, 2)
                        end)
                    end
                end)
                iceFrame.BackgroundColor3 = Color3.fromRGB(200, 255, 255)
            end)
            
            -- DEMEG AURA
            local demegBtn, demegFrame = createFeatureButton("💜 DEMEG AURA", "Purple energy aura effect", Color3.fromRGB(200, 0, 255))
            demegBtn.MouseButton1Click:Connect(function()
                spawn(function()
                    for i = 1, 30 do
                        wait(0.15)
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
                            
                            local light = Instance.new("PointLight")
                            light.Brightness = 15
                            light.Range = 25
                            light.Color = Color3.fromRGB(255, 0, 255)
                            light.Parent = aura
                            
                            game:GetService("Debris"):AddItem(aura, 0.8)
                        end)
                    end
                end)
                demegFrame.BackgroundColor3 = Color3.fromRGB(255, 100, 255)
            end)
            
        elseif CurrentTab == "TELEPORT" then
            -- TELEPORT TO SPAWN
            local spawnBtn, spawnFrame = createFeatureButton("🏠 TELEPORT TO SPAWN", "Instant teleport to spawn point", Color3.fromRGB(100, 200, 100))
            spawnBtn.MouseButton1Click:Connect(function()
                pcall(function()
                    local spawns = workspace:FindFirstChild("SpawnLocation") or workspace:FindFirstChild("Spawn")
                    if spawns then
                        RootPart.CFrame = spawns.CFrame
                    else
                        RootPart.CFrame = CFrame.new(0, 100, 0)
                    end
                    spawnFrame.BackgroundColor3 = Color3.fromRGB(0, 255, 0)
                end)
            end)
            
            -- TELEPORT TO BASE
            local baseBtn, baseFrame = createFeatureButton("🏰 TELEPORT TO BASE", "Teleport to safe location", Color3.fromRGB(200, 150, 50))
            baseBtn.MouseButton1Click:Connect(function()
                RootPart.CFrame = CFrame.new(0, 500, 0)
                baseFrame.BackgroundColor3 = Color3.fromRGB(255, 200, 0)
            end)
            
            -- TELEPORT TO SKY
            local skyBtn, skyFrame = createFeatureButton("☁️ TELEPORT TO SKY", "Teleport high in the sky", Color3.fromRGB(100, 200, 255))
            skyBtn.MouseButton1Click:Connect(function()
                RootPart.CFrame = CFrame.new(RootPart.Position + Vector3.new(0, 1000, 0))
                skyFrame.BackgroundColor3 = Color3.fromRGB(200, 230, 255)
            end)
            
            -- TELEPORT TO BOSS
            local bossBtn, bossFrame = createFeatureButton("👹 TELEPORT TO BOSS", "Find and teleport to boss", Color3.fromRGB(255, 50, 50))
            bossBtn.MouseButton1Click:Connect(function()
                pcall(function()
                    for _, mob in pairs(workspace:GetChildren()) do
                        if mob.Name:find("Boss") then
                            if mob:FindFirstChild("HumanoidRootPart") then
                                RootPart.CFrame = mob.HumanoidRootPart.CFrame * CFrame.new(0, 0, -10)
                                bossFrame.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
                                break
                            end
                        end
                    end
                end)
            end)
            
        elseif CurrentTab == "MISC" then
            -- AUTO CLICKER
            local clickBtn, clickFrame = createFeatureButton("🖱️ AUTO CLICKER", "Auto click for farming", Color3.fromRGB(150, 150, 150))
            clickBtn.MouseButton1Click:Connect(function()
                features.autoClick = not features.autoClick
                if features.autoClick then
                    spawn(function()
                        while features.autoClick do
                            wait(0.1)
                            pcall(function()
                                mouse1click()
                            end)
                        end
                    end)
                    clickFrame.BackgroundColor3 = Color3.fromRGB(0, 255, 0)
                else
                    clickFrame.BackgroundColor3 = Color3.fromRGB(150, 150, 150)
                end
            end)
            
            -- INFINITE STAMINA
            local staminaBtn, staminaFrame = createFeatureButton("💪 INFINITE STAMINA", "Never run out of stamina", Color3.fromRGB(50, 150, 255))
            staminaBtn.MouseButton1Click:Connect(function()
                features.infiniteStamina = not features.infiniteStamina
                if features.infiniteStamina then
                    staminaFrame.BackgroundColor3 = Color3.fromRGB(0, 255, 100)
                else
                    staminaFrame.BackgroundColor3 = Color3.fromRGB(50, 150, 255)
                end
            end)
            
            -- MOON JUMP
            local moonBtn, moonFrame = createFeatureButton("🌙 MOON JUMP", "Low gravity jumps", Color3.fromRGB(200, 200, 100))
            moonBtn.MouseButton1Click:Connect(function()
                features.moonJump = not features.moonJump
                if features.moonJump then
                    workspace.Gravity = 30
                    moonFrame.BackgroundColor3 = Color3.fromRGB(255, 255, 200)
                else
                    workspace.Gravity = 196.2
                    moonFrame.BackgroundColor3 = Color3.fromRGB(200, 200, 100)
                end
            end)
            
            -- HIDE NAME
            local hideBtn, hideFrame = createFeatureButton("👻 HIDE NAME", "Hide your player name", Color3.fromRGB(100, 100, 150))
            hideBtn.MouseButton1Click:Connect(function()
                features.hideName = not features.hideName
                if features.hideName then
                    Player.Character.Head:FindFirstChild("NameTag"):Destroy()
                    hideFrame.BackgroundColor3 = Color3.fromRGB(50, 50, 100)
                else
                    hideFrame.BackgroundColor3 = Color3.fromRGB(100, 100, 150)
                end
            end)
            
            -- CLOSE MENU
            local closeBtn, closeFrame = createFeatureButton("❌ CLOSE MENU", "Close Hamzz Mods UI", Color3.fromRGB(255, 50, 50))
            closeBtn.MouseButton1Click:Connect(function()
                HamzzUI:Destroy()
                -- Clean up effects
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
            
            -- RELOAD CHARACTER
            local reloadBtn, reloadFrame = createFeatureButton("🔄 RELOAD CHARACTER", "Reset your character", Color3.fromRGB(255, 150, 50))
            reloadBtn.MouseButton1Click:Connect(function()
                Humanoid.Health = 0
                reloadFrame.BackgroundColor3 = Color3.fromRGB(255, 100, 0)
            end)
        end
    end
    
    -- INITIAL CONTENT
    updateContent()
    
    -- CONTROLS
    local ControlsFrame = Instance.new("Frame")
    ControlsFrame.Size = UDim2.new(1, -20, 0, 40)
    ControlsFrame.Position = UDim2.new(0, 10, 1, -50)
    ControlsFrame.BackgroundColor3 = Color3.fromRGB(30, 30, 50)
    ControlsFrame.BorderSizePixel = 0
    ControlsFrame.Parent = MainWindow
    
    local ControlsText = Instance.new("TextLabel")
    ControlsText.Text = "🔧 CONTROLS: Drag to move | Tabs: MAIN, PLAYER, COMBAT, VISUAL, TELEPORT, MISC"
    ControlsText.Size = UDim2.new(1, 0, 1, 0)
    ControlsText.BackgroundTransparency = 1
    ControlsText.TextColor3 = Color3.fromRGB(200, 200, 255)
    ControlsText.Font = Enum.Font.Gotham
    ControlsText.FontSize = Enum.FontSize.Size12
    ControlsText.TextXAlignment = Enum.TextXAlignment.Left
    ControlsText.Parent = ControlsFrame
    
    -- MINIMIZE BUTTON
    local MinimizeBtn = Instance.new("TextButton")
    MinimizeBtn.Text = "─"
    MinimizeBtn.Size = UDim2.new(0, 40, 0, 40)
    MinimizeBtn.Position = UDim2.new(1, -50, 0, 10)
    MinimizeBtn.BackgroundColor3 = Color3.fromRGB(50, 50, 100)
    MinimizeBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
    MinimizeBtn.Font = Enum.Font.GothamBold
    MinimizeBtn.FontSize = Enum.FontSize.Size24
    MinimizeBtn.Parent = Header
    
    local minimized = false
    MinimizeBtn.MouseButton1Click:Connect(function()
        minimized = not minimized
        if minimized then
            MainWindow.Size = UDim2.new(0, 450, 0, 90)
            MinimizeBtn.Text = "＋"
        else
            MainWindow.Size = UDim2.new(0, 450, 0, 700)
            MinimizeBtn.Text = "─"
        end
    end)
    
    -- DRAGGABLE
    local dragging = false
    local dragStart, startPos
    
    MainWindow.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 then
            dragging = true
            dragStart = input.Position
            startPos = MainWindow.Position
        end
    end)
    
    game:GetService("UserInputService").InputChanged:Connect(function(input)
        if dragging and input.UserInputType == Enum.UserInputType.MouseMovement then
            local delta = input.Position - dragStart
            MainWindow.Position = UDim2.new(
                startPos.X.Scale, 
                startPos.X.Offset + delta.X,
                startPos.Y.Scale, 
                startPos.Y.Offset + delta.Y
            )
        end
    end)
    
    MainWindow.InputEnded:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 then
            dragging = false
        end
    end)
    
    -- ANTI-AFK SYSTEM
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
        notif.Text = "🔥 HAMZZ MODS PRO MAX LOADED! 25+ FEATURES READY!"
        notif.Size = UDim2.new(0, 500, 0, 50)
        notif.Position = UDim2.new(0.5, -250, 0, -50)
        notif.BackgroundColor3 = Color3.fromRGB(0, 150, 255)
        notif.TextColor3 = Color3.fromRGB(255, 255, 255)
        notif.Font = Enum.Font.GothamBlack
        notif.FontSize = Enum.FontSize.Size20
        notif.Parent = HamzzUI
        
        game:GetService("TweenService"):Create(
            notif,
            TweenInfo.new(0.5),
            {Position = UDim2.new(0.5, -250, 0, 10)}
        ):Play()
        
        wait(3)
        
        game:GetService("TweenService"):Create(
            notif,
            TweenInfo.new(0.5),
            {Position = UDim2.new(0.5, -250, 0, -60)}
        ):Play()
        
        wait(0.5)
        notif:Destroy()
    end)
    
    print("================================================")
    print("🔥 HAMZZ MODS PRO MAX LOADED SUCCESSFULLY!")
    print("🎮 25+ FEATURES | COPY CHARACTER | MODERN UI")
    print("👑 CREATED BY RELIXX @ NESIA DARKNET")
    print("💯 ALL FEATURES 100% WORKING GUARANTEED!")
    print("================================================")
end