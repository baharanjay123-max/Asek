-- ============================================================
-- SCRIPT FINAL: DJ MUSIC PLAYER (LOGO MUTER)
-- Kategori: BKB, DJ/RMX, DJ REMIX, FUNKOT, DUGEM
-- by BRUHH
-- ============================================================

local player = game.Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")
local UIS = game:GetService("UserInputService")
local RunService = game:GetService("RunService")
local SoundService = game:GetService("SoundService")

local music = Instance.new("Sound", SoundService)
music.Volume = 0.5

-- ===================== DATA SEMUA LAGU =====================
local Playlists = {
    {
        Name = "BKB",
        Tracks = {
            { SongName = "BLACK HOLE BREAKBEAT", SoundId = "rbxassetid://118362297271903" },
            { SongName = "NU BREAKBEAT", SoundId = "rbxassetid://76497788855136" },
            { SongName = "BREAKBEAT BEATIFUL", SoundId = "rbxassetid://124564676675935" },
            { SongName = "BREAKBEAT PURE LOVE", SoundId = "rbxassetid://128392830206161" },
            { SongName = "BREAKBEAT ALWAYS LOVING YOU", SoundId = "rbxassetid://128071048140468" },
            { SongName = "BREAKBEAT RIVER FLOWS IN YOU", SoundId = "rbxassetid://125026658817868" },
            { SongName = "I NEED TO DACTOR", SoundId = "rbxassetid://89433429094554" },
            { SongName = "ROULATE RUSSIAN BKB", SoundId = "rbxassetid://112975242747165" },
            { SongName = "NOBARE YOU BKB", SoundId = "rbxassetid://108695200115706" },
            { SongName = "TAK BISA LAGI MENCINTAIMU BKB", SoundId = "rbxassetid://137798111576173" },
            { SongName = "CHICA LOCA BKB", SoundId = "rbxassetid://82808551264264" },
            { SongName = "AKU SUDAH HAMIL SAYANG BKB", SoundId = "rbxassetid://92817454990794" },
            { SongName = "GEN-Z BKB", SoundId = "rbxassetid://107968763369784" },
            { SongName = "IRAMA BKB", SoundId = "rbxassetid://74394269263180" },
            { SongName = "FOREVER BKB", SoundId = "rbxassetid://116187656749144" },
            { SongName = "JADIKAN LAH DIRIKU YG KE 2 BKB", SoundId = "rbxassetid://96287468808586" },
            { SongName = "AHOYxMATOTO BKB", SoundId = "rbxassetid://125071929480860" },
            { SongName = "KAMU MALU-MALU BKB", SoundId = "rbxassetid://104538666715482" },
        }
    },
    {
        Name = "DJ / RMX",
        Tracks = {
            { SongName = "SUDAH LAH KALI INI AKU KALAH", SoundId = "rbxassetid://82505095220413" },
            { SongName = "JANGAN GILA DONG", SoundId = "rbxassetid://98915015116851" },
            { SongName = "CHICA LOCA MIX", SoundId = "rbxassetid://127933835766961" },
            { SongName = "BERAM SAM SAM", SoundId = "rbxassetid://119869030194779" },
            { SongName = "NATRA MIX2 FT FREZBOY", SoundId = "rbxassetid://127933835766961" },
            { SongName = "HABIBI KANE DONGHUA RMX", SoundId = "rbxassetid://100443758034085" },
            { SongName = "DJ LAWE REMIX", SoundId = "rbxassetid://84329917223920" },
            { SongName = "STUCY INDOBOUNCE", SoundId = "rbxassetid://116231101283651" },
            { SongName = "AISHITERU 3", SoundId = "rbxassetid://77222785479261" },
            { SongName = "MENGERTI PERASAANKU", SoundId = "rbxassetid://70575126591423" },
            { SongName = "SURAT CINTA X BAHAGIA LAGI", SoundId = "rbxassetid://113684831730737" },
            { SongName = "BIARKAN AKU PERGI", SoundId = "rbxassetid://81426876012759" },
            { SongName = "KUSIMPAN RINDUKU", SoundId = "rbxassetid://85819723455208" },
            { SongName = "MISSING YOU", SoundId = "rbxassetid://119116468910055" },
            { SongName = "WHERE DID", SoundId = "rbxassetid://91342380026565" },
            { SongName = "LAST GOODBOY", SoundId = "rbxassetid://139065609615135" },
            { SongName = "NO EXPIRATION", SoundId = "rbxassetid://88762074202384" },
            { SongName = "ALL OFF ME", SoundId = "rbxassetid://104593616947405" },
            { SongName = "CAN'T LOOK AWAY", SoundId = "rbxassetid://117727582073729" },
            { SongName = "ALWAYS MY LIGTH", SoundId = "rbxassetid://79036924458882" },
        }
    },
    {
        Name = "DJ REMIX",
        Tracks = {
            { SongName = "DJ Stay Kane", SoundId = "rbxassetid://137657207613132" },
            { SongName = "DJ Bintang 5", SoundId = "rbxassetid://134435445558993" },
            { SongName = "DJ JJ World", SoundId = "rbxassetid://90145710334449" },
            { SongName = "DJ Tor Monitor", SoundId = "rbxassetid://70633665224310" },
            { SongName = "DJ Party", SoundId = "rbxassetid://118390472006859" },
            { SongName = "Aku Suka Jedag Jedug", SoundId = "rbxassetid://100787734732008" },
            { SongName = "Jamilah Itu Bukan Anunya", SoundId = "rbxassetid://116255319981650" },
            { SongName = "DJ Raja Mexico", SoundId = "rbxassetid://101608805472261" },
            { SongName = "DJ Ee Ee Kenceng", SoundId = "rbxassetid://101419525809543" },
            { SongName = "Remix Tung Tung", SoundId = "rbxassetid://70860648654984" },
        }
    },
    {
        Name = "FUNKOT & JOGET",
        Tracks = {
            { SongName = "Funkot Stecu Stecu", SoundId = "rbxassetid://105935548669522" },
            { SongName = "Nana Memissu", SoundId = "rbxassetid://136842585273816" },
            { SongName = "DJ Bahagiamu", SoundId = "rbxassetid://110691393637838" },
            { SongName = "Dustep Dame Un Grr", SoundId = "rbxassetid://101362929989754" },
            { SongName = "Joget Lalala", SoundId = "rbxassetid://79073283903510" },
            { SongName = "Pargoy Gerah", SoundId = "rbxassetid://78859797813378" },
            { SongName = "DJ Suka Suka", SoundId = "rbxassetid://91089804280618" },
            { SongName = "DJ Yami Yami Justin Bieber", SoundId = "rbxassetid://84570363516667" },
            { SongName = "DJ Jangan Calling", SoundId = "rbxassetid://101244701122281" },
            { SongName = "DJ Baby Don't Go", SoundId = "rbxassetid://135407156540365" },
        }
    },
    {
        Name = "DUGEM",
        Tracks = {
            { SongName = "Dugem Always Loving", SoundId = "rbxassetid://138240226435856" },
            { SongName = "Dugem Miracles", SoundId = "rbxassetid://70436344944799" },
            { SongName = "Dugem We Wanna", SoundId = "rbxassetid://130712039189796" },
            { SongName = "Dugem Brand New Day", SoundId = "rbxassetid://116323172827525" },
            { SongName = "Dugem Arabic v1", SoundId = "rbxassetid://139871657187137" },
            { SongName = "Dugem Rumble", SoundId = "rbxassetid://110173941862827" },
            { SongName = "Dugem New Heart", SoundId = "rbxassetid://96966974660960" },
            { SongName = "Dugem Miksue", SoundId = "rbxassetid://112753938971674" },
            { SongName = "Dugem Tarik Napas", SoundId = "rbxassetid://127203386942116" },
            { SongName = "Dugem Gaji Tipis", SoundId = "rbxassetid://129177050015198" },
        }
    }
}

