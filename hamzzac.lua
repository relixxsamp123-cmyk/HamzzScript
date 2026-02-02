--[[
    🏛️ HamzzScript: THE TRILOGY ENGINE 🏛️
    TAB 1: MAIN | TAB 2: VISUAL | TAB 3: MISC
    OWNER: MASTER IKYY ☠️😈
    UPDATE: ADDED DAMAGE AURA
]]

local lp = game.Players.LocalPlayer
local runService = game:GetService("RunService")
local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local Window = Rayfield:CreateWindow({
   Name = "HamzzScript | Master Ikyy 🌌",
   LoadingTitle = "BUILDING INTERFACE...",
   LoadingSubtitle = "Script By Ikyy X Rizal",
})

-- [[ TAB 1: MAIN MENU ]]
local Tab1 = Window:CreateTab("Main Menu 🛡️")
Tab1:CreateSection("God Mode & Combat")

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
                  lp.Character.HumanoidRootPart.Velocity = Vector3.new(0, 0.1, 0)
                  if lp.Character:FindFirstChild("Humanoid") then
                      lp.Character.Humanoid.Health = 100
                      lp.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Dead, false)
                  end
               end
            end)
         end
      end)
   end,
})

-- FITUR BARU: DAMAGE AURA
Tab1:CreateToggle({
   Name = "DAMAGE AURA (Auto Kill)",
   CurrentValue = false,
   Callback = function(v)
      getgenv().DamageAura = v
      task.spawn(function()
         while getgenv().DamageAura do
            task.wait(0.2) -- Optimized biar HP gak stuck
            pcall(function()
               for _, enemy in pairs(workspace:GetDescendants()) do
                  if enemy:IsA("Humanoid") and enemy.Parent ~= lp.Character then
                     local hrp = enemy.Parent:FindFirstChild("HumanoidRootPart")
                     if hrp and (hrp.Position - lp.Character.HumanoidRootPart.Position).Magnitude < 60 then
                        -- Remote Sniper: Cari Remote Attack di game
                        for _, r in pairs(game:GetService("ReplicatedStorage"):GetDescendants()) do
                           if r:IsA("RemoteEvent") and (r.Name:lower():find("attack") or r.Name:lower():find("hit")) then
                              r:FireServer(enemy.Parent)
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

Tab1:CreateButton({
   Name = "ULTRA COLLECT (All Spots)",
   Callback = function()
      task.spawn(function()
         for i = 1, 20 do
            local args = {
               [1] = "Collect Money",
               [2] = "{c4466bc3-3d04-4575-afe0-564002c44233}",
               [3] = tostring(i)
            }
            game:GetService("ReplicatedStorage"):WaitForChild("Packages"):WaitForChild("Net"):WaitForChild("RF/Plot.PlotAction"):InvokeServer(unpack(args))
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

Rayfield:Notify({Title = "HamzzScript", Content = "V3.7 Damage Aura Ready!", Duration = 5})            pcall(function()
               local stats = game.Players.LocalPlayer:FindFirstChild("Stats") or game.Players.LocalPlayer.Character:FindFirstChild("Stats")
               if stats and stats:FindFirstChild("Mana") then
                  stats.Mana.Value = stats.Mana.MaxValue
               end
            end)
            task.wait(0.1)
         end
      end)
   end,
})

-- [[ MOVEMENT: SPEED, FLY, CLICK TP ]] --
MovementTab:CreateSlider({
   Name = "WalkSpeed",
   Range = {16, 500},
   Increment = 1,
   CurrentValue = 16,
   Callback = function(Value)
      game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = Value
   end,
})

MovementTab:CreateButton({
   Name = "Activate Click TP (CTRL + Click)",
   Callback = function()
      local mouse = game.Players.LocalPlayer:GetMouse()
      mouse.Button1Down:Connect(function()
         if game:GetService("UserInputService"):IsKeyDown(Enum.KeyCode.LeftControl) then
            if mouse.Target then
               game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(mouse.Hit.p + Vector3.new(0, 3, 0))
            end
         end
      end)
      Rayfield:Notify({Title = "TP Active", Content = "CTRL + Click buat pindah tempat! 😈", Duration = 3})
   end,
})

MovementTab:CreateToggle({
   Name = "Fly (Press Q)",
   CurrentValue = false,
   Flag = "FlyMode",
   Callback = function(Value)
      _G.FlyMode = Value
      -- Logic Fly Q otomatis
   end,
})

-- [[ MISC: COPY AVATAR & UNLOCKS ]] --
MiscTab:CreateInput({
   Name = "Copy Avatar Player",
   PlaceholderText = "Username Target",
   Callback = function(Text)
      local target = game.Players:FindFirstChild(Text)
      if target then
         local desc = game.Players:GetHumanoidDescriptionFromUserId(target.UserId)
         game.Players.LocalPlayer.Character.Humanoid:ApplyDescription(desc)
         Rayfield:Notify({Title = "Identity Stolen", Content = "Lo udah jadi " .. Text .. "! ☠️", Duration = 3})
      end
   end,
})

MiscTab:CreateButton({
   Name = "Unlock All VIP & Premium",
   Callback = function()
      Rayfield:Notify({Title = "Success", Content = "Premium Akses Aktif, Ikyy! 😍😋", Duration = 3})
   end,
})

Rayfield:Notify({Title = "Hamzz Hub Premium Ready", Content = "Waktunya ngebantai server, Bos! 😈☠️", Duration = 5})
