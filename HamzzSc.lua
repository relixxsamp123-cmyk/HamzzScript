-- ======================================================
-- 🏛️ IKYY DARKNET: V18 APOCALYPSE SYSTEM 🏛️
-- THEME: ANCIENT HACKER - 100+ MODULES SUNTIKAN ☠️😈
-- ======================================================

local ScreenGui = Instance.new("ScreenGui")
local Frame = Instance.new("Frame")
local TitleLabel = Instance.new("TextLabel")
local StatusLabel = Instance.new("TextLabel")
local BarBack = Instance.new("Frame")
local Bar = Instance.new("Frame")
local UIStroke = Instance.new("UIStroke")

ScreenGui.Parent = game:GetService("CoreGui")
Frame.Parent = ScreenGui
Frame.BackgroundColor3 = Color3.fromRGB(5, 5, 5)
Frame.Position = UDim2.new(0.5, -250, 0.5, -125)
Frame.Size = UDim2.new(0, 500, 0, 250)
UIStroke.Parent = Frame
UIStroke.Thickness = 2
UIStroke.Color = Color3.fromRGB(0, 255, 0)

TitleLabel.Parent = Frame
TitleLabel.BackgroundTransparency = 1
TitleLabel.Position = UDim2.new(0, 0, 0.1, 0)
TitleLabel.Size = UDim2.new(1, 0, 0.3, 0)
TitleLabel.Font = Enum.Font.Code
TitleLabel.Text = "=== IKYY DARKNET MULTIVERSE APOCALYPSE SYSTEM V18 ==="
TitleLabel.TextColor3 = Color3.fromRGB(0, 255, 0)
TitleLabel.TextSize = 18

StatusLabel.Parent = Frame
StatusLabel.BackgroundTransparency = 1
StatusLabel.Position = UDim2.new(0, 0, 0.45, 0)
StatusLabel.Size = UDim2.new(1, 0, 0.2, 0)
StatusLabel.Font = Enum.Font.Code
StatusLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
StatusLabel.TextSize = 14
StatusLabel.Text = ""

local function typewrite(label, text)
    for i = 1, #text do
        label.Text = string.sub(text, 1, i)
        task.wait(0.01)
    end
end

BarBack.Parent = Frame
BarBack.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
BarBack.Position = UDim2.new(0.1, 0, 0.75, 0)
BarBack.Size = UDim2.new(0.8, 0, 0, 10)
Bar.Parent = BarBack
Bar.BackgroundColor3 = Color3.fromRGB(0, 255, 0)
Bar.Size = UDim2.new(0, 0, 1, 0)

spawn(function()
    typewrite(StatusLabel, "> INJECTING 100+ MALWARE SCRIPTS...\n> BYPASSING ROBLOX ENGINE...\n> WELCOME BACK MASTER IKYY!")
end)

Bar:TweenSize(UDim2.new(1, 0, 1, 0), "Out", "Linear", 2)
task.wait(2.5)
ScreenGui:Destroy()

-- [ STARTING LIBRARY ]
local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/xHeptc/Kavo-UI-Library/main/source.lua"))()
local Window = Library.CreateLib("IKYY APOCALYPSE V18 🌌", "Midnight")

-- [ TAB: MOVEMENT ]
local Tab1 = Window:NewTab("Movement")
local Sec1 = Tab1:NewSection("Bypass Physics")
Sec1:NewButton("Fly (Pencet E)", "Terbang", function() loadstring(game:HttpGet("https://raw.githubusercontent.com/XNEOFF/FlyGuiV3/main/FlyGuiV3.lua"))() end)
Sec1:NewToggle("Noclip", "Nembus Tembok", function(s)
    getgenv().Noclip = s
    game:GetService("RunService").Stepped:Connect(function()
        if getgenv().Noclip then pcall(function() for _, v in pairs(game.Players.LocalPlayer.Character:GetDescendants()) do if v:IsA("BasePart") then v.CanCollide = false end end end) end
    end)
end)
Sec1:NewSlider("WalkSpeed", "Lari", 500, 16, function(s) game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = s end)
Sec1:NewSlider("JumpPower", "Lompat", 500, 50, function(s) game.Players.LocalPlayer.Character.Humanoid.JumpPower = s end)
Sec1:NewButton("Infinite Jump", "Lompat Terus", function() game:GetService("UserInputService").JumpRequest:Connect(function() game.Players.LocalPlayer.Character:FindFirstChildOfClass("Humanoid"):ChangeState("Jumping") end) end)
Sec1:NewButton("Ctrl + Click TP", "Teleport pake mouse", function() local p = game.Players.LocalPlayer local m = p:GetMouse() m.Button1Down:Connect(function() if game:GetService("UserInputService"):IsKeyDown(Enum.KeyCode.LeftControl) then p.Character:MoveTo(m.Hit.p) end end) end)

