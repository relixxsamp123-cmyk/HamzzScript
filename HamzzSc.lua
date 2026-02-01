-- SCRIPT PEMBUAT MAP OTOMATIS BY IKYY --
local function buatLantai()
    local lantai = Instance.new("Part", game.Workspace)
    lantai.Name = "LantaiBrainrot"
    lantai.Size = UDim2.new(0, 500, 0, 1, 0, 500) -- Lantai gede banget
    lantai.Position = Vector3.new(0, 0, 0)
    lantai.Anchored = true -- Biar gak jatuh
    lantai.Color = Color3.fromRGB(30, 30, 30) -- Warna gelap biar estetik
    lantai.Material = Enum.Material.Neon -- Biar silau dikit
end

local function buatTembok(x, z, ry)
    local t = Instance.new("Part", game.Workspace)
    t.Size = Vector3.new(500, 50, 5)
    t.Position = Vector3.new(x, 25, z)
    t.Rotation = Vector3.new(0, ry, 0)
    t.Anchored = true
    t.Color = Color3.fromRGB(255, 0, 0) -- Tembok merah biar serem
end

-- Panggil fungsinya
buatLantai()
buatTembok(0, 250, 0)   -- Tembok depan
buatTembok(0, -250, 0)  -- Tembok belakang
buatTembok(250, 0, 90)  -- Tembok kanan
buatTembok(-250, 0, 90) -- Tembok kiri

print("MAP BASIC BERHASIL DIBUAT, ILEGAL MODE ON! 😈")
