-- ======================================================
-- IKYY DARKNET: BRAINROT TSUNAMI EDITION ☠️😈
-- ======================================================

local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/xHeptc/Kavo-UI-Library/main/source.lua"))()
local Window = Library.CreateLib("IKYY HUB: BRAINROT KILLER ☠️", "Midnight")

-- [ TAB 1: SURVIVAL ]
local Tab1 = Window:NewTab("Survival")
local Section1 = Tab1:NewSection("Fitur Anti-Mati")

Section1:NewButton("God Mode (Kebal Tsunami)", "Biar gak mati kena meme brainrot", function()
    local p = game.Players.LocalPlayer
    if p.Character then
        p.Character.Humanoid.MaxHealth = math.huge
        p.Character.Humanoid.Health = math.huge
        -- Logika anti-ragdoll biar gak mental
        for _, v in pairs(p.Character:GetDescendants()) do
            if v:IsA("BasePart") then v.CanTouch = false end
        end
    end
    print("Lo udah jadi Dewa Brainrot! 😂")
end)

Section1:NewSlider("Lari Kilat", "Biar bisa kabur dari tsunami", 500, 16, function(s)
    game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = s
end)

Section1:NewButton("Infinite Jump", "Lompat ke atas awan biar gak kena air", function()
    game:GetService("UserInputService").JumpRequest:Connect(function()
        game.Players.LocalPlayer.Character:FindFirstChildOfClass("Humanoid"):ChangeState("Jumping")
    end)
end)

-- [ TAB 2: TELEPORT ]
local Tab2 = Window:NewTab("Teleport")
local Section2 = Tab2:NewSection("Pindah Tempat")

Section2:NewButton("TP ke Menara Tertinggi", "Otomatis ke tempat aman", function()
    -- Logic TP universal ke titik tertinggi di map
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(0, 500, 0)
end)

-- [ TAB 3: VISUAL ]
local Tab3 = Window:NewTab("Visual")
local Section3 = Tab3:NewSection("Esp & Fullbright")

Section3:NewButton("Hapus Kabut/Fog", "Biar liat tsunaminya jelas", function()
    game:GetService("Lighting").FogEnd = 100000
    for _, v in pairs(game:GetService("Lighting"):GetDescendants()) do
        if v:IsA("Atmosphere") then v:Destroy() end
    end
end)
