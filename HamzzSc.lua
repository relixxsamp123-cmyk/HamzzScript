local lp = game.Players.LocalPlayer
local ScreenGui = Instance.new("ScreenGui")
local MainFrame = Instance.new("Frame")
local UICorner = Instance.new("UICorner")
local TopBar = Instance.new("Frame")
local Title = Instance.new("TextLabel")
local Content = Instance.new("ScrollingFrame")
local UIListLayout = Instance.new("UIListLayout")

pcall(function() game.CoreGui:FindFirstChild("HamzzScript_Premium"):Destroy() end)

ScreenGui.Name = "HamzzScript_Premium"
ScreenGui.Parent = game.CoreGui
ScreenGui.ResetOnSpawn = false

MainFrame.Name = "MainFrame"
MainFrame.Parent = ScreenGui
MainFrame.BackgroundColor3 = Color3.fromRGB(10, 10, 10)
MainFrame.Position = UDim2.new(0.5, -125, 0.4, -100)
MainFrame.Size = UDim2.new(0, 250, 0, 300)
MainFrame.Active = true
MainFrame.Draggable = true

UICorner.CornerRadius = UDim.new(0, 10)
UICorner.Parent = MainFrame

TopBar.Name = "TopBar"
TopBar.Parent = MainFrame
TopBar.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
TopBar.Size = UDim2.new(1, 0, 0, 35)

local TopCorner = Instance.new("UICorner")
TopCorner.CornerRadius = UDim.new(0, 10)
TopCorner.Parent = TopBar

Title.Parent = TopBar
Title.Text = "HAMZZ SCRIPT V3 😈"
Title.TextColor3 = Color3.fromRGB(255, 255, 255)
Title.TextSize = 18
Title.Font = Enum.Font.GothamBold
Title.Size = UDim2.new(1, 0, 1, 0)
Title.BackgroundTransparency = 1

Content.Parent = MainFrame
Content.Position = UDim2.new(0, 5, 0, 45)
Content.Size = UDim2.new(1, -10, 1, -50)
Content.BackgroundTransparency = 1
Content.CanvasSize = UDim2.new(0, 0, 1.5, 0)
Content.ScrollBarThickness = 3

UIListLayout.Parent = Content
UIListLayout.Padding = UDim.new(0, 8)

local function createButton(name, callback)
    local btn = Instance.new("TextButton")
    local btnCorner = Instance.new("UICorner")
    btn.Parent = Content
    btn.Size = UDim2.new(1, 0, 0, 40)
    btn.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
    btn.TextColor3 = Color3.fromRGB(255, 255, 255)
    btn.Text = name
    btn.Font = Enum.Font.GothamBold
    btn.TextSize = 14
    btnCorner.CornerRadius = UDim.new(0, 6)
    btnCorner.Parent = btn
    btn.MouseButton1Click:Connect(callback)
end

createButton("GOD MODE (ABADI) ☠️", function()
    _G.God = true
    spawn(function()
        while _G.God do
            task.wait()
            pcall(function()
                lp.Character.Humanoid.MaxHealth = 9e9
                lp.Character.Humanoid.Health = 9e9
                lp.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Dead, false)
            end)
        end
    end)
end)

createButton("AURA DAMAGE MAX 😈", function()
    _G.Aura = true
    spawn(function()
        while _G.Aura do
            task.wait(0.1)
            pcall(function()
                for _, v in pairs(game.Players:GetPlayers()) do
                    if v ~= lp and v.Character and v.Character:FindFirstChild("HumanoidRootPart") then
                        local dist = (v.Character.HumanoidRootPart.Position - lp.Character.HumanoidRootPart.Position).Magnitude
                        if dist < 500 then
                            for _, r in pairs(game:GetDescendants()) do
                                if r:IsA("RemoteEvent") and (r.Name:lower():find("hit") or r.Name:lower():find("attack") or r.Name:lower():find("damage")) then
                                    r:FireServer(v.Character.Humanoid, math.huge)
                                end
                            end
                            v.Character.Humanoid.Health = -math.huge
                        end
                    end
                end
            end)
        end
    end)
end)

createButton("SPEED HACK (X10) ⚡", function()
    lp.Character.Humanoid.WalkSpeed = 100
end)

createButton("DESTROY UI ❌", function()
    _G.God = false
    _G.Aura = false
    ScreenGui:Destroy()
end)
