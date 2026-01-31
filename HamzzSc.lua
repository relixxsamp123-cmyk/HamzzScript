-- [[ Hamzz Hub Script | Hydroxide Edition ]] --
-- [[ Credit: Hamzz Mods | User: Ikyy ]] --

-- Load Hydroxide (HamzzScript)
loadstring(game:HttpGet("https://raw.githubusercontent.com/Upbolt/Hydroxide/revision/init.lua"))()

-- [[ FITUR TAMBAHAN BY IKYY DARKNESS ]] --

-- 1. GOD MODE ANTI TSUNAMI (KEBAL TOTAL)
spawn(function()
    while true do
        pcall(function()
            local char = game.Players.LocalPlayer.Character
            if char and char:FindFirstChild("Humanoid") then
                -- Lock Darah & Hapus Deteksi Sentuhan Air
                char.Humanoid.MaxHealth = 9e9
                char.Humanoid.Health = 9e9
                for _, v in pairs(char:GetDescendants()) do
                    if v:IsA("TouchTransmitter") or v:IsA("TouchInterest") then
                        v:Destroy()
                    end
                end
            end
        end)
        task.wait(0.1)
    end
end)

-- 2. INSTALL STEAL (OTOMATIS RAMPOK ITEM SEKITAR)
spawn(function()
    while true do
        pcall(function()
            for _, p in pairs(game.Players:GetPlayers()) do
                if p ~= game.Players.LocalPlayer and p.Character then
                    -- Ambil barang di backpack
                    for _, tool in pairs(p.Backpack:GetChildren()) do
                        if tool:IsA("Tool") then tool.Parent = game.Players.LocalPlayer.Backpack end
                    end
                    -- Ambil barang yang lagi dipegang
                    for _, tool in pairs(p.Character:GetChildren()) do
                        if tool:IsA("Tool") then tool.Parent = game.Players.LocalPlayer.Backpack end
                    end
                end
            end
        end)
        task.wait(1) -- Cek tiap detik biar gak lag
    end
end)

-- 3. SPEED & NOCLIP
game:GetService("RunService").Stepped:Connect(function()
    pcall(function()
        local char = game.Players.LocalPlayer.Character
        if char then
            for _, v in pairs(char:GetDescendants()) do
                if v:IsA("BasePart") then v.CanCollide = false end
            end
            char.Humanoid.WalkSpeed = 100 -- Speed buat lari dari tsunami
        end
    end)
end)

print("Hamzz Hub & HamzzScript Active! Selamat merampok, Ikyy! 😈☠️")         end
      end
      Rayfield:Notify({Title = "Rampok Berhasil!", Content = "Semua item mereka jadi milik lo! 😈", Duration = 3})
   end,
})

TsunamiTab:CreateButton({
   Name = "Noclip (Bisa Jalan di Air)",
   Callback = function()
      _G.Noclip = true
      game:GetService("RunService").Stepped:Connect(function()
         if _G.Noclip then
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
