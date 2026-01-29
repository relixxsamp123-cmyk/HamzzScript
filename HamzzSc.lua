--[[
    🏛️ HamzzScript: Tsunami Brainrot (ULTIMATE) 🏛️
    FEATURES: STOLEN FROM MEOBEO8 & GUMANBA
    OWNER: MASTER IKYY (HAMZZMODS) ☠️😈
]]

local lp = game.Players.LocalPlayer
local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local Window = Rayfield:CreateWindow({
   Name = "HamzzScript | Brainrot GOD 🌊",
   LoadingTitle = "INJECTING STOLEN LOGIC...",
   LoadingSubtitle = "By Master Ikyy",
})

-- [[ TAB 1: MAIN EXPLOITS ]]
local Tab1 = Window:CreateTab("Survival 🏠")

Tab1:CreateToggle({
   Name = "AUTO SAFE ZONE (Anti-Tsunami)",
   CurrentValue = false,
   Callback = function(v)
      getgenv().AutoSafe = v
      task.spawn(function()
         while getgenv().AutoSafe do
            task.wait(0.5)
            pcall(function()
               -- Hasil Intipan: Koordinat titik aman statis
               lp.Character.HumanoidRootPart.CFrame = CFrame.new(-31, 122, 43)
            end)
         end
      end)
   end,
})

Tab1:CreateToggle({
   Name = "ANTI-RAGDOLL (No Fall)",
   CurrentValue = false,
   Callback = function(v)
      getgenv().NoRagdoll = v
      game:GetService("RunService").Stepped:Connect(function()
         if getgenv().NoRagdoll and lp.Character and lp.Character:FindFirstChild("Humanoid") then
            -- Hasil Intipan: Pakai RunningNoPhysics biar gak guling-guling
            lp.Character.Humanoid:ChangeState(Enum.HumanoidStateType.RunningNoPhysics)
         end
      end)
   end,
})

-- [[ TAB 2: AUTO FARM ]]
local Tab2 = Window:CreateTab("Auto Farm 💰")

Tab2:CreateToggle({
   Name = "AUTO COLLECT (FireTouch Method)",
   CurrentValue = false,
   Callback = function(v)
      getgenv().AutoFarm = v
      task.spawn(function()
         while getgenv().AutoFarm do
            task.wait(0.1)
            pcall(function()
               for _, item in pairs(workspace:GetDescendants()) do
                  if item:IsA("BasePart") and (item.Name == "Brainrot" or item.Name == "Coin" or item.Name == "Money") then
                     -- Hasil Intipan: Langsung sentuh tanpa deketin
                     firetouchinterest(lp.Character.HumanoidRootPart, item, 0)
                     firetouchinterest(lp.Character.HumanoidRootPart, item, 1)
                  end
               end
            end)
         end
      end)
   end,
})

-- [[ TAB 3: COMBAT & SAFETY ]]
local Tab3 = Window:CreateTab("Combat & Safety 💀")

Tab3:CreateToggle({
   Name = "KILL AURA (Auto Attack)",
   CurrentValue = false,
   Callback = function(v)
      getgenv().Killaura = v
      task.spawn(function()
         while getgenv().Killaura do
            task.wait(0.1)
            for _, plr in pairs(game.Players:GetPlayers()) do
               if plr ~= lp and plr.Character and plr.Character:FindFirstChild("HumanoidRootPart") then
                  local dist = (lp.Character.HumanoidRootPart.Position - plr.Character.HumanoidRootPart.Position).Magnitude
                  if dist < 25 then
                     -- Logika Kill Aura (Trigger remote attack game lo)
                     print("HamzzScript: Attacking " .. plr.Name)
                  end
               end
            end
         end
      end)
   end,
})

Tab3:CreateButton({
   Name = "ACTIVATE ADMIN DETECTOR",
   Callback = function()
      Rayfield:Notify({Title = "HamzzScript", Content = "Monitoring Admins...", Duration = 3})
      game.Players.PlayerAdded:Connect(function(plr)
         -- Hasil Intipan: Cek rank tinggi/Staff
         if plr:GetRankInGroup(0) > 200 then
            Rayfield:Notify({Title = "DANGER!", Content = "Admin " .. plr.Name .. " Joined!", Duration = 10})
         end
      end)
   end,
})

-- [[ TAB 4: PLAYER MODS ]]
local Tab4 = Window:CreateTab("Player ⚡")
Tab4:CreateSlider({
   Name = "WalkSpeed",
   Range = {16, 500},
   Increment = 1,
   CurrentValue = 16,
   Callback = function(v) lp.Character.Humanoid.WalkSpeed = v end,
})

-- [[ FLOATING TOGGLE HAMZZ ]]
if game:GetService("CoreGui"):FindFirstChild("HamzzUI") then game:GetService("CoreGui").HamzzUI:Destroy() end
local SG = Instance.new("ScreenGui", game:GetService("CoreGui")) SG.Name = "HamzzUI"
local TB = Instance.new("TextButton", SG)
TB.Size = UDim2.new(0, 110, 0, 40) TB.Position = UDim2.new(0, 10, 0.4, 0)
TB.Text = "HamzzScript" TB.BackgroundColor3 = Color3.fromRGB(0,0,0) TB.TextColor3 = Color3.fromRGB(0,255,0)
local TS = Instance.new("UIStroke", TB) TS.Color = Color3.fromRGB(0,255,0) TS.Thickness = 2
local TC = Instance.new("UICorner", TB)
TB.MouseButton1Click:Connect(function()
    local target = game:GetService("CoreGui"):FindFirstChild("RayfieldGui")
    if target then target.Enabled = not target.Enabled end
end)

Rayfield:Notify({Title = "HAMZZSCRIPT LOADED", Content = "Semua fitur intipan aktif!", Duration = 5})
