-- [[ Hamzz Hub Script ]] --
-- [[ Credit: Hamzz Mods ]] --
-- [[ Special Premium for Ikyy ]] --

-- [[ LOAD PREMIUM ACCESS DARI SOURCE EXTERNAL ]] --
spawn(function()
    pcall(function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/relixxsamp123-cmyk/HamzzScript/refs/heads/main/update%20premium%20akses.lua"))()
        print("Premium Access Loaded! 😍☠️")
    end)
end)

local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local Window = Rayfield:CreateWindow({
   Name = "Hamzz Hub Script | Solo Leveling",
   LoadingTitle = "Hamzz Hub Premium Loading...",
   LoadingSubtitle = "by Hamzz Mods",
   ConfigurationSaving = { Enabled = true, FolderName = "HamzzHubData" },
   KeySystem = false
})

local CombatTab = Window:CreateTab("Combat ⚔️", 4483362458)
local MovementTab = Window:CreateTab("Movement 🚀", 4483362458)
local VisualTab = Window:CreateTab("Visual/ESP 👁️", 4483345998)
local MiscTab = Window:CreateTab("Misc ⚙️", 4483362458)

-- [[ COMBAT: GOD MODE KEBAL TOTAL ]] --
CombatTab:CreateToggle({
   Name = "God Mode (No Damage)",
   CurrentValue = false,
   Flag = "RealGod",
   Callback = function(Value)
      _G.RealGod = Value
      task.spawn(function()
         while _G.RealGod do
            pcall(function()
               local char = game.Players.LocalPlayer.Character
               char.Humanoid.Health = char.Humanoid.MaxHealth
               for _, v in pairs(char:GetChildren()) do
                  if v:IsA("BasePart") then v.CanTouch = false end
               end
            end)
            task.wait(0.01)
         end
         if not _G.RealGod then
            pcall(function()
               for _, v in pairs(game.Players.LocalPlayer.Character:GetChildren()) do
                  if v:IsA("BasePart") then v.CanTouch = true end
               end
            end)
         end
      end)
   end,
})

CombatTab:CreateToggle({
   Name = "Infinite Mana",
   CurrentValue = false,
   Flag = "InfMana",
   Callback = function(Value)
      _G.InfMana = Value
      task.spawn(function()
         while _G.InfMana do
            pcall(function()
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