-- ===================== FUNGSI DRAG =====================
local function buatBisaDigeser(obj)
    local dragging, dragStart, startPos
    obj.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
            dragging = true; dragStart = input.Position; startPos = obj.Position
        end
    end)
    UIS.InputChanged:Connect(function(input)
        if dragging and (input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch) then
            local delta = input.Position - dragStart
            obj.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
        end
    end)
    UIS.InputEnded:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then dragging = false end
    end)
end

-- ===================== GUI UTAMA =====================
local gui = Instance.new("ScreenGui")
gui.Name = "DJ_Gui"
gui.ResetOnSpawn = false
gui.Parent = playerGui

local openBtn = Instance.new("TextButton")
openBtn.Size = UDim2.new(0, 120, 0, 40)
openBtn.Position = UDim2.new(0.05, 0, 0.1, 0)
openBtn.BackgroundColor3 = Color3.fromRGB(30, 30, 35)
openBtn.Text = "🎵 BUKA DJ"
openBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
openBtn.Font = Enum.Font.GothamBold
openBtn.TextScaled = true
openBtn.Parent = gui
Instance.new("UICorner", openBtn).CornerRadius = UDim.new(0, 8)
buatBisaDigeser(openBtn)

-- ===================== DJ MENU =====================
local menu = Instance.new("Frame")
menu.Size = UDim2.new(0, 320, 0, 480)
menu.Position = UDim2.new(0.5, -160, 0.5, -240)
menu.BackgroundColor3 = Color3.fromRGB(15, 15, 20)
menu.BackgroundTransparency = 0.1
menu.Visible = false
menu.Parent = gui
buatBisaDigeser(menu)

