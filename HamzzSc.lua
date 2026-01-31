-- [[ HamzzScript - Mode Iblis ]] --
local lp = game.Players.LocalPlayer
local char = lp.Character or lp.CharacterAdded:Wait()

-- GOD MODE: MATIIN CONNECTION DAMAGE 😈
-- Kita putus jalur komunikasi server yang bilang lo "Sakit"
local function GodMode()
    local humanoid = char:FindFirstChildOfClass("Humanoid")
    if humanoid then
        humanoid:SetStateEnabled(Enum.HumanoidStateType.Dead, false)
        humanoid.MaxHealth = 1e5
        humanoid.Health = 1e5
        
        -- Hapus skrip yang ngatur damage kalau ada
        for _, v in pairs(char:GetDescendants()) do
            if v:IsA("Script") and (v.Name:lower():find("damage") or v.Name:lower():find("health")) then
                v.Disabled = true
            end
        end
    end
end

-- DAMAGE AURA: BYPASS & KILL LOOP ☠️
-- Kita gak cuma ngurangin darah, tapi paksa posisi musuh kena hit
spawn(function()
    while task.wait(0.1) do
        pcall(function()
            for _, v in pairs(game.Players:GetPlayers()) do
                if v ~= lp and v.Character and v.Character:FindFirstChild("HumanoidRootPart") then
                    local dist = (v.Character.HumanoidRootPart.Position - char.HumanoidRootPart.Position).Magnitude
                    if dist < 25 then
                        -- Metode Paksa: Kirim signal bertubi-tubi 😍
                        local tool = lp.Character:FindFirstChildOfClass("Tool")
                        if tool then
                            tool:Activate() -- Paksa pake senjata
                        end
                        -- Paksa kurangi darah lewat Humanoid (Client-Side Exploit)
                        v.Character.Humanoid.Health = v.Character.Humanoid.Health - 20
                        v.Character.Humanoid.Parent.HumanoidRootPart.CFrame = v.Character.HumanoidRootPart.CFrame * CFrame.new(0, -0.5, 0) -- Bikin musuh glitch 😈
                    end
                end
            end
        end)
    end
end)

GodMode()
print("HamzzScript Brutal Aktif! Gak jalan? Kita ancurin script gamenya sekalian, Ikyy! ☠️🔥")
