--[[
    🏛️ HamzzScript: THE TRILOGY ENGINE (V3.2)
    OWNER: MASTER IKYY ☠️😈
    UPDATE: METATABLE BLOOD LOCK (NO DAMAGE TAKEN)
]]

local lp = game.Players.LocalPlayer
local runService = game:GetService("RunService")
local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

-- [[ ABSOLUTE BLOOD LOCK BYPASS ]]
-- Teknik ini nge-hook sistem internal Roblox biar darah gak bisa diubah turun
local mt = getrawmetatable(game)
local old_newindex = mt.__newindex
setreadonly(mt, false)

mt.__newindex = newcclosure(function(t, k, v)
    if _G.AbsoluteImmortal and t:IsA("Humanoid") and k == "Health" then
        -- Kalau ada yang coba ngurangin darah, kita paksa balik ke MaxHealth
        if v < t.MaxHealth then
            v = t.MaxHealth
        end
    end
    return old_newindex(t, k, v)
end)
setreadonly(mt, true)

local Window = Rayfield:CreateWindow({
   Name = "HamzzScript | V3.2 Blood Lock 🩸",
   LoadingTitle = "LOCKING VITAL SIGNS...",
   LoadingSubtitle = "Master Ikyy God Mode",
})

-- [[ TAB 1: COMBAT ]]
local Tab1 = Window:CreateTab("Combat ⚔️")
Tab1:CreateToggle({
   Name = "DAMAGE AURA (Optimized)",
   CurrentValue = false,
   Callback = function(v)
      _G.ActiveAura = v
      task.spawn(function()
         while _G.ActiveAura do
            task.wait(0.2)
            pcall(function()
               local dist = _G.AuraDist or 50
               for _, obj in pairs(workspace:GetDescendants()) do
                  if obj:IsA("Humanoid") and obj.Parent ~= lp.Character then
                     local hrp = obj.Parent:FindFirstChild("HumanoidRootPart")
                     if hrp and (hrp.Position - lp.Character.HumanoidRootPart.Position).Magnitude < dist then
                        for _, rem in pairs(game:GetService("ReplicatedStorage"):GetDescendants()) do
                           if rem:IsA("RemoteEvent") and (rem.Name:lower():find("attack") or rem.Name:lower():find("hit")) then
                              rem:FireServer(obj.Parent)
                           end
                        end
                     end
                  end
               end
            end)
         end
      end)
   end,
})

Tab1:CreateSlider({
   Name = "Aura Radius",
   Range = {10, 300},
   Increment = 10,
   CurrentValue = 50,
   Callback = function(v) _G.AuraDist = v end,
})

-- [[ TAB 2: SURVIVAL ]]
local Tab2 = Window:CreateTab("Survival 🛡️")

Tab2:CreateToggle({
   Name = "GOD MODE (BLOOD LOCK 100%)",
   CurrentValue = false,
   Callback = function(v)
      _G.AbsoluteImmortal = v
      if v then
         lp.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Dead, false)
         -- Paksa darah penuh saat diaktifkan
         lp.Character.Humanoid.Health = lp.Character.Humanoid.MaxHealth
         
         _G.LockLoop = runService.Heartbeat:Connect(function()
            pcall(function()
               -- Tambahan proteksi fisik
               for _, p in pairs(lp.Character:GetChildren()) do
                  if p:IsA("BasePart") then 
                     p.CanTouch = false 
                     p.CanQuery = false
                  end
               end
            end)
         end)
         Rayfield:Notify({Title = "HamzzScript", Content = "Blood Locked! You are Immortal.", Duration = 3})
      else
         if _G.LockLoop then _G.LockLoop:Disconnect() end
         lp.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Dead, true)
      end
   end,
})

Tab2:CreateToggle({
   Name = "GHOST INVISIBLE",
   CurrentValue = false,
   Callback = function(v)
      for _, p in pairs(lp.Character:GetDescendants()) do
         if p:IsA("BasePart") or p:IsA("Decal") then
            p.Transparency = v and 1 or 0
         end
      end
   end,
})

-- [[ TAB 3: MISC ]]
local Tab3 = Window:CreateTab("Misc ⚙️")

Tab3:CreateToggle({
   Name = "NOCLIP",
   CurrentValue = false,
   Callback = function(v)
      _G.Nc = v
      runService.Stepped:Connect(function()
         if _G.Nc and lp.Character then
            for _, p in pairs(lp.Character:GetDescendants()) do
               if p:IsA("BasePart") then p.CanCollide = false end
            end
         end
      end)
   end,
})

