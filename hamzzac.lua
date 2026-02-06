--[[
    🏛️ HamzzScript: THE TRILOGY ENGINE (V4.2)
    OWNER: MASTER IKYY ☠️😈
    FEATURE: ABSOLUTE IMMORTAL (KEBAL)
]]

local lp = game.Players.LocalPlayer
local runService = game:GetService("RunService")

-- [[ 1. METATABLE HOOK: LOCK HEALTH ]]
-- Ini buat "nipu" game biar gak bisa ngurangin darah lo
local mt = getrawmetatable(game)
local old_newindex = mt.__newindex
setreadonly(mt, false)

mt.__newindex = newcclosure(function(t, k, v)
    if _G.KebalAktif and t:IsA("Humanoid") and k == "Health" then
        if v < t.MaxHealth then
            v = t.MaxHealth -- Paksa darah selalu penuh
        end
    end
    return old_newindex(t, k, v)
end)
setreadonly(mt, true)

-- [[ 2. UI CONTROL - SIMPLE & FAST ]]
local sg = Instance.new("ScreenGui", game:GetService("CoreGui"))
local frame = Instance.new("Frame", sg)
frame.Size = UDim2.new(0, 200, 0, 150)
frame.Position = UDim2.new(0.5, -100, 0.5, -75)
frame.BackgroundColor3 = Color3.fromRGB(30, 0, 0)
frame.Active = true
frame.Draggable = true

local title = Instance.new("TextLabel", frame)
title.Size = UDim2.new(1, 0, 0, 30)
title.Text = "HAMZZ IMMORTAL | IKYY"
title.BackgroundColor3 = Color3.fromRGB(150, 0, 0)
title.TextColor3 = Color3.new(1, 1, 1)

local function CreateBtn(txt, pos, cb)
    local btn = Instance.new("TextButton", frame)
    btn.Size = UDim2.new(0.9, 0, 0, 40)
    btn.Position = UDim2.new(0.05, 0, 0, pos)
    btn.Text = txt
    btn.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
    btn.TextColor3 = Color3.white
    btn.MouseButton1Click:Connect(cb)
    return btn
end

-- [[ TOMBOL KEBAL ]]
CreateBtn("AKTIFIN KEBAL (OFF)", 40, function(self)
    _G.KebalAktif = not _G.KebalAktif
    if _G.KebalAktif then
        self.Text = "KEBAL (ON)"
        self.BackgroundColor3 = Color3.fromRGB(0, 150, 0)
        
        -- Kunci state biar gak bisa mati (Dead State Disable)
        task.spawn(function()
            while _G.KebalAktif do
                task.wait()
                pcall(function()
                    lp.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Dead, false)
                    lp.Character.Humanoid.Health = lp.Character.Humanoid.MaxHealth
                    -- Hapus efek damage (darah merah di layar)
                    if lp.PlayerGui:FindFirstChild("BloodGui") then -- Sesuaikan nama Gui damage gamenya
                        lp.PlayerGui.BloodGui.Enabled = false
                    end
                end)
            end
        end)
    else
        self.Text = "KEBAL (OFF)"
        self.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
        lp.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Dead, true)
    end
end)

-- [[ TOMBOL ANTI-STUN ]]
CreateBtn("ANTI STUN / FREEZE", 90, function()
    runService.Stepped:Connect(function()
        if _G.KebalAktif and lp.Character then
            for _, v in pairs(lp.Character:GetDescendants()) do
                if v:IsA("BasePart") then v.CanCollide = true end
                if v:IsA("Humanoid") then v.PlatformStand = false end
            end
        end
    end)
end)

print("Immortal Script V4.2 Loaded! Sikat Jembot!")
