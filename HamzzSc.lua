-- [[ LOAD ORION LIBRARY ]]
local OrionLib = loadstring(game:HttpGet(('https://raw.githubusercontent.com/shlexware/Orion/main/source')))()

-- [[ KEY KONFIGURASI ]]
local ValidKey = "Acbw329hdvbamwh2991" -- KEY ACAK LO, JEMBOT!

local Window = OrionLib:MakeWindow({
    Name = "HamzzScript | MASTER IKYY 💀", 
    HidePremium = false, 
    SaveConfig = true, 
    ConfigFolder = "HamzzKeySystem",
    IntroText = "WELCOME MASTER IKYY",
    KeySystem = true, -- AKTIFIN SISTEM KUNCI!
    KeySettings = {
        Title = "HamzzScript | SECURITY",
        Subtitle = "Ketik Key-nya, Bangsat!",
        Note = "Key: Acbw329hdvbamwh2991", -- Hapus baris ini kalo lo mau rahasia!
        FileName = "HamzzKeySave", 
        SaveKey = true, 
        GrabKeyFromSite = false,
        Key = {ValidKey} -- Validasi key acak lo di sini
    }
})

-- [[ KALO KEY BENER, TAB DI BAWAH INI BARU MUNCUL ]]
local TabMain = Window:MakeTab({
	Name = "Main Farm ⚡",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})

TabMain:AddToggle({
	Name = "AUTO-ROB (READY TO USE)",
	Default = false,
	Callback = function(Value)
		getgenv().AutoFarm = Value
        task.spawn(function()
            while getgenv().AutoFarm do
                pcall(function()
                    -- [[ TARUH HASIL INTIP RSPY LO DISINI ]]
                end)
                task.wait(0.1)
            end
        end)
	end    
})

local TabMisc = Window:MakeTab({
	Name = "Misc ⚙️",
	Icon = "rbxassetid://4483345906"
})

TabMisc:AddSlider({
	Name = "WalkSpeed",
	Min = 16,
	Max = 500,
	Default = 16,
	Callback = function(v)
		game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = v
	end    
})

-- [[ WAJIB ADA BIAR UI MUNCUL ]]
OrionLib:Init()
