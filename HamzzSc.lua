-- ======================================================
-- 🏛️ IKYY DARKNET: V28 VISUAL OVERHAUL 🏛️
-- FOCUS: ORGANIZED VISUAL TAB & ESP SYSTEM ☠️😈
-- ======================================================

local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local Window = Rayfield:CreateWindow({
   Name = "IKYY DARKNET V28: VISUAL 🌌",
   LoadingTitle = "INJECTING OPTIC MODULES...",
   LoadingSubtitle = "by HamzzMods (Master: Ikyy)",
   ConfigurationSaving = {Enabled = false},
   KeySystem = false
})

-- ==========================================
-- [ TAB 1: MAIN & MOVEMENT ]
-- ==========================================
local TabMain = Window:CreateTab("Main ⚡")
TabMain:CreateToggle({
   Name = "GOD MODE (Anti Mati)",
   CurrentValue = false,
   Callback = function(v)
      getgenv().GodMode = v
      task.spawn(function()
         while getgenv().GodMode do
            task.wait()
            pcall(function()
               local hum = game.Players.LocalPlayer.Character.Humanoid
               hum.Health = 100
               hum:SetStateEnabled(Enum.HumanoidStateType.Dead, false)
            end)
         end
      end)
   end,
})

TabMain:CreateSlider({
   Name = "WalkSpeed",
   Range = {16, 500},
   Increment = 1,
   CurrentValue = 50,
   Callback = function(v) game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = v end,
})

-- ==========================================
-- [ TAB 2: VISUAL ] - FITUR PINDAH KE SINI!
-- ==========================================
local TabVisual = Window:CreateTab("Visual 👁️")
local SecVis = TabVisual:CreateSection("Hacker Vision & ESP")

TabVisual:CreateButton({
   Name = "ESP Player (Lacak Nama & Box)",
   Callback = function()
      -- Script ESP Universal
      loadstring(game:HttpGet('https://raw.githubusercontent.com/IkyyDarknet/Universal/main/ESP.lua'))()
      Rayfield:Notify({Title = "VISUAL", Content = "ESP Activated!", Duration = 2})
   end,
})

TabVisual:CreateButton({
   Name = "Fullbright (Anti-Gelap/Malam)",
   Callback = function()
      pcall(function()
         game.Lighting.Brightness = 2
         game.Lighting.ClockTime = 14
         game.Lighting.FogEnd = 100000
         game.Lighting.GlobalShadows = false
      end)
   end,
})

TabVisual:CreateToggle({
   Name = "X-Ray (Tembus Bangunan)",
   CurrentValue = false,
   Callback = function(v)
      getgenv().Xray = v
      for _, part in pairs(workspace:GetDescendants()) do
         if part:IsA("BasePart") and not part.Parent:FindFirstChild("Humanoid") then
            if getgenv().Xray then
               if not part:FindFirstChild("OriginalTransparency") then
                  local t = Instance.new("NumberValue", part)
                  t.Name = "OriginalTransparency"
                  t.Value = part.Transparency
               end
               part.Transparency = 0.5
            else
               if part:FindFirstChild("OriginalTransparency") then
                  part.Transparency = part.OriginalTransparency.Value
               end
            end
         end
      end
   end,
})

TabVisual:CreateButton({
   Name = "Remove Fog (Hapus Kabut)",
   Callback = function()
      game.Lighting.FogEnd = 9e9
   end,
})

-- ==========================================
-- [ TAB 3: AUTO FARM & DUPE ]
-- ==========================================
local TabFarm = Window:CreateTab("Auto Farm 🚜")
TabFarm:CreateToggle({
   Name = "Auto Steal & Dupe (X10)",
   CurrentValue = false,
   Callback = function(v)
      getgenv().DupeFarm = v
      while getgenv().DupeFarm do
         task.wait(0.1)
         pcall(function()
            for _, v in pairs(workspace:GetDescendants()) do
               if v:IsA("ProximityPrompt") then
                  for i = 1, 10 do fireproximityprompt(v) end
               end
            end
         end)
      end
   end,
})

-- ==========================================
-- [ TAB 4: MISC ]
-- ==========================================
local TabMisc = Window:NewTab("Misc 💀")
TabMisc:CreateButton({
   Name = "Remove Tsunami / Water",
   Callback = function()
      for _, v in pairs(workspace:GetDescendants()) do
         if v:IsA("BasePart") and (v.Name:lower():find("water") or v.Name:lower():find("tsunami")) then v:Destroy() end
      end
      workspace.Terrain:Clear()
   end,
})

-- [ PERMANENT TOGGLE BUTTON ]
if game:GetService("CoreGui"):FindFirstChild("IkyyToggleUI") then game:GetService("CoreGui").IkyyToggleUI:Destroy() end
local SG = Instance.new("ScreenGui", game:GetService("CoreGui"))
SG.Name = "IkyyToggleUI"
local TB = Instance.new("TextButton", SG)
TB.Size = UDim2.new(0, 100, 0, 40)
TB.Position = UDim2.new(0, 10, 0.1, 0)
TB.Text = "IKYY HUB"
TB.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
TB.TextColor3 = Color3.fromRGB(0, 255, 0)
TB.Draggable = true
local TS = Instance.new("UIStroke", TB) TS.Color = Color3.fromRGB(0, 255, 0) TS.Thickness = 2
local TC = Instance.new("UICorner", TB)
TB.MouseButton1Click:Connect(function()
    local target = game:GetService("CoreGui"):FindFirstChild("RayfieldGui")
    if target then target.Enabled = not target.Enabled end
end)
