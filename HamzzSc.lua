--[[
    🏛️ HamzzScript: THE TRILOGY ENGINE (V1.3)
    THEME: VOLT NITRO SPEED 🏎️⚡
    OWNER: MASTER IKYY ☠️😈
    UPDATE: NOCLIP & FIX SPEED (ANTI-STUCK)
]]

local lp = game.Players.LocalPlayer
local runService = game:GetService("RunService")
local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local Window = Rayfield:CreateWindow({
   Name = "HamzzScript | Volt Nitro Edition ⚡",
   LoadingTitle = "IGNITING ENGINE...",
   LoadingSubtitle = "By Ikyy X Rizal",
   ConfigurationSaving = {Enabled = true, FolderName = "HamzzScriptConfigs", FileName = "IkyyHub"},
   KeySystem = false
})

-- [[ TAB 1: MAIN MENU ]]
local Tab1 = Window:CreateTab("Main Menu 🛡️")
Tab1:CreateSection("God Mode & Farming")

Tab1:CreateToggle({
   Name = "TRUE GOD MODE (Immortality)",
   CurrentValue = false,
   Flag = "GodMode",
   Callback = function(v)
      _G.TrueGod = v
      task.spawn(function()
         while _G.TrueGod do
            task.wait()
            pcall(function()
               local char = lp.Character
               if char and char:FindFirstChild("Humanoid") then
                  char.Humanoid.MaxHealth = 9e15
                  char.Humanoid.Health = 9e15
                  char.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Dead, false)
                  if not char:FindFirstChildOfClass("ForceField") then
                     local ff = Instance.new("ForceField", char) ff.Visible = false
                  end
               end
            end)
         end
      end)
   end,
})

Tab1:CreateToggle({
   Name = "ULTRA COLLECT (Auto Farm)",
   CurrentValue = false,
   Flag = "UltraFarm",
   Callback = function(v)
      _G.UltraFarm = v
      task.spawn(function()
         while _G.UltraFarm do
            task.wait(0.3)
            pcall(function()
               for i = 1, 30 do
                  if not _G.UltraFarm then break end
                  local args = {[1] = "Collect Money", [2] = "{c4466bc3-3d04-4575-afe0-564002c44233}", [3] = tostring(i)}
                  game:GetService("ReplicatedStorage"):WaitForChild("Packages"):WaitForChild("Net"):WaitForChild("RF/Plot.PlotAction"):InvokeServer(unpack(args))
               end
            end)
         end
      end)
   end,
})

-- [[ TAB 2: VISUAL ]]
local Tab2 = Window:CreateTab("Visual 👁️")
Tab2:CreateSection("World & ESP")

Tab2:CreateButton({
   Name = "SIMPLE ESP (Volt Highlight)",
   Callback = function()
      for _, v in pairs(game.Players:GetPlayers()) do
         if v ~= lp and v.Character then
            local hi = v.Character:FindFirstChild("HamzzESP") or Instance.new("Highlight", v.Character)
            hi.Name = "HamzzESP"
            hi.FillColor = Color3.fromRGB(200, 255, 0)
            hi.FillTransparency = 0.4
         end
      end
   end,
})

-- [[ TAB 3: MISC ]]
local Tab3 = Window:CreateTab("Misc ⚙️")
Tab3:CreateSection("Movement (No Stuck)")

-- FIX SPEED HACK
Tab3:CreateSlider({
   Name = "Nitro Speed",
   Range = {16, 500},
   Increment = 5,
   CurrentValue = 16,
   Callback = function(v)
      _G.WalkSpeed = v
      task.spawn(function()
         while _G.WalkSpeed == v do
            pcall(function()
               lp.Character.Humanoid.WalkSpeed = v
            end)
            task.wait(0.1)
         end
      end)
   end,
})

-- NOCLIP (TEMBUS TEMBOK)
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
                     if part:IsA("BasePart") then
                        part.CanCollide = false
                     end
                  end
               end)
            else
               _G.NoclipLoop:Disconnect()
            end
         end)
      else
         if _G.NoclipLoop then _G.NoclipLoop:Disconnect() end
      end
   end,
})

Tab3:CreateButton({
   Name = "Rejoin Server",
   Callback = function() game:GetService("TeleportService"):Teleport(game.PlaceId, lp) end,
})

-- [[ FLOATING BUTTON ]]
pcall(function() game:GetService("CoreGui").HamzzFinalUI:Destroy() end)
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

Rayfield:Notify({Title = "HamzzScript", Content = "V1.3 Ready, Master Ikyy!", Duration = 5})
