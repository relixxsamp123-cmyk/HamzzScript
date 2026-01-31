-- [[ HAMZZSCRIPT V7: APOCALYPSE MODE - BY IKYY ]] --
local CoreGui = game:GetService("CoreGui")
pcall(function() CoreGui.HamzzScript_Premium:Destroy() end)

local sg = Instance.new("ScreenGui", CoreGui)
sg.Name = "HamzzScript_Premium"

local Main = Instance.new("Frame", sg)
Main.BackgroundColor3 = Color3.fromRGB(10, 0, 0)
Main.Size = UDim2.new(0, 250, 0, 320)
Main.Position = UDim2.new(0.5, -125, 0.3, 0)
Main.BorderSizePixel = 3
Main.BorderColor3 = Color3.fromRGB(255, 0, 0)
Main.Active = true
Main.Draggable = true

local Title = Instance.new("TextLabel", Main)
Title.Size = UDim2.new(1, 0, 0, 45)
Title.Text = "HAMZZ V7: APOCALYPSE ☠️"
Title.BackgroundColor3 = Color3.fromRGB(60, 0, 0)
Title.TextColor3 = Color3.fromRGB(255, 255, 255)
Title.TextSize = 18
Title.Font = Enum.Font.GothamBold

-- FUNGSI TOMBOL PEMBANTAI 😈
local function CreateBtn(name, pos, color, callback)
    local btn = Instance.new("TextButton", Main)
    btn.Size = UDim2.new(0.9, 0, 0, 50)
    btn.Position = UDim2.new(0.05, 0, 0, pos)
    btn.Text = name
    btn.BackgroundColor3 = color
    btn.TextColor3 = Color3.fromRGB(255, 255, 255)
    btn.Font = Enum.Font.GothamBold
    btn.TextSize = 14
    local corner = Instance.new("UICorner", btn)
    corner.CornerRadius = UDim.new(0, 10)
    btn.MouseButton1Click:Connect(callback)
end

-- 1. GOD MODE ABADI (Darah Gak Ngurang Jembot!) ☠️
CreateBtn("GOD MODE: ABADI 😈", 60, Color3.fromRGB(150, 0, 0), function()
    _G.GodMode = true
    print("God Mode Active, Ikyy! ☠️")
    spawn(function()
        while _G.GodMode do
            task.wait()
            pcall(function()
                local hum = game.Players.LocalPlayer.Character.Humanoid
                hum.MaxHealth = 999999
                hum.Health = 999999
                hum:SetStateEnabled(Enum.HumanoidStateType.Dead, false)
            end)
        end
    end)
end)

-- 2. MASSIVE DAMAGE AURA (Radius & Damage MAX) ☠️🔥
CreateBtn("AURA: DESTRUCTION ☠️", 125, Color3.fromRGB(200, 0, 0), function()
    _G.DamageAura = true
    print("Aura Active, Sikat Semua! 😈")
    spawn(function()
        while _G.DamageAura do
            task.wait(0.05)
            pcall(function()
                local lp = game.Players.LocalPlayer
                for _, v in pairs(game.Players:GetPlayers()) do
                    if v ~= lp and v.Character and v.Character:FindFirstChild("Humanoid") then
                        local dist = (v.Character.HumanoidRootPart.Position - lp.Character.HumanoidRootPart.Position).Magnitude
                        if dist < 500 then -- Radius Raksasa! 😍
                            -- Tembak Remote Brutal
                            for _, r in pairs(game:GetDescendants()) do
                                if r:IsA("RemoteEvent") and (r.Name:lower():find("hit") or r.Name:lower():find("attack") or r.Name:lower():find("damage")) then
                                    r:FireServer(v.Character.Humanoid, math.huge)
                                end
                            end
                            v.Character.Humanoid.Health = -100 -- Force Kill
                        end
                    end
                end
            end)
        end
    end)
end)

-- 3. SPEED & JUMP HACK ⚡
CreateBtn("BRUTAL SPEED & JUMP ⚡", 190, Color3.fromRGB(255, 0, 0), function()
    game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = 150
    game.Players.LocalPlayer.Character.Humanoid.JumpPower = 150
end)

-- 4. OFF SCRIPT ❌
CreateBtn("CLOSE & STOP ALL ❌", 255, Color3.fromRGB(40, 40, 40), function()
    _G.GodMode = false
    _G.DamageAura = false
    sg:Destroy()
end)

print("HAMZZSCRIPT V7: LOADED! DARAH ABADI + DAMAGE MAX SIAP! ☠️🔥")                b.Transparency = 0.5
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
