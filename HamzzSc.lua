--[[
    🏛️ HamzzScript: THE TRILOGY ENGINE (V1.8)
    THEME: VOLT NITRO SPEED 🏎️⚡
    OWNER: MASTER IKYY ☠️😈
    UPDATE: BRUTE FORCE SPEED (ANTI-RESET)
]]

local lp = game.Players.LocalPlayer
local runService = game:GetService("RunService")
local mouse = lp:GetMouse()
local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local Window = Rayfield:CreateWindow({
   Name = "HamzzScript | Volt Nitro Edition ⚡",
   LoadingTitle = "IGNITING NITRO...",
   LoadingSubtitle = "By Ikyy X Rizal",
   ConfigurationSaving = {Enabled = true, FolderName = "HamzzScriptConfigs", FileName = "IkyyHub"},
   KeySystem = false
})

-- [[ TAB 1: MAIN MENU ]]
local Tab1 = Window:CreateTab("Main Menu 🛡️")
Tab1:CreateSection("Survival & World Hack")

Tab1:CreateButton({
   Name = "DELETE TSUNAMI (Clean Map) 🌊❌",
   Callback = function()
      local count = 0
      for _, v in pairs(game.Workspace:GetDescendants()) do
         if v:IsA("BasePart") or v:IsA("MeshPart") then
            if v.Name:lower():find("tsunami") or v.Name:lower():find("water") or v.Name:lower():find("wave") then
               v:Destroy()
               count = count + 1
            end
         end
      end
      game.Workspace.Terrain:Clear()
      Rayfield:Notify({Title = "HamzzScript", Content = "Deleted " .. tostring(count) .. " Parts!", Duration = 3})
   end,
})

Tab1:CreateToggle({
   Name = "ABSOLUTE GOD MODE (No Touch)",
   CurrentValue = false,
   Flag = "GodMode",
   Callback = function(v)
      _G.TrueGod = v
      task.spawn(function()
         while _G.TrueGod do
            task.wait()
            pcall(function()
               local char = lp.Character
               if char then
                  local hum = char:FindFirstChildOfClass("Humanoid")
                  if hum then
                     hum.Health = hum.MaxHealth
                     hum:SetStateEnabled(Enum.HumanoidStateType.Dead, false)
                  end
                  for _, part in pairs(char:GetChildren()) do
                     if part:IsA("BasePart") then part.CanTouch = false end
                  end
               end
            end)
         end
      end)
   end,
})

-- [[ TAB 3: MISC ]]
local Tab3 = Window:CreateTab("Misc ⚙️")
Tab3:CreateSection("Movement (BRUTE FORCE)")

-- SPEED HACK VERSI MAKSA (GAK BAKAL BISA DI-RESET GAME)
Tab3:CreateSlider({
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
