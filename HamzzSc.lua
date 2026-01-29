-- ======================================================
-- 🌌 IKYY DARKNET: UNIVERSAL MULTIVERSE V10 🌌
-- ADDED: REMOVE TSUNAMI (ANTI-BRAINROT) 🌊❌
-- ======================================================

-- [ LOADING SCREEN TETAP ADA ]
local ScreenGui = Instance.new("ScreenGui")
local MainFrame = Instance.new("Frame")
local Title = Instance.new("TextLabel")
local SubTitle = Instance.new("TextLabel")
local BarBackground = Instance.new("Frame")
local Bar = Instance.new("Frame")

ScreenGui.Parent = game:GetService("CoreGui")
MainFrame.Name = "LoadingFrame"
MainFrame.Parent = ScreenGui
MainFrame.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
MainFrame.Position = UDim2.new(0.5, -150, 0.5, -75)
MainFrame.Size = UDim2.new(0, 300, 0, 150)
MainFrame.BorderSizePixel = 0

Title.Parent = MainFrame
Title.Text = "IKYY UNIVERSAL HUB"
Title.TextColor3 = Color3.fromRGB(0, 255, 150)
Title.TextSize = 25
Title.Size = UDim2.new(1, 0, 0, 50)
Title.BackgroundTransparency = 1

SubTitle.Parent = MainFrame
SubTitle.Text = "SUBSCRIBE YT: HamzzMods"
SubTitle.TextColor3 = Color3.fromRGB(255, 255, 255)
SubTitle.TextSize = 18
SubTitle.Position = UDim2.new(0, 0, 0, 40)
SubTitle.Size = UDim2.new(1, 0, 0, 30)
SubTitle.BackgroundTransparency = 1

BarBackground.Parent = MainFrame
BarBackground.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
BarBackground.Position = UDim2.new(0.1, 0, 0.7, 0)
BarBackground.Size = UDim2.new(0.8, 0, 0, 10)

Bar.Parent = BarBackground
Bar.BackgroundColor3 = Color3.fromRGB(0, 255, 150)
Bar.Size = UDim2.new(0, 0, 1, 0)

Bar:TweenSize(UDim2.new(1, 0, 1, 0), "Out", "Linear", 3)
task.wait(3.5)
ScreenGui:Destroy()

-- [ MAIN UNIVERSAL SCRIPT ]
local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/xHeptc/Kavo-UI-Library/main/source.lua"))()
local Window = Library.CreateLib("IKYY UNIVERSAL V10 🌌", "DarkTheme")

-- [ TAB 1: BRAINROT SPECIAL ]
local TabSpecial = Window:NewTab("Brainrot Special")
local SectionSpecial = TabSpecial:NewSection("Tsunami Killer 🌊")

SectionSpecial:NewButton("Remove Tsunami (Hapus Air)", "Hapus semua air tsunami biar aman", function()
    pcall(function()
        -- Mencari part air/tsunami berdasarkan nama umum atau class
        for _, v in pairs(game.Workspace:GetDescendants()) do
            if v:IsA("BasePart") and (v.Name:lower():find("water") or v.Name:lower():find("tsunami") or v.Name:lower():find("wave")) then
                v:Destroy()
            end
        end
        -- Menghapus Terrain Water (jika game pake Terrain)
        game.Workspace.Terrain:Clear()
    end)
    print("Tsunami Dihapus! Santai aja sekarang, Ikyy. 😈")
end)

-- [ TAB 2: COMBAT ]
local TabCombat = Window:NewTab("Combat")
local SectionCombat = TabCombat:NewSection("Damage Aura")
SectionCombat:NewToggle("Damage Aura", "Bunuh musuh terdekat", function(state)
    getgenv().DamageAura = state
    while getgenv().DamageAura do
        task.wait(0.1)
        pcall(function()
            for _, player in pairs(game.Players:GetPlayers()) do
                if player ~= game.Players.LocalPlayer and player.Character then
                    local dist = (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - player.Character.HumanoidRootPart.Position).Magnitude
                    if dist < 15 then player.Character.Humanoid:TakeDamage(10) end
                end
            end
        end)
    end
end)

-- [ TAB 3: PLAYER ]
local Tab1 = Window:NewTab("Player")
local Section1 = Tab1:NewSection("Movement")
Section1:NewToggle("Noclip", "Nembus Tembok", function(s)
    getgenv().Noclip = s
    game:GetService("RunService").Stepped:Connect(function()
        if getgenv().Noclip then
            pcall(function()
                for _, v in pairs(game.Players.LocalPlayer.Character:GetDescendants()) do
                    if v:IsA("BasePart") then v.CanCollide = false end
                end
            end)
        end
    end)
end)

-- [ TOMBOL MENGAPUNG ]
local SG = Instance.new("ScreenGui")
local TB = Instance.new("TextButton")
SG.Parent = game:GetService("CoreGui")
TB.Parent = SG
TB.BackgroundColor3 = Color3.fromRGB(0, 255, 150)
TB.Size = UDim2.new(0, 90, 0, 30)
TB.Position = UDim2.new(0, 10, 0.4, 0)
TB.Text = "HamzzMods"
TB.Draggable = true
TB.MouseButton1Click:Connect(function() Library:ToggleUI() end)