Tab3:CreateSlider({
   Name = "Nitro Speed",
   Range = {16, 500},
   Increment = 10,
   CurrentValue = 16,
   Callback = function(v)
      _G.SpdVal = v
      if _G.SpdLoop then _G.SpdLoop:Disconnect() end
      _G.SpdLoop = runService.Heartbeat:Connect(function()
         if lp.Character then lp.Character.Humanoid.WalkSpeed = _G.SpdVal end
      end)
   end,
})

Tab3:CreateButton({
   Name = "REJOIN SERVER",
   Callback = function() game:GetService("TeleportService"):Teleport(game.PlaceId, lp) end,
})

-- [[ FLOATING BUTTON ]]
pcall(function() if game:GetService("CoreGui"):FindFirstChild("HamzzFinalUI") then game:GetService("CoreGui").HamzzFinalUI:Destroy() end end)
local SG = Instance.new("ScreenGui", game:GetService("CoreGui")) SG.Name = "HamzzFinalUI"
local TB = Instance.new("TextButton", SG)
TB.Size = UDim2.new(0, 45, 0, 45) TB.Position = UDim2.new(0, 15, 0.5, 0)
TB.Text = "H" TB.BackgroundColor3 = Color3.fromRGB(10,10,10) TB.TextColor3 = Color3.fromRGB(200,255,0)
Instance.new("UIStroke", TB).Color = Color3.fromRGB(200,255,0)
Instance.new("UICorner", TB).CornerRadius = UDim.new(1, 0)
TB.MouseButton1Click:Connect(function()
    local target = game:GetService("CoreGui"):FindFirstChild("RayfieldGui")
    if target then target.Enabled = not target.Enabled end
end)

Rayfield:Notify({Title = "HamzzScript", Content = "V3.2 Blood Lock Ready!", Duration = 5})         lp.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Dead, true)
      end
   end,
})

Tab2:CreateToggle({
   Name = "INVISIBLE GHOST",
   CurrentValue = false,
   Callback = function(v)
      for _, part in pairs(lp.Character:GetDescendants()) do
         if part:IsA("BasePart") or part:IsA("Decal") then
            part.Transparency = v and 1 or 0
         end
      end
   end,
})

Tab2:CreateButton({
   Name = "DELETE TSUNAMI (Map Clean) 🌊",
   Callback = function()
      for _, v in pairs(workspace:GetDescendants()) do
         if v:IsA("BasePart") and (v.Name:lower():find("tsunami") or v.Name:lower():find("water")) then
            v:Destroy()
         end
      end
      workspace.Terrain:Clear()
   end,
})

-- [[ TAB 3: UTILITY & MISC ]]
local Tab3 = Window:CreateTab("Misc ⚙️")
Tab3:CreateSection("Movement & Optimization")

Tab3:CreateSlider({
   Name = "Nitro Speed (Maksa)",
   Range = {16, 1000},
   Increment = 20,
   CurrentValue = 16,
   Callback = function(v)
      _G.SpdValue = v
      if _G.SpdLoop then _G.SpdLoop:Disconnect() end
      _G.SpdLoop = runService.Heartbeat:Connect(function()
         pcall(function() lp.Character.Humanoid.WalkSpeed = _G.SpdValue end)
      end)
   end,
})

Tab3:CreateToggle({
   Name = "NOCLIP",
   CurrentValue = false,
   Callback = function(v)
      _G.Noclip = v
      runService.Stepped:Connect(function()
         if _G.Noclip then
            for _, p in pairs(lp.Character:GetDescendants()) do
               if p:IsA("BasePart") then p.CanCollide = false end
            end
         end
      end)
   end,
})

Tab3:CreateButton({
   Name = "FPS BOOSTER (Anti-Lag)",
   Callback = function()
      for _, v in pairs(workspace:GetDescendants()) do
         if v:IsA("BasePart") and not v.Parent:FindFirstChild("Humanoid") then
            v.Material = Enum.Material.SmoothPlastic
         elseif v:IsA("Decal") then v:Destroy() end
      end
   end,
})

Tab3:CreateButton({
   Name = "REJOIN SERVER",
   Callback = function() game:GetService("TeleportService"):Teleport(game.PlaceId, lp) end,
})

