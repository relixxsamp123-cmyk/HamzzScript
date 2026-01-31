-- [[ HAMZZSCRIPT PREMIUM UI BY IKYY ]] --
local ScreenGui = Instance.new("ScreenGui")
local MainFrame = Instance.new("Frame")
local UICorner = Instance.new("UICorner")
local TopBar = Instance.new("Frame")
local Title = Instance.new("TextLabel")
local Content = Instance.new("ScrollingFrame")
local UIListLayout = Instance.new("UIListLayout")

-- Setup UI 😈
ScreenGui.Name = "HamzzScript_Premium"
ScreenGui.Parent = game.CoreGui

MainFrame.Name = "MainFrame"
MainFrame.Parent = ScreenGui
MainFrame.BackgroundColor3 = Color3.fromRGB(10, 10, 10)
MainFrame.BackgroundTransparency = 0.15
MainFrame.Position = UDim2.new(0.5, -125, 0.4, -100)
MainFrame.Size = UDim2.new(0, 250, 0, 300)
MainFrame.Active = true
MainFrame.Draggable = true

UICorner.CornerRadius = UDim.new(0, 10)
UICorner.Parent = MainFrame

-- Bar Atas Kece ☠️
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

-- Konten Fitur 😍
Content.Parent = MainFrame
Content.Position = UDim2.new(0, 5, 0, 45)
Content.Size = UDim2.new(1, -10, 1, -50)
Content.BackgroundTransparency = 1
Content.CanvasSize = UDim2.new(0, 0, 2, 0)
Content.ScrollBarThickness = 3

UIListLayout.Parent = Content
UIListLayout.Padding = UDim.new(0, 8)

-- Fungsi Buat Button Otomatis 😋
local function createButton(name, callback)
    local btn = Instance.new("TextButton")
    local btnCorner = Instance.new("UICorner")
    
    btn.Name = name
    btn.Parent = Content
    btn.Size = UDim2.new(1, 0, 0, 40)
    btn.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
    btn.TextColor3 = Color3.fromRGB(255, 255, 255)
    btn.Text = name
    btn.Font = Enum.Font.Gotham
    btn.TextSize = 14
    
    btnCorner.CornerRadius = UDim.new(0, 6)
    btnCorner.Parent = btn
    
    btn.MouseButton1Click:Connect(callback)
end

-- DAFTAR FITUR MAUT ☠️🔥
createButton("ACTIVATE GOD MODE ☠️", function()
    print("God Mode On!")
    spawn(function()
        while task.wait() do
            game.Players.LocalPlayer.Character.Humanoid.Health = 9e9
        end
    end)
end)

createButton("ACTIVATE DAMAGE AURA 😈", function()
    print("Aura On!")
    spawn(function()
        while task.wait(0.2) do
            for _, v in pairs(game.Players:GetPlayers()) do
                if v ~= game.Players.LocalPlayer and v.Character and v.Character:FindFirstChild("Humanoid") then
                    v.Character.Humanoid:TakeDamage(5)
                end
            end
        end
    end)
end)

createButton("SPEED HACK (X10) ⚡", function()
    game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = 100
end)

createButton("DESTROY UI ❌", function()
    ScreenGui:Destroy()
end)

print("Tampilan Baru HamzzScript Siap Tempur! ☠️🔥")
