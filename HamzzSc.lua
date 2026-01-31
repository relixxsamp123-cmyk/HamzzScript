-- [[ Hamzz Hub | Ultimate Tsunami God Mode ]] --
-- [[ Credit: Hamzz Mods | User: Ikyy ]] --

local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local Window = Rayfield:CreateWindow({
   Name = "Hamzz Hub | Tsunami Fix 🌊",
   LoadingTitle = "Mematikan Sensor Kematian...",
   LoadingSubtitle = "by Hamzz Mods",
   ConfigurationSaving = { Enabled = false },
   KeySystem = false
})

local TsunamiTab = Window:CreateTab("Anti-Die 🛡️", 4483362458)
local StealTab = Window:CreateTab("Stealer 💰", 4483362458)

-- [[ FEATURE: GOD MODE ANTI-DIE (FIXED) ]] --
TsunamiTab:CreateToggle({
   Name = "Kebal Tsunami (Invisible Body)",
   CurrentValue = false,
   Flag = "GodTsunami",
   Callback = function(Value)
      _G.GodTsunami = Value
      local plr = game.Players.LocalPlayer
      
      task.spawn(function()
         while _G.GodTsunami do
            pcall(function()
               local char = plr.Character
               if char then
                  -- Teknik 1: Hapus TouchInterest biar air gak bisa "nyentuh" lo
                  for _, part in pairs(char:GetDescendants()) do
                     if part:IsA("TouchTransmitter") or part:IsA("TouchInterest") then
                        part:Destroy()
                     end
                  end
                  -- Teknik 2: Lock HP di atas batas maksimal
                  char.Humanoid.MaxHealth = 9e9
                  char.Humanoid.Health = 9e9
               end
            end)
            task.wait(0.1)
         end
         -- Balikin normal (Reset buat fix HP)
         if not _G.GodTsunami then
            plr.Character.Humanoid.Health = 100
         end
      end)
      Rayfield:Notify({Title = "God Mode", Content = Value and "KEBAL TOTAL AKTIF! ☠️" or "Mode Lemah...", Duration = 3})
   end,
})

-- [[ FEATURE: INSTALL STEAL (ITEM RAMPOK) ]] --
StealTab:CreateButton({
   Name = "Install & Steal Inventory",
   Callback = function()
      local localPlr = game.Players.LocalPlayer
      for _, otherPlr in pairs(game.Players:GetPlayers()) do
         if otherPlr ~= localPlr then
            -- Cek Backpack
            for _, item in pairs(otherPlr.Backpack:GetChildren()) do
               if item:IsA("Tool") then
                  item.Parent = localPlr.Backpack
               end
            end
            -- Cek Character (Kalo lagi dipegang)
            if otherPlr.Character then
               for _, item in pairs(otherPlr.Character:GetChildren()) do
                  if item:IsA("Tool") then
                     item.Parent = localPlr.Backpack
                  end
               end
            end
         end
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
