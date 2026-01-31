local lp = game.Players.LocalPlayer
local pg = lp:WaitForChild("PlayerGui")

pcall(function() pg.HamzzUltimate:Destroy() end)

local sg = Instance.new("ScreenGui", pg)
sg.Name = "HamzzUltimate"
sg.ResetOnSpawn = false

local Main = Instance.new("Frame", sg)
Main.Size = UDim2.new(0, 250, 0, 220)
Main.Position = UDim2.new(0.5, -125, 0.4, -110)
Main.BackgroundColor3 = Color3.fromRGB(15, 0, 0)
Main.BorderSizePixel = 3
Main.BorderColor3 = Color3.fromRGB(255, 0, 0)
Main.Active = true
Main.Draggable = true

local Title = Instance.new("TextLabel", Main)
Title.Size = UDim2.new(1, 0, 0, 45)
Title.Text = "HAMZZ V10 DESTRUCTION"
Title.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
Title.TextColor3 = Color3.fromRGB(255, 0, 0)
Title.Font = Enum.Font.GothamBold
Title.TextSize = 16

_G.God = false
_G.Aura = false

local function MakeToggle(text, pos, var)
    local b = Instance.new("TextButton", Main)
    b.Size = UDim2.new(0.9, 0, 0, 60)
    b.Position = UDim2.new(0.05, 0, 0, pos)
    b.Text = text .. ": OFF"
    b.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
    b.TextColor3 = Color3.fromRGB(255, 255, 255)
    b.Font = Enum.Font.GothamBold
    b.TextSize = 14
    
    b.MouseButton1Click:Connect(function()
        _G[var] = not _G[var]
        if _G[var] then
            b.Text = text .. ": ON"
            b.BackgroundColor3 = Color3.fromRGB(180, 0, 0)
        else
            b.Text = text .. ": OFF"
            b.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
        end
    end)
end

MakeToggle("GOD MODE ABADI", 55, "God")
MakeToggle("AURA DAMAGE MAX", 125, "Aura")

spawn(function()
    while task.wait(0.05) do
        pcall(function()
            local char = lp.Character
            if char and char:FindFirstChild("Humanoid") then
                if _G.God then
                    char.Humanoid.MaxHealth = 9e9
                    char.Humanoid.Health = 9e9
                end
                
                if _G.Aura then
                    for _, v in pairs(game.Players:GetPlayers()) do
                        if v ~= lp and v.Character and v.Character:FindFirstChild("HumanoidRootPart") then
                            local d = (v.Character.HumanoidRootPart.Position - char.HumanoidRootPart.Position).Magnitude
                            if d < 500 then
                                for _, r in pairs(game:GetDescendants()) do
                                    if r:IsA("RemoteEvent") and (r.Name:lower():find("hit") or r.Name:lower():find("attack") or r.Name:lower():find("damage")) then
                                        r:FireServer(v.Character.Humanoid, math.huge)
                                    end
                                end
                                v.Character.Humanoid.Health = -math.huge
                            end
                        end
                    end
                end
            end
        end)
    end
end)
