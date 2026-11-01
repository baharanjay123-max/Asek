-- ============================================================
-- SCRIPT FINAL: MUSIK (BKB, BKB V2, HARDSTYLE, DJ) + FLY
-- GUI BISA DIGESER
-- by BRUHH
-- ============================================================

local player = game.Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")
local UIS = game:GetService("UserInputService")
local RunService = game:GetService("RunService")
local SoundService = game:GetService("SoundService")

local flying = false
local bodyVelocity, bodyGyro
local music = Instance.new("Sound", SoundService)
music.Volume = 0.5

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

-- ===================== GUI UTAMA (SATU KOTAK) =====================
local gui = Instance.new("ScreenGui")
gui.Name = "ScriptGui"
gui.ResetOnSpawn = false
gui.Parent = playerGui

local mainGui = Instance.new("Frame")
mainGui.Size = UDim2.new(0, 150, 0, 110)
mainGui.Position = UDim2.new(0.1, 0, 0.2, 0)
mainGui.BackgroundColor3 = Color3.fromRGB(20, 20, 25)
mainGui.Parent = gui
buatBisaDigeser(mainGui)

local corner = Instance.new("UICorner", mainGui)
corner.CornerRadius = UDim.new(0, 10)
local stroke = Instance.new("UIStroke", mainGui)
stroke.Color = Color3.fromRGB(138, 43, 226)
stroke.Thickness = 1.5

local openBtn = Instance.new("TextButton")
openBtn.Size = UDim2.new(0.8, 0, 0, 35)
openBtn.Position = UDim2.new(0.1, 0, 0, 10)
openBtn.BackgroundColor3 = Color3.fromRGB(138, 43, 226)
openBtn.Text = "MENU MUSIK"
openBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
openBtn.Font = Enum.Font.GothamBold
openBtn.TextScaled = true
openBtn.Parent = mainGui
Instance.new("UICorner", openBtn).CornerRadius = UDim.new(0, 5)

local flyBtn = Instance.new("TextButton")
flyBtn.Size = UDim2.new(0.8, 0, 0, 35)
flyBtn.Position = UDim2.new(0.1, 0, 0, 60)
flyBtn.BackgroundColor3 = Color3.fromRGB(75, 0, 130)
flyBtn.Text = "FLY: OFF"
flyBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
flyBtn.Font = Enum.Font.GothamBlack
flyBtn.TextScaled = true
flyBtn.Parent = mainGui
Instance.new("UICorner", flyBtn).CornerRadius = UDim.new(0, 5)

-- ===================== MENU MUSIK =====================
local menu = Instance.new("Frame")
menu.Size = UDim2.new(0, 280, 0, 400)
menu.Position = UDim2.new(0.5, -140, 0.5, -200)
menu.BackgroundColor3 = Color3.fromRGB(20, 20, 25)
menu.Visible = false
menu.Parent = gui
buatBisaDigeser(menu)

local menuCorner = Instance.new("UICorner", menu)
menuCorner.CornerRadius = UDim.new(0, 10)
local menuStroke = Instance.new("UIStroke", menu)
menuStroke.Color = Color3.fromRGB(138, 43, 226)

local closeBtn = Instance.new("TextButton")
closeBtn.Size = UDim2.new(0, 30, 0, 30)
closeBtn.Position = UDim2.new(1, -35, 0, 5)
closeBtn.BackgroundColor3 = Color3.fromRGB(255, 70, 70)
closeBtn.Text = "X"
closeBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
closeBtn.Font = Enum.Font.GothamBold
closeBtn.Parent = menu
Instance.new("UICorner", closeBtn).CornerRadius = UDim.new(0, 6)
closeBtn.MouseButton1Click:Connect(function() menu.Visible = false end)

local scroll = Instance.new("ScrollingFrame")
scroll.Size = UDim2.new(0.9, 0, 0, 300)
scroll.Position = UDim2.new(0.05, 0, 0, 40)
scroll.BackgroundTransparency = 1
scroll.CanvasSize = UDim2.new(0, 0, 0, 0)
scroll.AutomaticCanvasSize = Enum.AutomaticSize.Y
scroll.ScrollBarThickness = 4
scroll.ScrollBarImageColor3 = Color3.fromRGB(186, 85, 211)
scroll.Parent = menu

local layout = Instance.new("UIListLayout", scroll)
layout.Padding = UDim.new(0, 5)

