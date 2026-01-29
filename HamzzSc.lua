--[[
    🏛️ HamzzScript: THE TRILOGY ENGINE 🏛️
    TAB 1: MAIN | TAB 2: VISUAL | TAB 3: MISC
    OWNER: MASTER IKYY ☠️😈
]]

local lp = game.Players.LocalPlayer
local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local Window = Rayfield:CreateWindow({
   Name = "HamzzScript | TRILOGY 🌌",
   LoadingTitle = "BUILDING INTERFACE...",
   LoadingSubtitle = "By Master Ikyy",
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
   Name = "AFK HEAVEN (Teleport Up)",
   Callback = function()
      lp.Character.HumanoidRootPart.CFrame = CFrame.new(lp.Character.HumanoidRootPart.Position.X, 500, lp.Character.HumanoidRootPart.Position.Z)
      lp.Character.HumanoidRootPart.Anchored = true
      Rayfield:Notify({Title = "HamzzScript", Content = "Duduk manis di langit!", Duration = 3})
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

Rayfield:Notify({Title = "HamzzScript", Content = "V1.1 Ready, Master Ikyy!", Duration = 5})