Instance.new("UICorner", menu).CornerRadius = UDim.new(0, 16)
local mStroke = Instance.new("UIStroke", menu)
mStroke.Color = Color3.fromRGB(80, 80, 90)
mStroke.Thickness = 2

local header = Instance.new("Frame")
header.Size = UDim2.new(1, 0, 0, 40)
header.BackgroundTransparency = 1
header.Parent = menu

local title = Instance.new("TextLabel")
title.Size = UDim2.new(1, -40, 1, 0)
title.Position = UDim2.new(0, 15, 0, 0)
title.BackgroundTransparency = 1
title.Text = "DJ DECK • GLOBAL"
title.TextColor3 = Color3.fromRGB(200, 200, 200)
title.Font = Enum.Font.GothamBold
title.TextXAlignment = Enum.TextXAlignment.Left
title.TextSize = 16
title.Parent = header

local closeBtn = Instance.new("TextButton")
closeBtn.Size = UDim2.new(0, 25, 0, 25)
closeBtn.Position = UDim2.new(1, -35, 0, 8)
closeBtn.BackgroundColor3 = Color3.fromRGB(255, 60, 60)
closeBtn.Text = "X"
closeBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
closeBtn.Font = Enum.Font.GothamBold
closeBtn.Parent = header
Instance.new("UICorner", closeBtn).CornerRadius = UDim.new(0, 6)

-- Piringan Hitam (Vinyl)
local vinylContainer = Instance.new("Frame")
vinylContainer.Size = UDim2.new(0, 140, 0, 140)
vinylContainer.Position = UDim2.new(0.5, -70, 0, 50)
vinylContainer.BackgroundColor3 = Color3.fromRGB(10, 10, 10)
vinylContainer.Parent = menu
Instance.new("UICorner", vinylContainer).CornerRadius = UDim.new(1, 0)
local vStroke = Instance.new("UIStroke", vinylContainer)
vStroke.Color = Color3.fromRGB(50, 50, 50)
vStroke.Thickness = 4

-- LOGO DI TENGAH VINYL (FIX)
local cover = Instance.new("ImageLabel")
cover.Size = UDim2.new(0.6, 0, 0.6, 0) -- Ukuran 60% dari vinyl
cover.Position = UDim2.new(0.5, 0, 0.5, 0) -- Posisi di tengah
cover.AnchorPoint = Vector2.new(0.5, 0.5) -- Titik tumpu di tengah biar presisi
cover.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
cover.Image = "rbxassetid://140483700995156" -- ID LOGO LU
cover.Parent = vinylContainer
Instance.new("UICorner", cover).CornerRadius = UDim.new(1, 0)

-- Animasi Vinyl Muter
task.spawn(function()
    while true do
        task.wait()
        if menu.Visible and music.IsPlaying then
            cover.Rotation = cover.Rotation + 1
        end
    end
end)

-- Equalizer
local eqFrame = Instance.new("Frame")
eqFrame.Size = UDim2.new(0.8, 0, 0, 40)
eqFrame.Position = UDim2.new(0.1, 0, 0, 200)
eqFrame.BackgroundTransparency = 1
eqFrame.Parent = menu

local bars = {}
for i = 1, 15 do
    local bar = Instance.new("Frame")
    bar.Size = UDim2.new(0.05, 0, 0.2, 0)
    bar.Position = UDim2.new(i * 0.06, 0, 1, 0)
    bar.AnchorPoint = Vector2.new(0, 1)
    bar.BackgroundColor3 = Color3.fromRGB(200, 200, 200)
    bar.Parent = eqFrame
    table.insert(bars, bar)
end

RunService.RenderStepped:Connect(function()
    if menu.Visible and music.IsPlaying then
        for _, bar in ipairs(bars) do
            bar.Size = UDim2.new(0.05, 0, math.random(10, 100)/100, 0)
        end
    end
end)

-- Label Lagu
local songLabel = Instance.new("TextLabel")
songLabel.Size = UDim2.new(1, 0, 0, 25)
songLabel.Position = UDim2.new(0, 0, 0, 250)
songLabel.BackgroundTransparency = 1
songLabel.Text = "Pilih Lagu..."
songLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
songLabel.Font = Enum.Font.GothamBlack
songLabel.TextSize = 20
songLabel.Parent = menu

local artistLabel = Instance.new("TextLabel")
artistLabel.Size = UDim2.new(1, 0, 0, 20)
artistLabel.Position = UDim2.new(0, 0, 0, 275)
artistLabel.BackgroundTransparency = 1
artistLabel.Text = "Playlist"
artistLabel.TextColor3 = Color3.fromRGB(150, 150, 150)
artistLabel.Font = Enum.Font.Gotham
artistLabel.TextSize = 14
artistLabel.Parent = menu

