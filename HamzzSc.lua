--[[
    🏛️ HamzzScript: THE TRILOGY ENGINE 🏛️
    TAB 1: MAIN | TAB 2: VISUAL | TAB 3: MISC
    OWNER: MASTER IKYY ☠️😈
]]

local lp = game.Players.LocalPlayer
local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local Window = Rayfield:CreateWindow({
   Name = "HamzzScript | Gabut Menu 🌌",
   LoadingTitle = "BUILDING INTERFACE...",
   LoadingSubtitle = "Script By Ikyy X Rizal",
})

-- [[ TAB 1: MAIN MENU ]]
local Tab1 = Window:CreateTab("Main Menu 🛡️")
Tab1:CreateSection("God Mode & Survival")

Tab1:CreateToggle({
   Name = "TRUE GOD MODE (Anti-Damage)",
   CurrentValue = false,
   Callback = function(v)
      getgenv().TrueGod = v
      task.spawn(function()
         while getgenv().TrueGod do
            task.wait()
            pcall(function()
               if lp.Character and lp.Character:FindFirstChild("HumanoidRootPart") then
                  -- Floating Logic: Bikin lo gak napak biar script damage gak trigger
                  lp.Character.HumanoidRootPart.Velocity = Vector3.new(0, 0.1, 0)
                  if lp.Character:FindFirstChild("Humanoid") then
                      lp.Character.Humanoid.Health = 100
                  end
               end
            end)
         end
      end)
   end,
})

Tab1:CreateButton({
   Name = "ULTRA COLLECT (All Spots)",
   CurrentValue = false,
   Callback = function(v)
      getgenv().UltraFarm = v
      task.spawn(function()
         while getgenv().UltraFarm do
            task.wait(0.5)
            pcall(function()
               for i = 1, 20 do
                  if not getgenv().UltraFarm then break end
                  local args = {
                     [1] = "Collect Money",
                     [2] = "{c4466bc3-3d04-4575-afe0-564002c44233}",
                     [3] = tostring(i)
                  }
                  game:GetService("ReplicatedStorage"):WaitForChild("Packages"):WaitForChild("Net"):WaitForChild("RF/Plot.PlotAction"):InvokeServer(unpack(args))
               end
            end)
         end
      end)
   end,
})

-- [[ TAB 2: VISUAL ]]
local Tab2 = Window:CreateTab("Visual 👁️")
Tab2:CreateSection("World & Player ESP")

Tab2:CreateButton({
   Name = "SIMPLE ESP (Box)",
   Callback = function()
      for _, v in pairs(game.Players:GetPlayers()) do
         if v ~= lp and v.Character and not v.Character:FindFirstChild("Highlight") then
            local hi = Instance.new("Highlight", v.Character)
            hi.FillColor = Color3.fromRGB(255, 0, 0)
            hi.OutlineColor = Color3.fromRGB(255, 255, 255)
         end
      end
      Rayfield:Notify({Title = "HamzzScript", Content = "ESP Activated!", Duration = 2})
   end,
})

Tab2:CreateToggle({
   Name = "FULL BRIGHT (No Shadows)",
   CurrentValue = false,
   Callback = function(v)
      if v then
         game:GetService("Lighting").Brightness = 2
         game:GetService("Lighting").GlobalShadows = false
         game:GetService("Lighting").Ambient = Color3.fromRGB(255, 255, 255)
      else
         game:GetService("Lighting").Brightness = 1
         game:GetService("Lighting").GlobalShadows = true
         game:GetService("Lighting").Ambient = Color3.fromRGB(127, 127, 127)
      end
   end,
})

-- [[ TAB 3: MISC ]]
local Tab3 = Window:CreateTab("Misc ⚙️")
Tab3:CreateSection("Character Mods")

Tab3:CreateSlider({
   Name = "Speed Hack",
   Range = {16, 300},
   Increment = 1,
   CurrentValue = 16,
   Callback = function(v)
      lp.Character.Humanoid.WalkSpeed = v
   end,
})

Tab3:CreateButton({
   Name = "Unanchor Character",
   Callback = function()
      lp.Character.HumanoidRootPart.Anchored = false
      Rayfield:Notify({Title = "HamzzScript", Content = "Character Free!", Duration = 2})
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

Rayfield:Notify({Title = "HamzzScript", Content = "V1.1 Ready, Master Ikyy!", Duration = 5})   end,
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
