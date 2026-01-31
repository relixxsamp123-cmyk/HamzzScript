-- [[ HAMZZSCRIPT: GOD & BRUTAL DAMAGE - BY IKYY ]] --
local lp = game.Players.LocalPlayer
local char = lp.Character or lp.CharacterAdded:Wait()

-- AUTO-TOOL & REMOTE FINDER 😈
local function getAttackData()
    local tool = lp.Backpack:FindFirstChildOfClass("Tool") or char:FindFirstChildOfClass("Tool")
    local remote = nil
    for _, v in pairs(game:GetDescendants()) do
        if v:IsA("RemoteEvent") or v:IsA("RemoteFunction") then
            local n = v.Name:lower()
            if n:find("hit") or n:find("attack") or n:find("damage") or n:find("combat") then
                remote = v
                break
            end
        end
    end
    return tool, remote
end

-- LOOP UTAMA PEMBANTAIAN ☠️🔥
spawn(function()
    while task.wait(0.01) do -- Speed Iblis!
        pcall(function()
            local currentTool, killRemote = getAttackData()
            
            -- 1. MODE GOD BRUTAL (GAK BAKAL KURANG DARAHNYA) 😈
            if lp.Character and lp.Character:FindFirstChild("Humanoid") then
                lp.Character.Humanoid.MaxHealth = 999999
                lp.Character.Humanoid.Health = 999999
                -- Cegah mati konyol
                if lp.Character.Humanoid.Health < 100 then
                     lp.Character.Humanoid.Health = 999999
                end
            end

            -- 2. DAMAGE AURA MASSIVE (MAX DAMAGE) ☠️
            for _, v in pairs(game.Players:GetPlayers()) do
                if v ~= lp and v.Character and v.Character:FindFirstChild("HumanoidRootPart") then
                    local dist = (v.Character.HumanoidRootPart.Position - lp.Character.HumanoidRootPart.Position).Magnitude
                    
                    if dist <= 250 then -- Radius Raksasa
                        -- Paksa Pegang Senjata biar damage masuk! 😍
                        if currentTool and not char:FindFirstChild(currentTool.Name) then
                            lp.Character.Humanoid:EquipTool(currentTool)
                        end

                        -- Tembak Remote Server secara Brutal 😈
                        if killRemote then
                            if killRemote:IsA("RemoteEvent") then
                                killRemote:FireServer(v.Character.Humanoid, math.huge)
                                killRemote:FireServer(v.Character.HumanoidRootPart, math.huge)
                            else
                                killRemote:InvokeServer(v.Character.Humanoid, math.huge)
                            end
                        end

                        -- Override Health Musuh (Client-Side Kill) ☠️
                        v.Character.Humanoid.Health = -999999
                    end
                end
            end
        end)
    end
end)

print("HAMZZSCRIPT: GOD BRUTAL & DAMAGE MAX LOADED! SIKAT SEMUA KONTOL ITU, IKYY! ☠️🔥")    btnCorner.CornerRadius = UDim.new(0, 6)
    btnCorner.Parent = btn
    
    btn.MouseButton1Click:Connect(callback)
end

-- DAFTAR FITUR MAUT ☠️🔥
createButton("ACTIVATE GOD MODE ☠️", function()
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
