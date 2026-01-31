-- [[ Hamzz Hub Script | Kavo Edition FIXED ]] --
-- [[ User: Ikyy - THE DARK BOSS ]] --

local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/xHeptc/Kavo-UI-Library/main/source.lua"))()
local Window = Library.CreateLib("Hamzz Hub Premium | Ikyy", "DarkTheme")

-- [[ LOAD SOURCE UTAMA ]] --
pcall(function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/relixxsamp123-cmyk/HamzzScript/refs/heads/main/HamzzSc.lua"))()
end)

-- [[ TABS ]] --
local Main = Window:NewTab("Main ⚔️")
local Section = Main:NewSection("Tsunami & Combat")

-- [[ GOD MODE ANTI MATI ]] --
Section:NewToggle("God Mode (Kebal Tsunami)", "Bikin lo gak bisa mati jembot!", function(state)
    _G.God = state
    task.spawn(function()
        while _G.God do
            pcall(function()
                local char = game.Players.LocalPlayer.Character
                char.Humanoid.MaxHealth = 9e9
                char.Humanoid.Health = 9e9
                for _, v in pairs(char:GetDescendants()) do
                    if v:IsA("TouchInterest") then v:Destroy() end
                end
            end)
            task.wait(0.1)
        end
    end)
end)

-- [[ STEALER ]] --
Section:NewButton("Install Stealer (Rampok)", "Ambil semua item player lain", function()
    for _, p in pairs(game.Players:GetPlayers()) do
        if p ~= game.Players.LocalPlayer then
            for _, t in pairs(p.Backpack:GetChildren()) do
                if t:IsA("Tool") then t.Parent = game.Players.LocalPlayer.Backpack end
            end
        end
    end
end)

-- [[ MOVEMENT ]] --
local Move = Window:NewTab("Movement 🚀")
local MoveSec = Move:NewSection("Speed & Fly")

MoveSec:NewSlider("WalkSpeed", "Lari kenceng jembot", 500, 16, function(s)
    game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = s
end)

MoveSec:NewButton("Fly (Press Q)", "Terbang kayak hantu", function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/XNEOFF/FlyGui/main/FlyGui.lua"))()
end)

print("IKYY, MENU SEKARANG PASTI MUNCUL! 😈☠️")         if _G.Noclip then
            for _, v in pairs(game.Players.LocalPlayer.Character:GetDescendants()) do
               if v:IsA("BasePart") then v.CanCollide = false end
            end
         end
      end)
   end,
})

Rayfield:Notify({Title = "FIXED!", Content = "Gak bakal mati lagi kena air, jembot! 😍☠️", Duration = 5})    btn.TextColor3 = Color3.fromRGB(255, 255, 255)
    btn.Text = name .. ": OFF"
    btn.Font = Enum.Font.GothamBold
    btn.TextSize = 13
    
    btnCorner.CornerRadius = UDim.new(0, 6)
    btnCorner.Parent = btn
    
    btn.MouseButton1Click:Connect(function()
        _G[var] = not _G[var]
        if _G[var] then
            btn.Text = name .. ": ON 😈"
            btn.BackgroundColor3 = Color3.fromRGB(150, 0, 0)
        else
            btn.Text = name .. ": OFF"
            btn.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
        end
    end)
end

-- Tambah Fitur ke Menu
createButton("GOD MODE ABADI ☠️", "God")
createButton("INFINITE DASH ⚡", "InfDash")
createButton("AURA DAMAGE MAX 😈", "Aura")

createButton("DESTROY UI ❌", "Destroy") -- Tombol destroy khusus

-- Logika Belakang Layar
spawn(function()
    while task.wait(0.01) do
        pcall(function()
            local char = lp.Character
            if char and char:FindFirstChild("Humanoid") then
                -- 1. God Mode
                if _G.God then
                    char.Humanoid.MaxHealth = 9e15
                    char.Humanoid.Health = 9e15
                end
                
                -- 2. Dash Tanpa Batas
                if _G.InfDash then
                    AbilityRemote:FireServer("DashSlot", "Start")
                end
                
                -- 3. Damage Aura Max Radius
                if _G.Aura then
                    for _, v in pairs(game.Workspace:GetDescendants()) do
                        if v:IsA("Humanoid") and not v:IsDescendantOf(char) then
                            local root = v.Parent:FindFirstChild("HumanoidRootPart")
                            if root and (root.Position - char.HumanoidRootPart.Position).Magnitude < 10000 then
                                AbilityRemote:FireServer("AttackSlot", "Start", v.Parent)
                                v.Health = -math.huge
                            end
                        end
                    end
                end
                
                -- Cleanup
                if _G.Destroy then
                    _G.God = false
                    _G.Aura = false
                    _G.InfDash = false
                    ScreenGui:Destroy()
                end
            end
        end)
    end
end)            pcall(function()
                lp.Character.Humanoid.MaxHealth = 9e9
                lp.Character.Humanoid.Health = 9e9
                lp.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Dead, false)
            end)
        end
    end)
end)

createButton("AURA DAMAGE MAX 😈", function()
    _G.Aura = true
    spawn(function()
        while _G.Aura do
            task.wait(0.1)
            pcall(function()
                for _, v in pairs(game.Players:GetPlayers()) do
                    if v ~= lp and v.Character and v.Character:FindFirstChild("HumanoidRootPart") then
                        local dist = (v.Character.HumanoidRootPart.Position - lp.Character.HumanoidRootPart.Position).Magnitude
                        if dist < 500 then
                            for _, r in pairs(game:GetDescendants()) do
                                if r:IsA("RemoteEvent") and (r.Name:lower():find("hit") or r.Name:lower():find("attack") or r.Name:lower():find("damage")) then
                                    r:FireServer(v.Character.Humanoid, math.huge)
                                end
                            end
                            v.Character.Humanoid.Health = -math.huge
                        end
                    end
                end
            end)
        end
    end)
end)

createButton("SPEED HACK (X10) ⚡", function()
    lp.Character.Humanoid.WalkSpeed = 100
end)

createButton("DESTROY UI ❌", function()
    _G.God = false
    _G.Aura = false
    ScreenGui:Destroy()
end)
