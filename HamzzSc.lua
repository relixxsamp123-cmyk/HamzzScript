--[[
    🏛️ HamzzScript: THE TRILOGY ENGINE (V3.9)
    OWNER: MASTER IKYY ☠️😈
    FITUR: MAGNET COIN & DAMAGE AURA (SIMPLE EDITION)
]]

local lp = game.Players.LocalPlayer
local runService = game:GetService("RunService")

-- [[ SETUP UI SIMPEL - ANTI GAGAL ]]
local ScreenGui = Instance.new("ScreenGui", game:GetService("CoreGui"))
local MainFrame = Instance.new("Frame", ScreenGui)
local Title = Instance.new("TextLabel", MainFrame)
local UIList = Instance.new("UIListLayout", MainFrame)

MainFrame.Size = UDim2.new(0, 220, 0, 250)
MainFrame.Position = UDim2.new(0.5, -110, 0.5, -125)
MainFrame.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
MainFrame.BorderSizePixel = 2
MainFrame.Active = true
MainFrame.Draggable = true

Title.Size = UDim2.new(1, 0, 0, 35)
Title.Text = "HAMZZSCRIPT V3.9"
Title.TextColor3 = Color3.fromRGB(0, 255, 0)
Title.BackgroundColor3 = Color3.fromRGB(15, 15, 15)

UIList.Padding = UDim.new(0, 5)
UIList.HorizontalAlignment = Enum.HorizontalAlignment.Center

-- [[ FUNCTION BUTTON ]]
local function CreateToggle(txt, callback)
    local btn = Instance.new("TextButton", MainFrame)
    btn.Size = UDim2.new(0.9, 0, 0, 40)
    btn.Text = txt .. " [OFF]"
    btn.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
    btn.TextColor3 = Color3.white
    
    local active = false
    btn.MouseButton1Click:Connect(function()
        active = not active
        btn.Text = txt .. (active and " [ON]" or " [OFF]")
        btn.BackgroundColor3 = active and Color3.fromRGB(0, 150, 0) or Color3.fromRGB(45, 45, 45)
        callback(active)
    end)
end

-- [[ FITUR 1: MAGNET COIN ]]
CreateToggle("MAGNET COIN", function(v)
    _G.Magnet = v
    task.spawn(function()
        while _G.Magnet do
            task.wait(0.1)
            pcall(function()
                for _, item in pairs(workspace:GetDescendants()) do
                    -- Nyari objek yang namanya mengandung 'Coin', 'Gem', atau 'Money'
                    if item:IsA("BasePart") and (item.Name:find("Coin") or item.Name:find("Gem") or item.Name:find("Money") or item.Name:find("Drop")) then
                        item.CFrame = lp.Character.HumanoidRootPart.CFrame
                    end
                end
            end)
        end
    end)
end)

-- [[ FITUR 2: DAMAGE AURA ]]
CreateToggle("DAMAGE AURA", function(v)
    _G.Aura = v
    task.spawn(function()
        while _G.Aura do
            task.wait(0.3)
            pcall(function()
                for _, enemy in pairs(workspace:GetDescendants()) do
                    if enemy:IsA("Humanoid") and enemy.Parent ~= lp.Character then
                        local hrp = enemy.Parent:FindFirstChild("HumanoidRootPart")
                        if hrp and (hrp.Position - lp.Character.HumanoidRootPart.Position).Magnitude < 50 then
                            -- Spam Remote Attack
                            for _, rem in pairs(game:GetService("ReplicatedStorage"):GetDescendants()) do
                                if rem:IsA("RemoteEvent") and (rem.Name:lower():find("attack") or rem.Name:lower():find("hit")) then
                                    rem:FireServer(enemy.Parent)
                                end
                            end
                        end
                    end
                end
            end)
        end
    end)
end)

-- [[ FITUR 3: SPEED ]]
CreateToggle("SPEED NITRO", function(v)
    _G.Speed = v
    runService.Heartbeat:Connect(function()
        if _G.Speed and lp.Character then
            lp.Character.Humanoid.WalkSpeed = 100
        else
            lp.Character.Humanoid.WalkSpeed = 16
        end
    end)
end)

-- [[ CLOSE BUTTON ]]
local Close = Instance.new("TextButton", MainFrame)
Close.Size = UDim2.new(0.9, 0, 0, 30)
Close.Text = "TUTUP MENU"
Close.BackgroundColor3 = Color3.fromRGB(150, 0, 0)
Close.TextColor3 = Color3.white
Close.MouseButton1Click:Connect(function() ScreenGui:Destroy() end)

print("HamzzScript V3.9 Loaded!")   end,
})

Tab3:CreateToggle({
   Name = "NOCLIP (Pass Through)",
   CurrentValue = false,
   Callback = function(v)
      getgenv().Noclip = v
      runService.Stepped:Connect(function()
         if getgenv().Noclip and lp.Character then
            for _, p in pairs(lp.Character:GetDescendants()) do
               if p:IsA("BasePart") then p.CanCollide = false end
            end
         end
      end)
   end,
})

Tab3:CreateButton({
   Name = "Rejoin Server",
   Callback = function()
      game:GetService("TeleportService"):Teleport(game.PlaceId, lp)
   end,
})

-- [[ FLOATING BUTTON ]]
if game:GetService("CoreGui"):FindFirstChild("HamzzFinalUI") then game:GetService("CoreGui").HamzzFinalUI:Destroy() end
local SG = Instance.new("ScreenGui", game:GetService("CoreGui")) SG.Name = "HamzzFinalUI"
local TB = Instance.new("TextButton", SG)
TB.Size = UDim2.new(0, 45, 0, 45) TB.Position = UDim2.new(0, 15, 0.5, 0)
TB.Text = "H" TB.BackgroundColor3 = Color3.fromRGB(20,20,20) TB.TextColor3 = Color3.fromRGB(0,255,0)
local TS = Instance.new("UIStroke", TB) TS.Color = Color3.fromRGB(0,255,0) TS.Thickness = 2
local TC = Instance.new("UICorner", TB) TC.CornerRadius = UDim.new(1, 0)
TB.MouseButton1Click:Connect(function()
    local target = game:GetService("CoreGui"):FindFirstChild("RayfieldGui")
    if target then target.Enabled = not target.Enabled end
end)

Rayfield:Notify({Title = "HamzzScript", Content = "V3.6 Ready, Master Ikyy!", Duration = 5})       Name = "GOD MODE (BLOOD LOCK)",
       CurrentValue = false,
       Callback = function(v)
          _G.AbsoluteImmortal = v
          if v then
             lp.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Dead, false)
             _G.LockLoop = runService.Heartbeat:Connect(function()
                pcall(function()
                   for _, p in pairs(lp.Character:GetChildren()) do
                      if p:IsA("BasePart") then p.CanTouch = false p.CanQuery = false end
                   end
                end)
             end)
          else
             if _G.LockLoop then _G.LockLoop:Disconnect() end
          end
       end,
    })

    Tab2:CreateToggle({
       Name = "GHOST INVISIBLE",
       CurrentValue = false,
       Callback = function(v)
          for _, p in pairs(lp.Character:GetDescendants()) do
             if p:IsA("BasePart") or p:IsA("Decal") then p.Transparency = v and 1 or 0 end
          end
       end,
    })

    -- [[ TAB MISC ]]
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

    -- FLOATING BUTTON (BIAR GAK ILANG)
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

    Rayfield:Notify({Title = "HamzzScript", Content = "V3.3 Final Loaded, Ikyy!", Duration = 5})
end)
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