-- ===================== DATA LAGU (TANPA POP & KOPLO) =====================
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
        Name = "BKB V2",
        Tracks = {
            { SongName = "BKB 1", SoundId = "rbxassetid://78583186949831" },
            { SongName = "BKB 2", SoundId = "rbxassetid://133694302661135" },
            { SongName = "BKB 3", SoundId = "rbxassetid://79790433594969" },
            { SongName = "BKB 4", SoundId = "rbxassetid://121078631339103" },
            { SongName = "BKB 5", SoundId = "rbxassetid://85098002516417" },
            { SongName = "BKB 6", SoundId = "rbxassetid://116602442864168" },
            { SongName = "BKB 7", SoundId = "rbxassetid://71016426638505" },
            { SongName = "BKB 8", SoundId = "rbxassetid://107853616397350" },
            { SongName = "BKB 9", SoundId = "rbxassetid://77692543640813" },
            { SongName = "BKB 10", SoundId = "rbxassetid://85838201517610" },
            { SongName = "BKB 11", SoundId = "rbxassetid://102075965487553" },
            { SongName = "BKB 12", SoundId = "rbxassetid://109995751948202" },
            { SongName = "BKB 13", SoundId = "rbxassetid://133609537131447" },
            { SongName = "BKB 14", SoundId = "rbxassetid://88454453881663" },
            { SongName = "BKB 15", SoundId = "rbxassetid://94067702716341" },
            { SongName = "BKB 16", SoundId = "rbxassetid://124466381736486" },
            { SongName = "BKB 17", SoundId = "rbxassetid://140628414861157" },
            { SongName = "BKB 18", SoundId = "rbxassetid://116155260257066" },
            { SongName = "BKB 19", SoundId = "rbxassetid://81684031958093" },
            { SongName = "BKB 20", SoundId = "rbxassetid://100772410288999" },
            { SongName = "BKB 21", SoundId = "rbxassetid://108358962150221" },
            { SongName = "BKB 22", SoundId = "rbxassetid://135280702638398" },
            { SongName = "BKB 23", SoundId = "rbxassetid://113810356261807" },
            { SongName = "BKB 24", SoundId = "rbxassetid://90234380074355" },
            { SongName = "BKB 25", SoundId = "rbxassetid://139010707875332" },
        }
    },
    {
        Name = "HARDSTYLE",
        Tracks = {
            { SongName = "HARDSTYLE INFINITY", SoundId = "rbxassetid://139874564810808" },
            { SongName = "JUMPSTYLE LORD", SoundId = "rbxassetid://139581929665915" },
            { SongName = "LELOUCH x GOKU", SoundId = "rbxassetid://125158558180034" },
            { SongName = "BLEACH x ATOMIC", SoundId = "rbxassetid://111832552952054" },
            { SongName = "ISAGI x TRUNKS", SoundId = "rbxassetid://135004904399377" },
            { SongName = "ULTRAS GANG", SoundId = "rbxassetid://84185150763409" },
            { SongName = "STEEL AND FURY", SoundId = "rbxassetid://139268986803502" },
            { SongName = "STUCY TITANIUM", SoundId = "rbxassetid://92550141644787" },
            { SongName = "ESCANOR x SUN", SoundId = "rbxassetid://82735506509755" },
            { SongName = "GAROU x VAGETA", SoundId = "rbxassetid://120714714228068" },
            { SongName = "POKE BATTLE", SoundId = "rbxassetid://102518604969857" },
            { SongName = "JINWOO LEVEL UP", SoundId = "rbxassetid://73989983210966" },
            { SongName = "LABUBU", SoundId = "rbxassetid://1369365994853231" },
            { SongName = "TUNG-TUNG HARD STYLE", SoundId = "rbxassetid://117420765681256" },
            { SongName = "ATOMATIC SHADOW", SoundId = "rbxassetid://124217798047128" },
            { SongName = "F-STUDENT HARDSTYLE", SoundId = "rbxassetid://131311154137854" },
            { SongName = "KONEKI x FORGET", SoundId = "rbxassetid://76270785580077" },
            { SongName = "NATRA FREZBOY", SoundId = "rbxassetid://98478581148879" },
            { SongName = "MADARA x ATOMATIC", SoundId = "rbxassetid://77561861417066" },
            { SongName = "JIRAYA x NINJA", SoundId = "rbxassetid://131144159228987" },
            { SongName = "HARDSTYLE FESTIVAL", SoundId = "rbxassetid://114245601399765" },
            { SongName = "KRISTYNA", SoundId = "rbxassetid://124982066959568" },
            { SongName = "67 KID HARDSTYLE", SoundId = "rbxassetid://120386531011776" },
            { SongName = "HARDSTYLE V2", SoundId = "rbxassetid://138121016641010" },
            { SongName = "SLEEP WEL IN", SoundId = "rbxassetid://122534121758072" },
            { SongName = "BREAKING THE", SoundId = "rbxassetid://111129401956796" },
            { SongName = "VAGETA x WARRIOR", SoundId = "rbxassetid://106322831031093" },
            { SongName = "GUITARSTYLE HARDCORE", SoundId = "rbxassetid://123000795714977" },
            { SongName = "HARDSTYLE VANDETTA", SoundId = "rbxassetid://103762571033906" },
            { SongName = "FREAKS x GOOD", SoundId = "rbxassetid://82889134990665" },
            { SongName = "HARDSTYLE BATTLECRY", SoundId = "rbxassetid://132231874114712" },
            { SongName = "TURKISH HARDSTYLE", SoundId = "rbxassetid://122680930262375" },
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
    }
}

-- ===================== RENDER MENU MUSIK =====================
local kategoriAktif = 1

