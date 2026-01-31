-- [[ HAMZZSCRIPT ULTIMATE FORCE UI - BY IKYY ]] --
-- RESET SEMUA UI LAMA 😈
pcall(function()
    for _, v in pairs(game.CoreGui:GetChildren()) do
        if v.Name == "HamzzScript_Premium" then v:Destroy() end
    end
end)

local lp = game.Players.LocalPlayer
local sg = Instance.new("ScreenGui")
sg.Name = "HamzzScript_Premium"
sg.Parent = game.CoreGui
sg.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

-- FRAME UTAMA (PASTI MUNCUL KONTOL) ☠️
local Main = Instance.new("Frame", sg)
Main.BackgroundColor3 = Color3.fromRGB(20, 0, 0)
Main.BorderSizePixel = 3
Main.Position = UDim2.new(0.5, -100, 0.2, 0)
Main.Size = UDim2.new(0, 200, 0, 250)
Main.Active = true
Main.Draggable = true -- Bisa lo geser! 😍

local Title = Instance.new("TextLabel", Main)
Title.Size = UDim2.new(1, 0, 0, 40)
Title.Text = "HAMZZ SCRIPT V4 ☠️"
Title.BackgroundColor3 = Color3.fromRGB(50, 0, 0)
Title.TextColor3 = Color3.fromRGB(255, 255, 255)
Title.Font = Enum.Font.GothamBold

-- [[ FUNGSI AUTO KILL & GOD MODE ]] --
spawn(function()
    while task.wait(0.01) do
        pcall(function()
            -- GOD MODE STUCK 😍
            lp.Character.Humanoid.MaxHealth = 9e9
            lp.Character.Humanoid.Health = 9e9
            
            -- DAMAGE AURA MAX RADIUS 😈
            for _, v in pairs(game.Players:GetPlayers()) do
                if v ~= lp and v.Character and v.Character:FindFirstChild("HumanoidRootPart") then
                    local dist = (v.Character.HumanoidRootPart.Position - lp.Character.HumanoidRootPart.Position).Magnitude
                    if dist < 300 then -- Radius lebih gila lagi!
                        v.Character.Humanoid.Health = -999
                        -- Coba tembak semua remote
                        for _, r in pairs(game:GetDescendants()) do
                            if r:IsA("RemoteEvent") and (r.Name:lower():find("hit") or r.Name:lower():find("attack")) then
                                r:FireServer(v.Character.Humanoid, math.huge)
                            end
                        end
                    end
                end
            end
        end)
    end
end)

-- [[ ESP: LIAT MUSUH TEMBUS TEMBOK ]] 😋
spawn(function()
    while task.wait(1) do
        for _, v in pairs(game.Players:GetPlayers()) do
            if v ~= lp and v.Character and not v.Character:FindFirstChild("HamzzESP") then
                local b = Instance.new("BoxHandleAdornment", v.Character)
                b.Name = "HamzzESP"
                b.Adornee = v.Character
                b.AlwaysOnTop = true
                b.ZIndex = 10
                b.Size = v.Character:GetExtentsSize()
                b.Transparency = 0.5
                b.Color3 = Color3.fromRGB(255, 0, 0)
            end
        end
    end
end)

print("HAMZZSCRIPT V4 FORCE LOADED! ☠️🔥")createButton("ACTIVATE GOD MODE ☠️", function()
    print("God Mode On!")
    spawn(function()
        while task.wait() do
            game.Players.LocalPlayer.Character.Humanoid.Health = 9e9
        end
    end)
end)

createButton("ACTIVATE DAMAGE AURA 😈", function()
    print("Aura On!")
    spawn(function()
        while task.wait(0.2) do
            for _, v in pairs(game.Players:GetPlayers()) do
                if v ~= game.Players.LocalPlayer and v.Character and v.Character:FindFirstChild("Humanoid") then
                    v.Character.Humanoid:TakeDamage(5)
                end
            end
        end
    end)
end)

createButton("SPEED HACK (X10) ⚡", function()
    game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = 100
end)

createButton("DESTROY UI ❌", function()
    ScreenGui:Destroy()
end)

print("Tampilan Baru HamzzScript Siap Tempur! ☠️🔥")