-- [[ FLOATING BUTTON ]]
pcall(function() if game:GetService("CoreGui"):FindFirstChild("HamzzFinalUI") then game:GetService("CoreGui").HamzzFinalUI:Destroy() end end)
local SG = Instance.new("ScreenGui", game:GetService("CoreGui")) SG.Name = "HamzzFinalUI"
local TB = Instance.new("TextButton", SG)
TB.Size = UDim2.new(0, 45, 0, 45) TB.Position = UDim2.new(0, 15, 0.5, 0)
TB.Text = "H" TB.BackgroundColor3 = Color3.fromRGB(10,10,10) TB.TextColor3 = Color3.fromRGB(200,255,0)
Instance.new("UIStroke", TB).Color = Color3.fromRGB(200,255,0)
Instance.new("UICorner", TB).CornerRadius = UDim.new(1, 0)
TB.MouseButton1Click:Connect(function()
    local target = game:GetService("CoreGui"):FindFirstChild("RayfieldGui")
    if target then target.Enabled = not target.Enabled end
end)

Rayfield:Notify({Title = "HamzzScript", Content = "V2.7 MERGED & FIXED, Ikyy!", Duration = 5})Tab3:CreateSlider({
   Name = "Nitro Speed (Brute Force)",
   Range = {16, 500},
   Increment = 5,
   CurrentValue = 16,
   Callback = function(v)
      _G.SpeedValue = v
      -- Putusin loop lama kalau ada
      if _G.SpeedConnection then _G.SpeedConnection:Disconnect() end
      
      -- Bikin loop baru yang jalan tiap frame (Sangat Kencang)
      _G.SpeedConnection = runService.RenderStepped:Connect(function()
         pcall(function()
            if lp.Character and lp.Character:FindFirstChild("Humanoid") then
               lp.Character.Humanoid.WalkSpeed = _G.SpeedValue
            end
         end)
      end)
   end,
})

Tab3:CreateToggle({
   Name = "FLY MODE (Immortal Fly)",
   CurrentValue = false,
   Flag = "FlyMode",
   Callback = function(v)
      _G.Fly = v
      local char = lp.Character
      local root = char:FindFirstChild("HumanoidRootPart")
      if v then
         local bg = Instance.new("BodyGyro", root)
         bg.P = 9e4
         bg.maxTorque = Vector3.new(9e9, 9e9, 9e9)
         local bv = Instance.new("BodyVelocity", root)
         bv.maxForce = Vector3.new(9e9, 9e9, 9e9)
         task.spawn(function()
            while _G.Fly do
               task.wait()
               pcall(function()
                  char.Humanoid.PlatformStand = true
                  local dir = (workspace.CurrentCamera.CFrame.lookVector * (mouse.Hit.p - root.Position).unit * 50)
                  bv.velocity = Vector3.new(dir.X, dir.Y, dir.Z)
                  bg.cframe = workspace.CurrentCamera.CFrame
               end)
            end
            bg:Destroy() bv:Destroy()
            char.Humanoid.PlatformStand = false
         end)
      end
   end,
})

Tab3:CreateToggle({
   Name = "NOCLIP (Wall Pass)",
   CurrentValue = false,
   Flag = "Noclip",
   Callback = function(v)
      _G.Noclip = v
      if v then
         _G.NoclipLoop = runService.Stepped:Connect(function()
            if _G.Noclip then
               pcall(function()
                  for _, part in pairs(lp.Character:GetDescendants()) do
                     if part:IsA("BasePart") then part.CanCollide = false end
                  end
               end)
            else
               _G.NoclipLoop:Disconnect()
            end
         end)
      end
   end,
})

-- [[ FLOATING BUTTON ]]
pcall(function() if game:GetService("CoreGui"):FindFirstChild("HamzzFinalUI") then game:GetService("CoreGui").HamzzFinalUI:Destroy() end end)
local SG = Instance.new("ScreenGui", game:GetService("CoreGui")) SG.Name = "HamzzFinalUI"
local TB = Instance.new("TextButton", SG)
TB.Size = UDim2.new(0, 45, 0, 45) TB.Position = UDim2.new(0, 15, 0.5, 0)
TB.Text = "H" TB.BackgroundColor3 = Color3.fromRGB(10,10,10) TB.TextColor3 = Color3.fromRGB(200,255,0)
Instance.new("UIStroke", TB).Color = Color3.fromRGB(200,255,0)
Instance.new("UICorner", TB).CornerRadius = UDim.new(1, 0)
TB.MouseButton1Click:Connect(function()
    local target = game:GetService("CoreGui"):FindFirstChild("RayfieldGui")
    if target then target.Enabled = not target.Enabled end
end)

Rayfield:Notify({Title = "HamzzScript", Content = "V1.8 Nitro Fixed!", Duration = 5})