local function tampilkanLagu()
    for _, child in ipairs(scroll:GetChildren()) do
        if child:IsA("TextButton") then
            child:Destroy()
        end
    end

    local tracks = Playlists[kategoriAktif].Tracks
    for i, track in ipairs(tracks) do
        local btn = Instance.new("TextButton")
        btn.Size = UDim2.new(1, -10, 0, 35)
        btn.BackgroundColor3 = Color3.fromRGB(75, 0, 130)
        btn.Text = track.SongName
        btn.TextColor3 = Color3.fromRGB(255, 255, 255)
        btn.Font = Enum.Font.GothamBold
        btn.TextScaled = true
        btn.Parent = scroll
        Instance.new("UICorner", btn).CornerRadius = UDim.new(0, 5)
        
        btn.MouseButton1Click:Connect(function()
            music.SoundId = track.SoundId
            music:Play()
        end)
    end
end

tampilkanLagu()

-- Tombol Ganti Kategori
local gantiKategoriBtn = Instance.new("TextButton")
gantiKategoriBtn.Size = UDim2.new(0.8, 0, 0, 35)
gantiKategoriBtn.Position = UDim2.new(0.1, 0, 1, -85)
gantiKategoriBtn.BackgroundColor3 = Color3.fromRGB(46, 204, 95)
gantiKategoriBtn.Text = "KATEGORI: BKB"
gantiKategoriBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
gantiKategoriBtn.Font = Enum.Font.GothamBold
gantiKategoriBtn.TextScaled = true
gantiKategoriBtn.Parent = menu
Instance.new("UICorner", gantiKategoriBtn).CornerRadius = UDim.new(0, 5)

gantiKategoriBtn.MouseButton1Click:Connect(function()
    kategoriAktif = kategoriAktif + 1
    if kategoriAktif > #Playlists then
        kategoriAktif = 1
    end
    gantiKategoriBtn.Text = "KATEGORI: " .. Playlists[kategoriAktif].Name
    tampilkanLagu()
end)

-- Tombol Stop Musik
local stopBtn = Instance.new("TextButton")
stopBtn.Size = UDim2.new(0.8, 0, 0, 35)
stopBtn.Position = UDim2.new(0.1, 0, 1, -45)
stopBtn.BackgroundColor3 = Color3.fromRGB(255, 70, 70)
stopBtn.Text = "STOP MUSIK"
stopBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
stopBtn.Font = Enum.Font.GothamBold
stopBtn.TextScaled = true
stopBtn.Parent = menu
Instance.new("UICorner", stopBtn).CornerRadius = UDim.new(0, 5)
stopBtn.MouseButton1Click:Connect(function() music:Stop() end)

-- ===================== LOGIKA =====================
openBtn.MouseButton1Click:Connect(function() menu.Visible = not menu.Visible end)

flyBtn.MouseButton1Click:Connect(function()
    local char = player.Character
    if not char then return end
    local hrp = char:FindFirstChild("HumanoidRootPart")
    if not hrp then return end

    flying = not flying
    if flying then
        bodyVelocity = Instance.new("BodyVelocity", hrp)
        bodyVelocity.MaxForce = Vector3.new(1e5, 1e5, 1e5)
        bodyVelocity.Velocity = Vector3.zero
        
        bodyGyro = Instance.new("BodyGyro", hrp)
        bodyGyro.MaxTorque = Vector3.new(1e5, 1e5, 1e5)
        bodyGyro.P = 3000
        bodyGyro.D = 500
        
        flyBtn.Text = "FLY: ON"
        flyBtn.BackgroundColor3 = Color3.fromRGB(186, 85, 211)
    else
        if bodyVelocity then bodyVelocity:Destroy() end
        if bodyGyro then bodyGyro:Destroy() end
        flyBtn.Text = "FLY: OFF"
        flyBtn.BackgroundColor3 = Color3.fromRGB(75, 0, 130)
    end
end)

-- ===================== LOOP FLY (MURNI JOYSTICK + KAMERA) =====================
RunService.RenderStepped:Connect(function()
    if flying and bodyVelocity and bodyGyro then
        local char = player.Character
        local hum = char and char:FindFirstChildOfClass("Humanoid")
        local cam = workspace.CurrentCamera
        
        if hum then
            local moveDir = hum.MoveDirection
            local camCFrame = cam.CFrame
            
            local camLookFlat = Vector3.new(camCFrame.LookVector.X, 0, camCFrame.LookVector.Z).Unit
            local camRightFlat = Vector3.new(camCFrame.RightVector.X, 0, camCFrame.RightVector.Z).Unit
            
            local forwardMove = camLookFlat * -moveDir.Z
            local rightMove = camRightFlat * moveDir.X
            local verticalMove = Vector3.new(0, camCFrame.LookVector.Y, 0) * -moveDir.Z
            
            local finalMove = forwardMove + rightMove + verticalMove
            
            if finalMove.Magnitude > 0 then
                bodyVelocity.Velocity = finalMove.Unit * 60
            else
                bodyVelocity.Velocity = Vector3.zero
            end
            
            bodyGyro.CFrame = camCFrame
        end
    end
end)
