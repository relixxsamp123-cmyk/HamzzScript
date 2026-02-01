--[[
    🏛️ HamzzScript: THE TRILOGY ENGINE (V2.7)
    THEME: VOLT NITRO SPEED 🏎️⚡
    OWNER: MASTER IKYY ☠️😈
    STATUS: ALL FEATURES MERGED & FIXED (NO HEAL GOD MODE)
]]

local lp = game.Players.LocalPlayer
local runService = game:GetService("RunService")
local mouse = lp:GetMouse()
local uis = game:GetService("UserInputService")
local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local Window = Rayfield:CreateWindow({
   Name = "HamzzScript | V2.7 Final ⚡",
   LoadingTitle = "RE-AWAKENING IKYY...",
   LoadingSubtitle = "Shadow Monarch Edition",
   ConfigurationSaving = {Enabled = true, FolderName = "HamzzScriptConfigs", FileName = "IkyyHub"},
})

-- [[ TAB 1: COMBAT & SOLO LEVELING ]]
local Tab1 = Window:CreateTab("Combat ⚔️")
Tab1:CreateSection("Destruction & Aura")

Tab1:CreateToggle({
   Name = "MAX DAMAGE AURA (Full Map)",
   CurrentValue = false,
   Callback = function(v)
      _G.MaxAura = v
      task.spawn(function()
         while _G.MaxAura do
            runService.Heartbeat:Wait()
            pcall(function()
               for _, enemy in pairs(workspace:GetDescendants()) do
                  if enemy:IsA("Humanoid") and enemy.Parent ~= lp.Character then
                     local root = enemy.Parent:FindFirstChild("HumanoidRootPart")
                     if root and (root.Position - lp.Character.HumanoidRootPart.Position).Magnitude < 1000 then
                        for i = 1, 10 do
                           for _, r in pairs(game:GetService("ReplicatedStorage"):GetDescendants()) do
                              if r:IsA("RemoteEvent") and (r.Name:lower():find("hit") or r.Name:lower():find("attack") or r.Name:lower():find("damage")) then
                                 r:FireServer(enemy.Parent, math.huge)
                              end
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

-- [[ TAB 2: SURVIVAL & WORLD ]]
local Tab2 = Window:CreateTab("Survival 🛡️")
Tab2:CreateSection("Absolute Protection")

Tab2:CreateToggle({
   Name = "ABSOLUTE GOD (NO-HEAL)",
   CurrentValue = false,
   Callback = function(v)
      _G.AbsGod = v
      if v then
         lp.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Dead, false)
         _G.GodLoop = runService.Stepped:Connect(function()
            pcall(function()
               for _, p in pairs(lp.Character:GetChildren()) do
                  if p:IsA("BasePart") then p.CanTouch = false end
               end
            end)
         end)
      else
         if _G.GodLoop then _G.GodLoop:Disconnect() end
         lp.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Dead, true)
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