-- [ TAB: COMBAT ]
local Tab2 = Window:NewTab("Combat")
local Sec2 = Tab2:NewSection("Killer Modules")
Sec2:NewToggle("Damage Aura (Kill)", "Aura Kematian", function(state)
    getgenv().DamageAura = state
    while getgenv().DamageAura do task.wait(0.1)
        pcall(function() for _, p in pairs(game.Players:GetPlayers()) do if p ~= game.Players.LocalPlayer and p.Character then local d = (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - p.Character.HumanoidRootPart.Position).Magnitude if d < 25 then p.Character.Humanoid:TakeDamage(20) end end end end)
    end
end)
Sec2:NewButton("Hitbox Expander", "Badan Musuh Gede", function() for _, v in pairs(game.Players:GetPlayers()) do if v ~= game.Players.LocalPlayer then pcall(function() v.Character.HumanoidRootPart.Size = Vector3.new(15,15,15) v.Character.HumanoidRootPart.Transparency = 0.5 v.Character.HumanoidRootPart.CanCollide = false end) end end end)
Sec2:NewButton("Aimbot (Universal)", "Ngeker Otomatis", function() loadstring(game:HttpGet("https://raw.githubusercontent.com/Exunys/Aimbot-V2/main/Resources/Scripts/Main.lua"))() end)

-- [ TAB: TROLL & SERVER ]
local Tab3 = Window:NewTab("Troll & Abuser")
local Sec3 = Tab3:NewSection("Server Destroyer")
Sec3:NewButton("Infinite Yield", "Admin Menu", function() loadstring(game:HttpGet('https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source'))() end)
Sec3:NewButton("Fling All", "Mentalin Semua Orang", function() loadstring(game:HttpGet("https://raw.githubusercontent.com/IkyyDarknet/Universal/main/FlingAll.lua"))() end)
Sec3:NewButton("Remove Tsunami/Water", "Hapus Air", function() pcall(function() for _, v in pairs(game.Workspace:GetDescendants()) do if v:IsA("BasePart") and (v.Name:lower():find("water") or v.Name:lower():find("tsunami")) then v:Destroy() end end game.Workspace.Terrain:Clear() end) end)
Sec3:NewToggle("Chat Spammer (HamzzMods)", "Spam Promosi", function(s) getgenv().Spam = s while getgenv().Spam do task.wait(3) game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest:FireServer("SUBSCRIBE YT: HamzzMods - IKYY HUB V18 IS HERE!", "All") end end)

-- [ TAB: VISUAL / ESP ]
local Tab4 = Window:NewTab("Visual / ESP")
local Sec4 = Tab4:NewSection("Hacker Vision")
Sec4:NewButton("ESP Name & Box", "Tembus Pandang", function() loadstring(game:HttpGet('https://raw.githubusercontent.com/IkyyDarknet/Universal/main/ESP.lua'))() end)
Sec4:NewButton("Fullbright", "Map Terang", function() game.Lighting.Brightness = 2 game.Lighting.ClockTime = 14 game.Lighting.FogEnd = 9e9 end)
Sec4:NewButton("X-Ray", "Hapus Tembok Map", function() for _, v in pairs(game.Workspace:GetDescendants()) do if v:IsA("BasePart") and not v.Parent:FindFirstChild("Humanoid") then v.Transparency = 0.5 end end end)

-- [ TAB: AUTO FARM & MISC ]
local Tab5 = Window:NewTab("Misc / Farm")
local Sec5 = Tab5:NewSection("Utility")
Sec5:NewToggle("Auto Clicker", "Klik Cepat", function(s) getgenv().Click = s while getgenv().Click do task.wait() game:GetService("VirtualUser"):ClickButton1(Vector2.new(0,0)) end end)
Sec5:NewButton("Anti-AFK", "Anti Kick", function() pcall(function() local vu = game:GetService("VirtualUser") game.Players.LocalPlayer.Idled:Connect(function() vu:Button2Down(Vector2.new(0,0),workspace.CurrentCamera.CFrame) task.wait(1) vu:Button2Up(Vector2.new(0,0),workspace.CurrentCamera.CFrame) end) end) end)
Sec5:NewButton("Server Hop", "Pindah Server", function() loadstring(game:HttpGet("https://raw.githubusercontent.com/IkyyDarknet/Universal/main/ServerHop.lua"))() end)

-- [ TOMBOL TOGGLE ]
if game:GetService("CoreGui"):FindFirstChild("IkyyToggle") then game:GetService("CoreGui").IkyyToggle:Destroy() end
local SG = Instance.new("ScreenGui")
local TB = Instance.new("TextButton")
local TS = Instance.new("UIStroke", TB)
SG.Name = "IkyyToggle"
SG.Parent = game:GetService("CoreGui")
TB.Parent = SG
TB.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
TB.Size = UDim2.new(0, 100, 0, 40)
TB.Position = UDim2.new(0, 10, 0.45, 0)
TB.Text = "IKYY HUB"
TB.TextColor3 = Color3.fromRGB(0, 255, 0)
TB.Font = Enum.Font.Code
TB.Draggable = true
TS.Color = Color3.fromRGB(0, 255, 0)
TS.Thickness = 2
TB.MouseButton1Click:Connect(function() Library:ToggleUI() end)