-- Kontrol
local controlFrame = Instance.new("Frame")
controlFrame.Size = UDim2.new(0.8, 0, 0, 45)
controlFrame.Position = UDim2.new(0.1, 0, 0, 300)
controlFrame.BackgroundTransparency = 1
controlFrame.Parent = menu

local function buatBtn(teks, pos, callback)
    local b = Instance.new("TextButton")
    b.Size = UDim2.new(0.25, 0, 1, 0)
    b.Position = pos
    b.BackgroundColor3 = Color3.fromRGB(30, 30, 35)
    b.Text = teks
    b.TextColor3 = Color3.fromRGB(255, 255, 255)
    b.Font = Enum.Font.GothamBold
    b.Parent = controlFrame
    Instance.new("UICorner", b).CornerRadius = UDim.new(0, 8)
    b.MouseButton1Click:Connect(callback)
    return b
end

buatBtn("<<", UDim2.new(0, 0, 0, 0), function() end)
local playBtn = buatBtn("▶", UDim2.new(0.26, 0, 0, 0), function()
    if music.IsPlaying then music:Pause() playBtn.Text = "▶"
    else music:Play() playBtn.Text = "⏸" end
end)
buatBtn(">>", UDim2.new(0.52, 0, 0, 0), function() end)
local stopBtn = buatBtn("⏹", UDim2.new(0.78, 0, 0, 0), function()
    music:Stop() playBtn.Text = "▶"
end)

-- Daftar Kategori & Lagu
local scroll = Instance.new("ScrollingFrame")
scroll.Size = UDim2.new(0.9, 0, 0, 100)
scroll.Position = UDim2.new(0.05, 0, 0, 360)
scroll.BackgroundTransparency = 1
scroll.CanvasSize = UDim2.new(0, 0, 0, 0)
scroll.AutomaticCanvasSize = Enum.AutomaticSize.Y
scroll.ScrollBarThickness = 4
scroll.Parent = menu

local layout = Instance.new("UIListLayout", scroll)
layout.Padding = UDim.new(0, 5)

local function tampilkanKategori()
    for _, child in ipairs(scroll:GetChildren()) do
        if child:IsA("TextButton") then child:Destroy() end
    end

    for i, pl in ipairs(Playlists) do
        local btn = Instance.new("TextButton")
        btn.Size = UDim2.new(1, -5, 0, 35)
        btn.BackgroundColor3 = Color3.fromRGB(25, 25, 30)
        btn.Text = pl.Name
        btn.TextColor3 = Color3.fromRGB(255, 255, 255)
        btn.Font = Enum.Font.GothamBold
        btn.Parent = scroll
        Instance.new("UICorner", btn).CornerRadius = UDim.new(0, 5)

        btn.MouseButton1Click:Connect(function()
            tampilkanLagu(i)
        end)
    end
end

function tampilkanLagu(index)
    for _, child in ipairs(scroll:GetChildren()) do
        if child:IsA("TextButton") then child:Destroy() end
    end

    local backBtn = Instance.new("TextButton")
    backBtn.Size = UDim2.new(1, -5, 0, 30)
    backBtn.BackgroundColor3 = Color3.fromRGB(255, 60, 60)
    backBtn.Text = "< KEMBALI"
    backBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
    backBtn.Font = Enum.Font.GothamBold
    backBtn.Parent = scroll
    Instance.new("UICorner", backBtn).CornerRadius = UDim.new(0, 5)
    backBtn.MouseButton1Click:Connect(function() tampilkanKategori() end)

    for i, track in ipairs(Playlists[index].Tracks) do
        local btn = Instance.new("TextButton")
        btn.Size = UDim2.new(1, -5, 0, 30)
        btn.BackgroundColor3 = Color3.fromRGB(15, 15, 20)
        btn.Text = track.SongName
        btn.TextColor3 = Color3.fromRGB(200, 200, 200)
        btn.Font = Enum.Font.Gotham
        btn.TextXAlignment = Enum.TextXAlignment.Left
        btn.Parent = scroll
        Instance.new("UICorner", btn).CornerRadius = UDim.new(0, 5)
        local pad = Instance.new("UIPadding", btn)
        pad.PaddingLeft = UDim.new(0, 10)

        btn.MouseButton1Click:Connect(function()
            music.SoundId = track.SoundId
            music:Play()
            songLabel.Text = track.SongName
            artistLabel.Text = Playlists[index].Name
            playBtn.Text = "⏸"
        end)
    end
end

tampilkanKategori()

-- ===================== LOGIKA TOMBOL =====================
openBtn.MouseButton1Click:Connect(function() 
    menu.Visible = not menu.Visible 
    if menu.Visible then tampilkanKategori() end
end)
closeBtn.MouseButton1Click:Connect(function() menu.Visible = false end)
