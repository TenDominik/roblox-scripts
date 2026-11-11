return(function(Di6ov, ...)
local I4a3rz = {"HGlsNprSq8r3p";"wxtfn0nr";"Avo";"drZNK";"IUhN12u59TcLTwAq";"SeN";"caKfTrTI4";"PnXBng0Nx3Y2";"F0DBbjntEobVbEbs";"hONh2VlE";"tsvTVdSffC";"02PzT";"iJRfTZiIEvi2jDCTk";"VT4KhTUqwEJTRy"}
local 5sAlDGC6 = function(...)
-- ZenScripts key loader. Interface adapted from Arqel UI by Cobru (MIT).

repeat task.wait() until game:IsLoaded()

local cloneref = cloneref or function(obj) return obj end
local gethui = gethui or function() return cloneref(game:GetService(loadstring(base64decode("Q29yZUd1aQ=="))())) end

--services
local TweenService = cloneref(game:GetService(loadstring(base64decode("VHdlZW5TZXJ2aWNl"))()))
local UserInputService = cloneref(game:GetService(loadstring(base64decode("VXNlcklucHV0U2VydmljZQ=="))()))
local HttpService = cloneref(game:GetService(loadstring(base64decode("SHR0cFNlcnZpY2U="))()))
local Workspace = cloneref(game:GetService(loadstring(base64decode("V29ya3NwYWNl"))()))
local RunService = cloneref(game:GetService(loadstring(base64decode("UnVuU2VydmljZQ=="))()))
local Lighting = cloneref(game:GetService(loadstring(base64decode("TGlnaHRpbmc="))()))
local Players = cloneref(game:GetService(loadstring(base64decode("UGxheWVycw=="))()))

local hui = gethui()

if getgenv().ZenLoaded and hui:FindFirstChild(loadstring(base64decode("WmVuS2V5U3lzdGVt"))()) then return getgenv().Zen end
if getgenv().ZenLoaded and hui:FindFirstChild(loadstring(base64decode("WmVuS2V5bGVzc1N5c3RlbQ=="))()) then return getgenv().Zen end
getgenv().ZenLoaded = true
getgenv().ZenClosed = false

local Zen = {}

--appearance
Zen.Appearance = {
    Title = loadstring(base64decode("WmVuU2NyaXB0cw=="))(),
    Subtitle = loadstring(base64decode("RW50ZXIgeW91ciBrZXkgdG8gY29udGludWU="))(),
    Icon = loadstring(base64decode("cmJ4YXNzZXRpZDovLzEzNDY5NzA0MzExODI4Mg=="))(),
    IconSize = UDim2.new(0, 30, 0, 30)
}

--links
Zen.Links = {
    GetKey = loadstring(base64decode(""))(),
    Discord = loadstring(base64decode("aHR0cHM6Ly9kaXNjb3JkLmdnL1F5bXRlRGJjc3o="))()
}

--storage
Zen.Storage = {
    FileName = loadstring(base64decode("WmVuU2NyaXB0c19LZXk="))(),
    Remember = true,
    AutoLoad = true
}

--options
Zen.Options = {
    Keyless = nil,
    KeylessUI = false,
    Blur = true,
    Draggable = true,
    NoGetKey = false
}

--theme
Zen.Theme = {
    Accent = Color3.fromRGB(110, 60, 255),
    AccentHover = Color3.fromRGB(130, 90, 255),
    Background = Color3.fromRGB(10, 10, 20),
    Header = Color3.fromRGB(15, 15, 30),
    Input = Color3.fromRGB(20, 20, 40),
    Text = Color3.fromRGB(255, 255, 255),
    TextDim = Color3.fromRGB(160, 160, 200),
    Success = Color3.fromRGB(0, 220, 180),
    Error = Color3.fromRGB(255, 70, 90),
    Warning = Color3.fromRGB(255, 180, 50),
    StatusIdle = Color3.fromRGB(120, 100, 200),
    Discord = Color3.fromRGB(88, 101, 242),
    DiscordHover = Color3.fromRGB(114, 137, 218),
    Divider = Color3.fromRGB(45, 45, 70),
    Pending = Color3.fromRGB(60, 60, 60)
}

--callbacks
Zen.Callbacks = {
    OnVerify = nil,
    OnSuccess = nil,
    OnFail = nil,
    OnClose = nil
}

Zen.Changelog = {}

--shop
Zen.Shop = {
    Enabled = false,
    Icon = loadstring(base64decode(""))(),
    Title = loadstring(base64decode("R2V0IFByZW1pdW0gQWNjZXNz"))(),
    Subtitle = loadstring(base64decode("SW5zdGFudCBkZWxpdmVyeSDigKIgMjQvNyBzdXBwb3J0"))(),
    ButtonText = loadstring(base64decode("QnV5"))(),
    Link = loadstring(base64decode(""))()
}

--internal
local Internal = {
    Junkie = nil,
    BlurEffect = nil,
    NotificationList = {},
    ValidateFunction = nil,
    IsJunkieMode = false,
    IconsLoaded = false
}

local IconBaseURL = loadstring(base64decode("aHR0cHM6Ly9yYXcuZ2l0aHVidXNlcmNvbnRlbnQuY29tL0NvYnJ1aGVoZS9leHBlcnQtb2N0by1kb29kbGUvbWFpbi9JY29ucy8="))()
local IconFiles = {
    key = loadstring(base64decode("bHVjaWRlLS1rZXkucG5n"))(),
    shield = loadstring(base64decode("bHVjaWRlLS1zaGllbGQtbWludXMucG5n"))(),
    check = loadstring(base64decode("cHJpbWUtLWNoZWNrLXNxdWFyZS5wbmc="))(),
    copy = loadstring(base64decode("Zmxvd2JpdGUtLWNsaXBib2FyZC1vdXRsaW5lLnBuZw=="))(),
    discord = loadstring(base64decode("cWxlbWVudGluZS1pY29ucy0tZGlzY29yZC0xNi5wbmc="))(),
    alert = loadstring(base64decode("bWRpLS1hbGVydC1vY3RhZ29uLW91dGxpbmUucG5n"))(),
    lock = loadstring(base64decode("bHVjaWRlLS11c2VyLWxvY2sucG5n"))(),
    loading = loadstring(base64decode("bm9uaWNvbnMtLWxvYWRpbmctMTYucG5n"))(),
    close = loadstring(base64decode("bWF0ZXJpYWwtc3ltYm9scy0tZGFuZ2Vyb3VzLW91dGxpbmUucG5n"))(),
    changelog = loadstring(base64decode("YW50LWRlc2lnbi0tc3luYy1vdXRsaW5lZC5wbmc="))(),
    user = loadstring(base64decode("VS5wbmc="))(),
    clock = loadstring(base64decode("Q2xvY2sucG5n"))(),
    cart = loadstring(base64decode("Q2FydC5wbmc="))(),
    nogetkey = loadstring(base64decode("bHVjaWRlLS1sb2NrLnBuZw=="))()
}

local FallbackIcons = {
    key = loadstring(base64decode("cmJ4YXNzZXRpZDovLzk2NTEwMTk0NDY1NDIw"))(),
    shield = loadstring(base64decode("cmJ4YXNzZXRpZDovLzg5OTY1MDU5NTI4OTIx"))(),
    check = loadstring(base64decode("cmJ4YXNzZXRpZDovLzc2MDc4NDk1MTc4MTQ5"))(),
    copy = loadstring(base64decode("cmJ4YXNzZXRpZDovLzEyNTg1MTg5NzcxODQ5Mw=="))(),
    discord = loadstring(base64decode("cmJ4YXNzZXRpZDovLzgzMjc4NDUwNTM3MTE2"))(),
    alert = loadstring(base64decode("cmJ4YXNzZXRpZDovLzE0MDQzODM2Nzk1NjA1MQ=="))(),
    lock = loadstring(base64decode("cmJ4YXNzZXRpZDovLzExNDM1NTA2MzUxNTQ3Mw=="))(),
    loading = loadstring(base64decode("cmJ4YXNzZXRpZDovLzExNjUzNTcxMjc4OTk0NQ=="))(),
    close = loadstring(base64decode("cmJ4YXNzZXRpZDovLzYwMjI2Njg5MTY="))(),
    changelog = loadstring(base64decode("cmJ4YXNzZXRpZDovLzEzODEzMzE5MDAxNTI3Nw=="))(),
    user = loadstring(base64decode("cmJ4YXNzZXRpZDovLzc3NDAwMTI1MTk2Njky"))(),
    clock = loadstring(base64decode("cmJ4YXNzZXRpZDovLzg3NTA1MzQ5MzYyNjI4"))(),
    cart = loadstring(base64decode("cmJ4YXNzZXRpZDovLzExNDc1NDUxODE4Mzg3Mg=="))(),
    nogetkey = loadstring(base64decode("cmJ4YXNzZXRpZDovLzExOTc2NTk3NTE1MzAyOQ=="))()
}

local CachedIcons = {}
local FolderName = loadstring(base64decode("WmVuU2NyaXB0cw=="))()
local IconsFolder = loadstring(base64decode("SWNvbnM="))()

local function isMobile()
    return UserInputService.TouchEnabled and not UserInputService.KeyboardEnabled
end

local function getScale()
    local viewport = Workspace.CurrentCamera.ViewportSize
    return math.clamp(math.min(viewport.X, viewport.Y) / 900, 0.65, 1.3)
end

local function hasFileSystem()
    local ok1 = pcall(function() return type(writefile) == loadstring(base64decode("ZnVuY3Rpb24="))() end)
    local ok2 = pcall(function() return type(readfile) == loadstring(base64decode("ZnVuY3Rpb24="))() end)
    local ok3 = pcall(function() return type(isfile) == loadstring(base64decode("ZnVuY3Rpb24="))() end)
    local ok4 = pcall(function() return type(makefolder) == loadstring(base64decode("ZnVuY3Rpb24="))() end)
    local ok5 = pcall(function() return type(isfolder) == loadstring(base64decode("ZnVuY3Rpb24="))() end)
    return ok1 and ok2 and ok3 and ok4 and ok5
end

local fileSystemSupported = hasFileSystem()

local function getFileName()
    return FolderName .. loadstring(base64decode("Lw=="))() .. Zen.Storage.FileName .. loadstring(base64decode("LnR4dA=="))()
end

local function saveKey(key)
    if not fileSystemSupported or not Zen.Storage.Remember then return false end
    return pcall(function() writefile(getFileName(), key) end)
end

local function loadKey()
    if not fileSystemSupported then return nil end
    local ok, content = pcall(function()
        if isfile(getFileName()) then return readfile(getFileName()) end
        return nil
    end)
    if ok and content and content ~= loadstring(base64decode(""))() then return content end
    return nil
end

local function clearKey()
    if not fileSystemSupported then return false end
    return pcall(function() delfile(getFileName()) end)
end

local function ensureFolders()
    if not fileSystemSupported then return false end
    pcall(function()
        if not isfolder(FolderName) then makefolder(FolderName) end
        if not isfolder(FolderName .. loadstring(base64decode("Lw=="))() .. IconsFolder) then makefolder(FolderName .. loadstring(base64decode("Lw=="))() .. IconsFolder) end
    end)
    return true
end

local function getIconPath(iconName)
    return FolderName .. loadstring(base64decode("Lw=="))() .. IconsFolder .. loadstring(base64decode("Lw=="))() .. IconFiles[iconName]
end

local function isIconCached(iconName)
    if not fileSystemSupported then return false end
    local success, result = pcall(function() return isfile(getIconPath(iconName)) end)
    return success and result
end

local function downloadIcon(iconName)
    if not fileSystemSupported then
        CachedIcons[iconName] = FallbackIcons[iconName]
        return false
    end
    local path = getIconPath(iconName)
    if isIconCached(iconName) then
        local success = pcall(function() CachedIcons[iconName] = getcustomasset(path) end)
        if success then return true end
    end
    local success = pcall(function()
        local response = game:HttpGet(IconBaseURL .. IconFiles[iconName])
        if #response < 100 then error(loadstring(base64decode("SW52YWxpZA=="))()) end
        writefile(path, response)
        CachedIcons[iconName] = getcustomasset(path)
    end)
    if not success then CachedIcons[iconName] = FallbackIcons[iconName] end
    return success
end

local function getIcon(iconName)
    return CachedIcons[iconName] or FallbackIcons[iconName]
end

local function getLogoIcon()
    return Zen.Appearance.Icon
end

local function getShopIcon()
    if Zen.Shop.Icon == loadstring(base64decode(""))() then return getLogoIcon() end
    return Zen.Shop.Icon
end

local function isShopEnabled()
    return Zen.Shop.Enabled
end

local function allIconsCached()
    if not fileSystemSupported then return false end
    local iconNames = {loadstring(base64decode("a2V5"))(), loadstring(base64decode("c2hpZWxk"))(), loadstring(base64decode("Y2hlY2s="))(), loadstring(base64decode("Y29weQ=="))(), loadstring(base64decode("ZGlzY29yZA=="))(), loadstring(base64decode("YWxlcnQ="))(), loadstring(base64decode("bG9jaw=="))(), loadstring(base64decode("bG9hZGluZw=="))(), loadstring(base64decode("Y2xvc2U="))(), loadstring(base64decode("Y2hhbmdlbG9n"))(), loadstring(base64decode("dXNlcg=="))(), loadstring(base64decode("Y2xvY2s="))(), loadstring(base64decode("Y2FydA=="))(), loadstring(base64decode("bm9nZXRrZXk="))()}
    for _, name in ipairs(iconNames) do
        if not isIconCached(name) then return false end
    end
    return true
end

local function loadAllIconsFromCache()
    ensureFolders()
    local iconNames = {loadstring(base64decode("a2V5"))(), loadstring(base64decode("c2hpZWxk"))(), loadstring(base64decode("Y2hlY2s="))(), loadstring(base64decode("Y29weQ=="))(), loadstring(base64decode("ZGlzY29yZA=="))(), loadstring(base64decode("YWxlcnQ="))(), loadstring(base64decode("bG9jaw=="))(), loadstring(base64decode("bG9hZGluZw=="))(), loadstring(base64decode("Y2xvc2U="))(), loadstring(base64decode("Y2hhbmdlbG9n"))(), loadstring(base64decode("dXNlcg=="))(), loadstring(base64decode("Y2xvY2s="))(), loadstring(base64decode("Y2FydA=="))(), loadstring(base64decode("bm9nZXRrZXk="))()}
    for _, name in ipairs(iconNames) do downloadIcon(name) end
    Internal.IconsLoaded = true
end

local function getExecutorName()
    local success, name = pcall(identifyexecutor)
    if success and name then return tostring(name) end
    return loadstring(base64decode("VW5rbm93bg=="))()
end

local function getDeviceType()
    local touch = UserInputService.TouchEnabled
    local keyboard = UserInputService.KeyboardEnabled
    local gamepad = UserInputService.GamepadEnabled
    if gamepad and not keyboard and not touch then return loadstring(base64decode("Q29uc29sZQ=="))()
    elseif touch and not keyboard then return loadstring(base64decode("TW9iaWxl"))()
    elseif keyboard and touch then return loadstring(base64decode("UEMgJiBUb3VjaA=="))()
    elseif keyboard then return loadstring(base64decode("UEM="))()
    else return loadstring(base64decode("VW5rbm93bg=="))() end
end

local function getHWID()
    local hwid = nil
    pcall(function() if gethwid then hwid = gethwid() end end)
    if not hwid then pcall(function() if getgenv().HWID then hwid = getgenv().HWID end end) end
    if not hwid then pcall(function() if game.RobloxHWID then hwid = tostring(game.RobloxHWID) end end) end
    if not hwid then
        local player = cloneref(Players.LocalPlayer)
        hwid = HttpService:GenerateGUID(false):gsub(loadstring(base64decode("LQ=="))(), loadstring(base64decode(""))()):sub(1, 32)
        if player then hwid = tostring(player.UserId) .. hwid:sub(1, 20) end
    end
    return hwid or loadstring(base64decode("Ti9B"))()
end

local function generateHiddenDots(availableWidth, charWidth)
    charWidth = charWidth or 5
    local count = math.floor(availableWidth / charWidth)
    count = math.max(count, 8)
    return string.rep(loadstring(base64decode("4oCi"))(), count)
end

local function formatTime12()
    local hour = tonumber(os.date(loadstring(base64decode("JUg="))()))
    local min = os.date(loadstring(base64decode("JU0="))())
    local sec = os.date(loadstring(base64decode("JVM="))())
    local period = loadstring(base64decode("QU0="))()
    if hour >= 12 then period = loadstring(base64decode("UE0="))() end
    if hour > 12 then hour = hour - 12 end
    if hour == 0 then hour = 12 end
    return string.format(loadstring(base64decode("JWQ6JXM6JXMgJXM="))(), hour, min, sec, period)
end

local function formatDate()
    return os.date(loadstring(base64decode("JWIgJWQsICVZ"))())
end

local function enableBlur()
    if not Zen.Options.Blur then return end
    local existing = Lighting:FindFirstChild(loadstring(base64decode("WmVuS2V5U3lzdGVtQmx1cg=="))())
    if existing then existing:Destroy() end
    Internal.BlurEffect = Instance.new(loadstring(base64decode("Qmx1ckVmZmVjdA=="))())
    Internal.BlurEffect.Name = loadstring(base64decode("WmVuS2V5U3lzdGVtQmx1cg=="))()
    Internal.BlurEffect.Size = 0
    Internal.BlurEffect.Parent = Lighting
    TweenService:Create(Internal.BlurEffect, TweenInfo.new(0.4, Enum.EasingStyle.Quart), {Size = 24}):Play()
end

local function disableBlur()
    if Internal.BlurEffect and Internal.BlurEffect.Parent then
        TweenService:Create(Internal.BlurEffect, TweenInfo.new(0.3, Enum.EasingStyle.Quart), {Size = 0}):Play()
        task.delay(0.3, function()
            if Internal.BlurEffect and Internal.BlurEffect.Parent then
                Internal.BlurEffect:Destroy()
                Internal.BlurEffect = nil
            end
        end)
    else
        local existing = Lighting:FindFirstChild(loadstring(base64decode("WmVuS2V5U3lzdGVtQmx1cg=="))())
        if existing then existing:Destroy() end
        Internal.BlurEffect = nil
    end
end

local function fullCleanup()
    getgenv().ZenLoaded = false
    getgenv().ZenClosed = true
    disableBlur()
    local gui1 = hui:FindFirstChild(loadstring(base64decode("WmVuS2V5U3lzdGVt"))())
    local gui2 = hui:FindFirstChild(loadstring(base64decode("WmVuS2V5bGVzc1N5c3RlbQ=="))())
    local gui3 = hui:FindFirstChild(loadstring(base64decode("WmVuTG9hZGluZ1NjcmVlbg=="))())
    if gui1 then gui1:Destroy() end
    if gui2 then gui2:Destroy() end
    if gui3 then gui3:Destroy() end
end

local function setupDragging(header, main)
    if not Zen.Options.Draggable then return end
    local dragging, dragStart, startPos, dragInput
    header.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
            dragging = true
            dragStart = input.Position
            startPos = main.Position
            dragInput = input
            input.Changed:Connect(function()
                if input.UserInputState == Enum.UserInputState.End then
                    if dragInput == input then dragging = false dragInput = nil end
                end
            end)
        end
    end)
    UserInputService.InputChanged:Connect(function(input)
        if not dragging or not dragInput then return end
        if input.UserInputType == Enum.UserInputType.MouseMovement then
            local delta = input.Position - dragStart
            main.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
        elseif input.UserInputType == Enum.UserInputType.Touch then
            if input == dragInput then
                local delta = input.Position - dragStart
                main.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
            end
        end
    end)
end

local function validateKey(key, validateFunc)
    if not validateFunc or not key or key == loadstring(base64decode(""))() then return false end
    local success, result = pcall(validateFunc, key)
    if not success then return false end
    if type(result) == loadstring(base64decode("dGFibGU="))() then return result.valid == true end
    if type(result) == loadstring(base64decode("Ym9vbGVhbg=="))() then return result end
    return false
end

local function CreateDoorOverlay(parentFrame, width, height)
    local overlay = Instance.new(loadstring(base64decode("RnJhbWU="))())
    overlay.Name = loadstring(base64decode("RG9vck92ZXJsYXk="))()
    overlay.Size = UDim2.new(1, 0, 1, 0)
    overlay.BackgroundTransparency = 1
    overlay.ClipsDescendants = true
    overlay.ZIndex = 50
    overlay.Parent = parentFrame

    local leftDoor = Instance.new(loadstring(base64decode("RnJhbWU="))())
    leftDoor.Name = loadstring(base64decode("TGVmdERvb3I="))()
    leftDoor.Size = UDim2.new(0.5, 0, 1, 0)
    leftDoor.Position = UDim2.new(0, 0, 0, 0)
    leftDoor.BackgroundColor3 = Zen.Theme.Header
    leftDoor.BorderSizePixel = 0
    leftDoor.ZIndex = 51
    leftDoor.Parent = overlay

    local rightDoor = Instance.new(loadstring(base64decode("RnJhbWU="))())
    rightDoor.Name = loadstring(base64decode("UmlnaHREb29y"))()
    rightDoor.Size = UDim2.new(0.5, 0, 1, 0)
    rightDoor.Position = UDim2.new(0.5, 0, 0, 0)
    rightDoor.BackgroundColor3 = Zen.Theme.Header
    rightDoor.BorderSizePixel = 0
    rightDoor.ZIndex = 51
    rightDoor.Parent = overlay

    local logoSize = math.min(width, height) * 0.28
    local logoImage = Instance.new(loadstring(base64decode("SW1hZ2VMYWJlbA=="))())
    logoImage.Name = loadstring(base64decode("RG9vckxvZ28="))()
    logoImage.Size = UDim2.new(0, logoSize, 0, logoSize)
    logoImage.Position = UDim2.new(0.5, 0, 0.5, 0)
    logoImage.AnchorPoint = Vector2.new(0.5, 0.5)
    logoImage.BackgroundTransparency = 1
    logoImage.Image = getLogoIcon()
    logoImage.ImageColor3 = Zen.Theme.Text
    logoImage.ScaleType = Enum.ScaleType.Fit
    logoImage.ZIndex = 54
    logoImage.Parent = overlay

    local halfWidth = math.ceil(width / 2)

    local function openDoors(callback)
        TweenService:Create(logoImage, TweenInfo.new(0.2, Enum.EasingStyle.Quart), {ImageTransparency = 1}):Play()
        task.wait(0.25)
        TweenService:Create(leftDoor, TweenInfo.new(0.4, Enum.EasingStyle.Quart, Enum.EasingDirection.In), {Position = UDim2.new(0, -halfWidth, 0, 0)}):Play()
        TweenService:Create(rightDoor, TweenInfo.new(0.4, Enum.EasingStyle.Quart, Enum.EasingDirection.In), {Position = UDim2.new(1, 0, 0, 0)}):Play()
        task.wait(0.45)
        overlay.Visible = false
        if callback then callback() end
    end

    local function closeDoors(callback)
        overlay.Visible = true
        leftDoor.Position = UDim2.new(0, -halfWidth, 0, 0)
        rightDoor.Position = UDim2.new(1, 0, 0, 0)
        logoImage.ImageTransparency = 1
        TweenService:Create(leftDoor, TweenInfo.new(0.35, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {Position = UDim2.new(0, 0, 0, 0)}):Play()
        TweenService:Create(rightDoor, TweenInfo.new(0.35, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {Position = UDim2.new(0.5, 0, 0, 0)}):Play()
        task.wait(0.38)
        TweenService:Create(logoImage, TweenInfo.new(0.25, Enum.EasingStyle.Quart), {ImageTransparency = 0}):Play()
        task.wait(0.3)
        if callback then callback() end
    end

    return {overlay = overlay, open = openDoors, close = closeDoors}
end

local function ShowLoadingScreen(onComplete)
    local completed = false
    local oldGui = hui:FindFirstChild(loadstring(base64decode("WmVuTG9hZGluZ1NjcmVlbg=="))())
    if oldGui then oldGui:Destroy() end
    local oldBlur = Lighting:FindFirstChild(loadstring(base64decode("WmVuTG9hZGluZ0JsdXI="))())
    if oldBlur then oldBlur:Destroy() end

    local blurEffect = Instance.new(loadstring(base64decode("Qmx1ckVmZmVjdA=="))())
    blurEffect.Name = loadstring(base64decode("WmVuTG9hZGluZ0JsdXI="))()
    blurEffect.Size = 0
    blurEffect.Parent = Lighting

    local gui = Instance.new(loadstring(base64decode("U2NyZWVuR3Vp"))())
    gui.Name = loadstring(base64decode("WmVuTG9hZGluZ1NjcmVlbg=="))()
    gui.ResetOnSpawn = false
    gui.IgnoreGuiInset = true
    gui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
    gui.Parent = hui

    local mobile = isMobile()

    local loadingScreen = Instance.new(loadstring(base64decode("RnJhbWU="))())
    loadingScreen.Size = UDim2.new(1, 0, 1, 0)
    loadingScreen.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
    loadingScreen.BackgroundTransparency = 1
    loadingScreen.BorderSizePixel = 0
    loadingScreen.Parent = gui

    local linesContainer = Instance.new(loadstring(base64decode("RnJhbWU="))())
    linesContainer.Size = UDim2.new(1, 0, 1, 0)
    linesContainer.BackgroundTransparency = 1
    linesContainer.Parent = loadingScreen

    local longLines = {}
    local linePositions = {0.15, 0.35, 0.65, 0.85}
    for cfowyH5M = 1, 4 do
        local line = Instance.new(loadstring(base64decode("RnJhbWU="))())
        line.Size = UDim2.new(0.3, 0, 0, mobile and 2 or 3)
        line.Position = UDim2.new(1.3, 0, linePositions[cfowyH5M], 0)
        line.BackgroundColor3 = Zen.Theme.Text
        line.BackgroundTransparency = 1
        line.BorderSizePixel = 0
        line.Parent = linesContainer
        Instance.new(loadstring(base64decode("VUlDb3JuZXI="))(), line).CornerRadius = UDim.new(1, 0)
        longLines[cfowyH5M] = line
    end

    local shipSize = mobile and 18 or 28
    local shipContainer = Instance.new(loadstring(base64decode("RnJhbWU="))())
    shipContainer.Size = UDim2.new(0, mobile and 100 or 150, 0, mobile and 30 or 50)
    shipContainer.Position = UDim2.new(0.5, 0, 0.35, 0)
    shipContainer.AnchorPoint = Vector2.new(0.5, 0.5)
    shipContainer.BackgroundTransparency = 1
    shipContainer.Parent = loadingScreen

    local shipBody = Instance.new(loadstring(base64decode("RnJhbWU="))())
    shipBody.Size = UDim2.new(0, shipSize, 0, shipSize)
    shipBody.Position = UDim2.new(0.5, 10, 0.5, 0)
    shipBody.AnchorPoint = Vector2.new(0.5, 0.5)
    shipBody.BackgroundColor3 = Zen.Theme.Text
    shipBody.BackgroundTransparency = 1
    shipBody.BorderSizePixel = 0
    shipBody.Parent = shipContainer
    Instance.new(loadstring(base64decode("VUlDb3JuZXI="))(), shipBody).CornerRadius = UDim.new(1, 0)

    local pointSize = mobile and 10 or 16
    local shipPoint = Instance.new(loadstring(base64decode("RnJhbWU="))())
    shipPoint.Size = UDim2.new(0, pointSize, 0, pointSize)
    shipPoint.Position = UDim2.new(1, 2, 0.5, 0)
    shipPoint.AnchorPoint = Vector2.new(0, 0.5)
    shipPoint.BackgroundColor3 = Zen.Theme.Text
    shipPoint.BackgroundTransparency = 1
    shipPoint.BorderSizePixel = 0
    shipPoint.Rotation = 45
    shipPoint.Parent = shipBody
    Instance.new(loadstring(base64decode("VUlDb3JuZXI="))(), shipPoint).CornerRadius = UDim.new(0, 3)

    local trails = {}
    local trailConfigs = {
        {X7ElZZqA = 0.20, width = mobile and 45 or 70},
        {X7ElZZqA = 0.38, width = mobile and 60 or 95},
        {X7ElZZqA = 0.62, width = mobile and 55 or 85},
        {X7ElZZqA = 0.80, width = mobile and 40 or 65}
    }
    for cfowyH5M, config in ipairs(trailConfigs) do
        local trail = Instance.new(loadstring(base64decode("RnJhbWU="))())
        trail.Size = UDim2.new(0, config.width, 0, mobile and 2 or 3)
        trail.Position = UDim2.new(0.5, -15, config.X7ElZZqA, 0)
        trail.AnchorPoint = Vector2.new(1, 0.5)
        trail.BackgroundColor3 = Zen.Theme.Text
        trail.BackgroundTransparency = 1
        trail.BorderSizePixel = 0
        trail.Parent = shipContainer
        local gradient = Instance.new(loadstring(base64decode("VUlHcmFkaWVudA=="))(), trail)
        gradient.Transparency = NumberSequence.new({NumberSequenceKeypoint.new(0, 1), NumberSequenceKeypoint.new(0.3, 0.5), NumberSequenceKeypoint.new(1, 0)})
        Instance.new(loadstring(base64decode("VUlDb3JuZXI="))(), trail).CornerRadius = UDim.new(1, 0)
        trails[cfowyH5M] = {frame = trail, config = config}
    end

    local phasesContainer = Instance.new(loadstring(base64decode("RnJhbWU="))())
    phasesContainer.Size = UDim2.new(0, mobile and 200 or 280, 0, mobile and 150 or 180)
    phasesContainer.Position = UDim2.new(0.5, 0, 0.62, 0)
    phasesContainer.AnchorPoint = Vector2.new(0.5, 0.5)
    phasesContainer.BackgroundTransparency = 1
    phasesContainer.Parent = loadingScreen

    local phasesLayout = Instance.new(loadstring(base64decode("VUlMaXN0TGF5b3V0"))(), phasesContainer)
    phasesLayout.Padding = UDim.new(0, mobile and 8 or 12)
    phasesLayout.SortOrder = Enum.SortOrder.LayoutOrder
    phasesLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
    phasesLayout.VerticalAlignment = Enum.VerticalAlignment.Center

    local phases = {}
    local phaseNames = {loadstring(base64decode("SW5pdGlhbGl6aW5n"))(), loadstring(base64decode("Q3JlYXRpbmcgZm9sZGVycw=="))(), loadstring(base64decode("RG93bmxvYWRpbmcgYXNzZXRz"))(), loadstring(base64decode("UHJlcGFyaW5nIGludGVyZmFjZQ=="))(), loadstring(base64decode("UmVhZHk="))()}
    local phaseTextSize = mobile and 14 or 18

    for cfowyH5M, name in ipairs(phaseNames) do
        local row = Instance.new(loadstring(base64decode("RnJhbWU="))())
        row.Size = UDim2.new(1, 0, 0, mobile and 22 or 28)
        row.BackgroundTransparency = 1
        row.LayoutOrder = cfowyH5M
        row.Parent = phasesContainer

        local indicator = Instance.new(loadstring(base64decode("VGV4dExhYmVs"))())
        indicator.Size = UDim2.new(0, mobile and 22 or 28, 0, mobile and 22 or 28)
        indicator.BackgroundTransparency = 1
        indicator.Text = loadstring(base64decode("4peL"))()
        indicator.TextColor3 = Zen.Theme.Pending
        indicator.TextSize = phaseTextSize
        indicator.Font = Enum.Font.ArimoBold
        indicator.TextTransparency = 1
        indicator.Parent = row

        local label = Instance.new(loadstring(base64decode("VGV4dExhYmVs"))())
        label.Size = UDim2.new(1, mobile and -28 or -35, 1, 0)
        label.Position = UDim2.new(0, mobile and 28 or 35, 0, 0)
        label.BackgroundTransparency = 1
        label.Text = name
        label.TextColor3 = Zen.Theme.Pending
        label.TextSize = phaseTextSize
        label.Font = Enum.Font.ArimoBold
        label.TextXAlignment = Enum.TextXAlignment.Left
        label.TextTransparency = 1
        label.Parent = row

        phases[cfowyH5M] = {indicator = indicator, label = label}
    end

    local animationRunning = true
    local currentPhase = 0
    local pulseThread = nil

    local function animateLongLines()
        local speeds = {0.8, 1.0, 0.7, 0.9}
        while animationRunning do
            for cfowyH5M, line in ipairs(longLines) do
                task.spawn(function()
                    line.Position = UDim2.new(1.3, 0, linePositions[cfowyH5M], 0)
                    line.BackgroundTransparency = 0.5
                    TweenService:Create(line, TweenInfo.new(speeds[cfowyH5M], Enum.EasingStyle.Linear), {Position = UDim2.new(-0.4, 0, linePositions[cfowyH5M], 0), BackgroundTransparency = 0.9}):Play()
                end)
            end
            task.wait(0.5)
        end
    end

    local function animateTrails()
        while animationRunning do
            for _, trail in ipairs(trails) do
                local newWidth = trail.config.width + math.random(-12, 12)
                TweenService:Create(trail.frame, TweenInfo.new(0.12, Enum.EasingStyle.Quad), {Size = UDim2.new(0, newWidth, 0, mobile and 2 or 3), BackgroundTransparency = 0.1 + math.random() * 0.3}):Play()
            end
            task.wait(0.1)
        end
    end

    local function animateShipShake()
        while animationRunning do
            local shakeAmount = mobile and 2 or 3
            TweenService:Create(shipContainer, TweenInfo.new(0.04, Enum.EasingStyle.Linear), {Position = UDim2.new(0.5, math.random(-shakeAmount, shakeAmount), 0.35, math.random(-1, 1))}):Play()
            task.wait(0.04)
        end
    end

    local function setPhase(num)
        if pulseThread then task.cancel(pulseThread) pulseThread = nil end
        for cfowyH5M = 1, 5 do
            local p = phases[cfowyH5M]
            if cfowyH5M < num then
                p.indicator.Text = loadstring(base64decode("4peP"))()
                TweenService:Create(p.indicator, TweenInfo.new(0.2), {TextColor3 = Zen.Theme.Success, TextTransparency = 0}):Play()
                TweenService:Create(p.label, TweenInfo.new(0.2), {TextColor3 = Zen.Theme.Success}):Play()
            elseif cfowyH5M == num then
                p.indicator.Text = loadstring(base64decode("4peP"))()
                p.indicator.TextTransparency = 0
                TweenService:Create(p.indicator, TweenInfo.new(0.2), {TextColor3 = Zen.Theme.Accent}):Play()
                TweenService:Create(p.label, TweenInfo.new(0.2), {TextColor3 = Zen.Theme.Text}):Play()
                currentPhase = num
                pulseThread = task.spawn(function()
                    while currentPhase == num do
                        TweenService:Create(p.indicator, TweenInfo.new(0.4), {TextTransparency = 0.5}):Play()
                        task.wait(0.4)
                        if currentPhase ~= num then break end
                        TweenService:Create(p.indicator, TweenInfo.new(0.4), {TextTransparency = 0}):Play()
                        task.wait(0.4)
                    end
                end)
            else
                p.indicator.Text = loadstring(base64decode("4peL"))()
                p.indicator.TextColor3 = Zen.Theme.Pending
                p.label.TextColor3 = Zen.Theme.Pending
            end
        end
    end

    task.spawn(function()
        TweenService:Create(blurEffect, TweenInfo.new(0.6), {Size = 24}):Play()
        TweenService:Create(loadingScreen, TweenInfo.new(0.5), {BackgroundTransparency = 0.25}):Play()
        task.wait(0.3)
        TweenService:Create(shipBody, TweenInfo.new(0.4, Enum.EasingStyle.Back), {BackgroundTransparency = 0}):Play()
        TweenService:Create(shipPoint, TweenInfo.new(0.4, Enum.EasingStyle.Back), {BackgroundTransparency = 0}):Play()
        task.spawn(animateLongLines)
        task.spawn(animateTrails)
        task.spawn(animateShipShake)
        task.wait(0.2)
        for cfowyH5M = 1, 5 do
            task.delay((cfowyH5M-1)*0.08, function()
                TweenService:Create(phases[cfowyH5M].indicator, TweenInfo.new(0.25), {TextTransparency = 0}):Play()
                TweenService:Create(phases[cfowyH5M].label, TweenInfo.new(0.25), {TextTransparency = 0}):Play()
            end)
        end
        task.wait(0.5)
        setPhase(1)
        task.wait(0.3)
        setPhase(2) ensureFolders() task.wait(0.25)
        setPhase(3)
        local iconNames = {loadstring(base64decode("a2V5"))(), loadstring(base64decode("c2hpZWxk"))(), loadstring(base64decode("Y2hlY2s="))(), loadstring(base64decode("Y29weQ=="))(), loadstring(base64decode("ZGlzY29yZA=="))(), loadstring(base64decode("YWxlcnQ="))(), loadstring(base64decode("bG9jaw=="))(), loadstring(base64decode("bG9hZGluZw=="))(), loadstring(base64decode("Y2xvc2U="))(), loadstring(base64decode("Y2hhbmdlbG9n"))(), loadstring(base64decode("dXNlcg=="))(), loadstring(base64decode("Y2xvY2s="))(), loadstring(base64decode("Y2FydA=="))(), loadstring(base64decode("bm9nZXRrZXk="))()}
            for _, name in ipairs(iconNames) do downloadIcon(name) task.wait(0.06) end
        Internal.IconsLoaded = true
        setPhase(4) task.wait(0.25)
        setPhase(5) task.wait(0.5)
        animationRunning = false
        if pulseThread then task.cancel(pulseThread) end
        TweenService:Create(loadingScreen, TweenInfo.new(0.5), {BackgroundTransparency = 1}):Play()
        TweenService:Create(shipBody, TweenInfo.new(0.3), {BackgroundTransparency = 1}):Play()
        TweenService:Create(shipPoint, TweenInfo.new(0.3), {BackgroundTransparency = 1}):Play()
        for _, trail in pairs(trails) do TweenService:Create(trail.frame, TweenInfo.new(0.3), {BackgroundTransparency = 1}):Play() end
        for _, line in pairs(longLines) do TweenService:Create(line, TweenInfo.new(0.3), {BackgroundTransparency = 1}):Play() end
        for cfowyH5M = 1, 5 do
            TweenService:Create(phases[cfowyH5M].indicator, TweenInfo.new(0.25), {TextTransparency = 1}):Play()
            TweenService:Create(phases[cfowyH5M].label, TweenInfo.new(0.25), {TextTransparency = 1}):Play()
        end
        TweenService:Create(blurEffect, TweenInfo.new(0.3), {Size = 0}):Play()
        task.wait(0.5)
        gui:Destroy()
        blurEffect:Destroy()
        if onComplete then onComplete() end
        completed = true
    end)

    while not completed do task.wait(0.05) end
end

local function EnsureIconsReady(callback)
    if allIconsCached() then
        loadAllIconsFromCache()
        if callback then callback() end
    else
        ShowLoadingScreen(callback)
    end
end

function Zen:Notify(title, message, duration, iconType)
    duration = duration or 5
    iconType = iconType or loadstring(base64decode("aW5mbw=="))()
    local scale = getScale()
    local width = math.clamp(320 * scale, 260, 380)
    local height = math.clamp(80 * scale, 75, 105)

    local notifGui = Instance.new(loadstring(base64decode("U2NyZWVuR3Vp"))())
    notifGui.ResetOnSpawn = false
    notifGui.DisplayOrder = 999999
    notifGui.Parent = hui

    local frame = Instance.new(loadstring(base64decode("RnJhbWU="))())
    frame.Size = UDim2.new(0, width, 0, height)
    frame.Position = UDim2.new(1, width + 20, 1, -15)
    frame.AnchorPoint = Vector2.new(1, 1)
    frame.BackgroundColor3 = Zen.Theme.Header
    frame.BorderSizePixel = 0
    frame.Parent = notifGui
    Instance.new(loadstring(base64decode("VUlDb3JuZXI="))(), frame).CornerRadius = UDim.new(0, 4)

    local stroke = Instance.new(loadstring(base64decode("VUlTdHJva2U="))(), frame)
    stroke.Color = Zen.Theme.Accent
    stroke.Thickness = 1
    stroke.Transparency = 0.7

    local progressBg = Instance.new(loadstring(base64decode("RnJhbWU="))())
    progressBg.Size = UDim2.new(1, 0, 0, 2)
    progressBg.Position = UDim2.new(0, 0, 1, -2)
    progressBg.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
    progressBg.BorderSizePixel = 0
    progressBg.Parent = frame

    local progressBar = Instance.new(loadstring(base64decode("RnJhbWU="))())
    progressBar.Size = UDim2.new(1, 0, 1, 0)
    progressBar.BackgroundColor3 = Zen.Theme.Accent
    progressBar.BorderSizePixel = 0
    progressBar.Parent = progressBg

    local iconSize = height - 35
    local icon = Instance.new(loadstring(base64decode("SW1hZ2VMYWJlbA=="))())
    icon.Size = UDim2.new(0, iconSize, 0, iconSize)
    icon.Position = UDim2.new(0, 14, 0.5, -2)
    icon.AnchorPoint = Vector2.new(0, 0.5)
    icon.BackgroundTransparency = 1
    icon.ScaleType = Enum.ScaleType.Fit
    icon.Parent = frame

    local iconMap = {
        success = {loadstring(base64decode("Y2hlY2s="))(), Zen.Theme.Success}, error = {loadstring(base64decode("YWxlcnQ="))(), Zen.Theme.Error},
        warning = {loadstring(base64decode("YWxlcnQ="))(), Zen.Theme.Warning}, shield = {loadstring(base64decode("c2hpZWxk"))(), Zen.Theme.Accent},
        info = {loadstring(base64decode("c2hpZWxk"))(), Zen.Theme.Accent}, key = {loadstring(base64decode("a2V5"))(), Zen.Theme.Accent},
        copy = {loadstring(base64decode("Y29weQ=="))(), Zen.Theme.Success}, discord = {loadstring(base64decode("ZGlzY29yZA=="))(), Zen.Theme.Discord},
        close = {loadstring(base64decode("Y2xvc2U="))(), Zen.Theme.Error}, nogetkey = {loadstring(base64decode("bm9nZXRrZXk="))(), Zen.Theme.TextDim}
    }

    if iconMap[iconType] then
        icon.Image = getIcon(iconMap[iconType][1])
        icon.ImageColor3 = iconMap[iconType][2]
    else
        icon.Image = getLogoIcon()
        icon.ImageColor3 = Zen.Theme.Text
    end

    local textX = 14 + iconSize + 14
    local titleLabel = Instance.new(loadstring(base64decode("VGV4dExhYmVs"))())
    titleLabel.Size = UDim2.new(1, -(textX + 14), 0, 24)
    titleLabel.Position = UDim2.new(0, textX, 0, 12)
    titleLabel.BackgroundTransparency = 1
    titleLabel.Font = Enum.Font.ArimoBold
    titleLabel.TextSize = math.clamp(15 * scale, 13, 18)
    titleLabel.TextXAlignment = Enum.TextXAlignment.Left
    titleLabel.TextColor3 = Zen.Theme.Text
    titleLabel.Text = title
    titleLabel.TextTruncate = Enum.TextTruncate.AtEnd
    titleLabel.Parent = frame

    local messageLabel = Instance.new(loadstring(base64decode("VGV4dExhYmVs"))())
    messageLabel.Size = UDim2.new(1, -(textX + 14), 0, 22)
    messageLabel.Position = UDim2.new(0, textX, 0, 38)
    messageLabel.BackgroundTransparency = 1
    messageLabel.Font = Enum.Font.ArimoBold
    messageLabel.TextSize = math.clamp(13 * scale, 11, 15)
    messageLabel.TextXAlignment = Enum.TextXAlignment.Left
    messageLabel.TextColor3 = Zen.Theme.TextDim
    messageLabel.Text = message
    messageLabel.TextTruncate = Enum.TextTruncate.AtEnd
    messageLabel.Parent = frame

    local id = tick() .. HttpService:GenerateGUID(false)
    table.insert(Internal.NotificationList, {id = id, frame = frame, gui = notifGui, height = height})

    local function restack()
        local yOffset = 0
        for cfowyH5M = #Internal.NotificationList, 1, -1 do
            local n = Internal.NotificationList[cfowyH5M]
            if n and n.frame and n.frame.Parent then
                TweenService:Create(n.frame, TweenInfo.new(0.3, Enum.EasingStyle.Quart), {Position = UDim2.new(1, -15, 1, -15 - yOffset)}):Play()
                yOffset = yOffset + n.height + 12
            end
        end
    end

    TweenService:Create(frame, TweenInfo.new(0.4, Enum.EasingStyle.Quart), {Position = UDim2.new(1, -15, 1, -15)}):Play()
    task.wait(0.1)
    restack()

    local function dismiss()
        for cfowyH5M, n in ipairs(Internal.NotificationList) do
            if n.id == id then table.remove(Internal.NotificationList, cfowyH5M) break end
        end
        TweenService:Create(frame, TweenInfo.new(0.3, Enum.EasingStyle.Quart), {Position = UDim2.new(1, width + 20, frame.Position.Y.Scale, frame.Position.Y.Offset)}):Play()
        task.wait(0.3)
        notifGui:Destroy()
        restack()
    end

    TweenService:Create(progressBar, TweenInfo.new(duration, Enum.EasingStyle.Linear), {Size = UDim2.new(0, 0, 1, 0)}):Play()
    task.delay(duration, dismiss)

    local clickBtn = Instance.new(loadstring(base64decode("VGV4dEJ1dHRvbg=="))())
    clickBtn.Size = UDim2.new(1, 0, 1, 0)
    clickBtn.BackgroundTransparency = 1
    clickBtn.Text = loadstring(base64decode(""))()
    clickBtn.Parent = frame
    clickBtn.MouseButton1Click:Connect(dismiss)
end

local function CreateChangelogPanel(parent, windowWidth, panelHeight, panelWidth, mainFrame, gap)
    panelWidth = panelWidth or 220
    local isOpen = false

    local panel = Instance.new(loadstring(base64decode("RnJhbWU="))())
    panel.Name = loadstring(base64decode("Q2hhbmdlbG9nUGFuZWw="))()
    panel.Size = UDim2.new(0, 0, 0, panelHeight)
    panel.Position = UDim2.new(1, gap, 0, 0)
    panel.BackgroundColor3 = Zen.Theme.Background
    panel.BorderSizePixel = 0
    panel.ClipsDescendants = true
    panel.Parent = mainFrame
    Instance.new(loadstring(base64decode("VUlDb3JuZXI="))(), panel).CornerRadius = UDim.new(0, 4)

    local panelStroke = Instance.new(loadstring(base64decode("VUlTdHJva2U="))(), panel)
    panelStroke.Color = Zen.Theme.Accent
    panelStroke.Thickness = 2
    panelStroke.Transparency = 1

    local panelHeader = Instance.new(loadstring(base64decode("RnJhbWU="))())
    panelHeader.Size = UDim2.new(1, 0, 0, 50)
    panelHeader.BackgroundColor3 = Zen.Theme.Header
    panelHeader.BorderSizePixel = 0
    panelHeader.Parent = panel
    Instance.new(loadstring(base64decode("VUlDb3JuZXI="))(), panelHeader).CornerRadius = UDim.new(0, 4)

    local panelHeaderFix = Instance.new(loadstring(base64decode("RnJhbWU="))())
    panelHeaderFix.Size = UDim2.new(1, 0, 0, 8)
    panelHeaderFix.Position = UDim2.new(0, 0, 1, -8)
    panelHeaderFix.BackgroundColor3 = Zen.Theme.Header
    panelHeaderFix.BorderSizePixel = 0
    panelHeaderFix.Parent = panelHeader

    local panelHeaderLine = Instance.new(loadstring(base64decode("RnJhbWU="))())
    panelHeaderLine.Size = UDim2.new(1, 0, 0, 1)
    panelHeaderLine.Position = UDim2.new(0, 0, 1, 0)
    panelHeaderLine.BackgroundColor3 = Zen.Theme.Accent
    panelHeaderLine.BackgroundTransparency = 0.6
    panelHeaderLine.BorderSizePixel = 0
    panelHeaderLine.Parent = panelHeader

    local panelHeaderIcon = Instance.new(loadstring(base64decode("SW1hZ2VMYWJlbA=="))())
    panelHeaderIcon.Size = UDim2.new(0, 16, 0, 16)
    panelHeaderIcon.Position = UDim2.new(0, 12, 0.5, 0)
    panelHeaderIcon.AnchorPoint = Vector2.new(0, 0.5)
    panelHeaderIcon.BackgroundTransparency = 1
    panelHeaderIcon.Image = getIcon(loadstring(base64decode("Y2hhbmdlbG9n"))())
    panelHeaderIcon.ImageColor3 = Zen.Theme.Accent
    panelHeaderIcon.ScaleType = Enum.ScaleType.Fit
    panelHeaderIcon.Parent = panelHeader

    local panelTitle = Instance.new(loadstring(base64decode("VGV4dExhYmVs"))())
    panelTitle.Size = UDim2.new(1, -65, 1, 0)
    panelTitle.Position = UDim2.new(0, 34, 0, 0)
    panelTitle.BackgroundTransparency = 1
    panelTitle.Text = loadstring(base64decode("Q2hhbmdlbG9n"))()
    panelTitle.TextColor3 = Zen.Theme.Text
    panelTitle.TextSize = 16
    panelTitle.Font = Enum.Font.ArimoBold
    panelTitle.TextXAlignment = Enum.TextXAlignment.Left
    panelTitle.Parent = panelHeader

    local panelClose = Instance.new(loadstring(base64decode("SW1hZ2VCdXR0b24="))())
    panelClose.Size = UDim2.new(0, 20, 0, 20)
    panelClose.Position = UDim2.new(1, -14, 0.5, 0)
    panelClose.AnchorPoint = Vector2.new(1, 0.5)
    panelClose.BackgroundTransparency = 1
    panelClose.Image = getIcon(loadstring(base64decode("Y2xvc2U="))())
    panelClose.ImageColor3 = Zen.Theme.TextDim
    panelClose.ScaleType = Enum.ScaleType.Fit
    panelClose.Parent = panelHeader
    panelClose.MouseEnter:Connect(function() TweenService:Create(panelClose, TweenInfo.new(0.15), {ImageColor3 = Zen.Theme.Error}):Play() end)
    panelClose.MouseLeave:Connect(function() TweenService:Create(panelClose, TweenInfo.new(0.15), {ImageColor3 = Zen.Theme.TextDim}):Play() end)

    local scrollFrame = Instance.new(loadstring(base64decode("U2Nyb2xsaW5nRnJhbWU="))())
    scrollFrame.Size = UDim2.new(1, 0, 1, -55)
    scrollFrame.Position = UDim2.new(0, 0, 0, 55)
    scrollFrame.BackgroundTransparency = 1
    scrollFrame.BorderSizePixel = 0
    scrollFrame.ScrollBarThickness = 4
    scrollFrame.ScrollBarImageColor3 = Zen.Theme.Accent
    scrollFrame.CanvasSize = UDim2.new(0, 0, 0, 0)
    scrollFrame.AutomaticCanvasSize = Enum.AutomaticSize.Y
    scrollFrame.Parent = panel

    local scrollPadding = Instance.new(loadstring(base64decode("VUlQYWRkaW5n"))(), scrollFrame)
    scrollPadding.PaddingLeft = UDim.new(0, 10)
    scrollPadding.PaddingRight = UDim.new(0, 10)
    scrollPadding.PaddingTop = UDim.new(0, 5)
    scrollPadding.PaddingBottom = UDim.new(0, 5)

    local contentLayout = Instance.new(loadstring(base64decode("VUlMaXN0TGF5b3V0"))(), scrollFrame)
    contentLayout.Padding = UDim.new(0, 10)
    contentLayout.SortOrder = Enum.SortOrder.LayoutOrder

    for cfowyH5M, update in ipairs(Zen.Changelog) do
        local entry = Instance.new(loadstring(base64decode("RnJhbWU="))())
        entry.Size = UDim2.new(1, 0, 0, 0)
        entry.AutomaticSize = Enum.AutomaticSize.Y
        entry.BackgroundTransparency = 1
        entry.LayoutOrder = cfowyH5M * 2
        entry.Parent = scrollFrame

        local entryLayout = Instance.new(loadstring(base64decode("VUlMaXN0TGF5b3V0"))(), entry)
        entryLayout.Padding = UDim.new(0, 5)

        local versionLabel = Instance.new(loadstring(base64decode("VGV4dExhYmVs"))())
        versionLabel.Size = UDim2.new(1, 0, 0, 22)
        versionLabel.BackgroundTransparency = 1
        versionLabel.Text = update.Version .. loadstring(base64decode("ICDigKIgIA=="))() .. update.Date
        versionLabel.TextColor3 = Zen.Theme.Accent
        versionLabel.TextSize = 14
        versionLabel.Font = Enum.Font.ArimoBold
        versionLabel.TextXAlignment = Enum.TextXAlignment.Left
        versionLabel.LayoutOrder = 1
        versionLabel.Parent = entry

        for j, change in ipairs(update.Changes) do
            local changeLabel = Instance.new(loadstring(base64decode("VGV4dExhYmVs"))())
            changeLabel.Size = UDim2.new(1, 0, 0, 0)
            changeLabel.AutomaticSize = Enum.AutomaticSize.Y
            changeLabel.BackgroundTransparency = 1
            changeLabel.Text = loadstring(base64decode("ICDigKIgIA=="))() .. change
            changeLabel.TextColor3 = Zen.Theme.TextDim
            changeLabel.TextSize = 12
            changeLabel.Font = Enum.Font.ArimoBold
            changeLabel.TextXAlignment = Enum.TextXAlignment.Left
            changeLabel.TextWrapped = true
            changeLabel.LayoutOrder = j + 1
            changeLabel.Parent = entry
        end

        if cfowyH5M < #Zen.Changelog then
            local divWrapper = Instance.new(loadstring(base64decode("RnJhbWU="))())
            divWrapper.Size = UDim2.new(1, 0, 0, 2)
            divWrapper.BackgroundTransparency = 1
            divWrapper.LayoutOrder = cfowyH5M * 2 + 1
            divWrapper.Parent = scrollFrame

            local div = Instance.new(loadstring(base64decode("RnJhbWU="))())
            div.Size = UDim2.new(1, 0, 0, 2)
            div.BackgroundColor3 = Zen.Theme.Divider
            div.BorderSizePixel = 0
            div.Parent = divWrapper
        end
    end

    local function toggle(changelogIcon, container, currentContainerWidth)
        isOpen = not isOpen
        if isOpen then
            TweenService:Create(panelStroke, TweenInfo.new(0.2), {Transparency = 0.4}):Play()
            TweenService:Create(panel, TweenInfo.new(0.4, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {Size = UDim2.new(0, panelWidth, 0, panelHeight)}):Play()
            TweenService:Create(container, TweenInfo.new(0.4, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {Size = UDim2.new(0, currentContainerWidth + gap + panelWidth, 0, panelHeight)}):Play()
            if changelogIcon then TweenService:Create(changelogIcon, TweenInfo.new(0.3), {Rotation = 180}):Play() end
        else
            TweenService:Create(panelStroke, TweenInfo.new(0.2), {Transparency = 1}):Play()
            TweenService:Create(panel, TweenInfo.new(0.3, Enum.EasingStyle.Quart, Enum.EasingDirection.In), {Size = UDim2.new(0, 0, 0, panelHeight)}):Play()
            TweenService:Create(container, TweenInfo.new(0.3, Enum.EasingStyle.Quart, Enum.EasingDirection.In), {Size = UDim2.new(0, currentContainerWidth, 0, panelHeight)}):Play()
            if changelogIcon then TweenService:Create(changelogIcon, TweenInfo.new(0.3), {Rotation = 0}):Play() end
        end
    end

    panelClose.MouseButton1Click:Connect(function() if isOpen then toggle(nil, parent, windowWidth) end end)
    return panel, toggle, function() return isOpen end, panelWidth
end

local function CreateUserInfoPanel(parent, windowWidth, panelHeight, panelWidth, mainFrame, gap, startOpen)
    panelWidth = panelWidth or 180
    local isOpen = startOpen or false
    local isCompact = panelHeight < 300
    local avatarSize = isCompact and 42 or 55
    local fieldHeight = isCompact and 24 or 28
    local titleSize = isCompact and 8 or 9
    local valueSize = isCompact and 10 or 11
    local welcomeSize = isCompact and 11 or 12
    local spacing = isCompact and 3 or 5

    local panel = Instance.new(loadstring(base64decode("RnJhbWU="))())
    panel.Name = loadstring(base64decode("VXNlckluZm9QYW5lbA=="))()
    panel.Size = UDim2.new(0, isOpen and panelWidth or 0, 0, panelHeight)
    panel.Position = UDim2.new(0, -(gap), 0, 0)
    panel.AnchorPoint = Vector2.new(1, 0)
    panel.BackgroundColor3 = Zen.Theme.Background
    panel.BorderSizePixel = 0
    panel.ClipsDescendants = true
    panel.Parent = mainFrame
    Instance.new(loadstring(base64decode("VUlDb3JuZXI="))(), panel).CornerRadius = UDim.new(0, 4)

    local panelStroke = Instance.new(loadstring(base64decode("VUlTdHJva2U="))(), panel)
    panelStroke.Color = Zen.Theme.Accent
    panelStroke.Thickness = 2
    panelStroke.Transparency = isOpen and 0.4 or 1

    local panelHeader = Instance.new(loadstring(base64decode("RnJhbWU="))())
    panelHeader.Size = UDim2.new(1, 0, 0, 50)
    panelHeader.BackgroundColor3 = Zen.Theme.Header
    panelHeader.BorderSizePixel = 0
    panelHeader.Parent = panel
    Instance.new(loadstring(base64decode("VUlDb3JuZXI="))(), panelHeader).CornerRadius = UDim.new(0, 4)

    local panelHeaderFix = Instance.new(loadstring(base64decode("RnJhbWU="))())
    panelHeaderFix.Size = UDim2.new(1, 0, 0, 8)
    panelHeaderFix.Position = UDim2.new(0, 0, 1, -8)
    panelHeaderFix.BackgroundColor3 = Zen.Theme.Header
    panelHeaderFix.BorderSizePixel = 0
    panelHeaderFix.Parent = panelHeader

    local panelHeaderLine = Instance.new(loadstring(base64decode("RnJhbWU="))())
    panelHeaderLine.Size = UDim2.new(1, 0, 0, 1)
    panelHeaderLine.Position = UDim2.new(0, 0, 1, 0)
    panelHeaderLine.BackgroundColor3 = Zen.Theme.Accent
    panelHeaderLine.BackgroundTransparency = 0.6
    panelHeaderLine.BorderSizePixel = 0
    panelHeaderLine.Parent = panelHeader

    local panelHeaderIcon = Instance.new(loadstring(base64decode("SW1hZ2VMYWJlbA=="))())
    panelHeaderIcon.Size = UDim2.new(0, 16, 0, 16)
    panelHeaderIcon.Position = UDim2.new(0, 12, 0.5, 0)
    panelHeaderIcon.AnchorPoint = Vector2.new(0, 0.5)
    panelHeaderIcon.BackgroundTransparency = 1
    panelHeaderIcon.Image = getIcon(loadstring(base64decode("dXNlcg=="))())
    panelHeaderIcon.ImageColor3 = Zen.Theme.Accent
    panelHeaderIcon.ScaleType = Enum.ScaleType.Fit
    panelHeaderIcon.Parent = panelHeader

    local panelTitle = Instance.new(loadstring(base64decode("VGV4dExhYmVs"))())
    panelTitle.Size = UDim2.new(1, -65, 1, 0)
    panelTitle.Position = UDim2.new(0, 34, 0, 0)
    panelTitle.BackgroundTransparency = 1
    panelTitle.Text = loadstring(base64decode("VXNlciBJbmZv"))()
    panelTitle.TextColor3 = Zen.Theme.Text
    panelTitle.TextSize = 16
    panelTitle.Font = Enum.Font.ArimoBold
    panelTitle.TextXAlignment = Enum.TextXAlignment.Left
    panelTitle.Parent = panelHeader

    local panelClose = Instance.new(loadstring(base64decode("SW1hZ2VCdXR0b24="))())
    panelClose.Size = UDim2.new(0, 20, 0, 20)
    panelClose.Position = UDim2.new(1, -14, 0.5, 0)
    panelClose.AnchorPoint = Vector2.new(1, 0.5)
    panelClose.BackgroundTransparency = 1
    panelClose.Image = getIcon(loadstring(base64decode("Y2xvc2U="))())
    panelClose.ImageColor3 = Zen.Theme.TextDim
    panelClose.ScaleType = Enum.ScaleType.Fit
    panelClose.Parent = panelHeader
    panelClose.MouseEnter:Connect(function() TweenService:Create(panelClose, TweenInfo.new(0.15), {ImageColor3 = Zen.Theme.Error}):Play() end)
    panelClose.MouseLeave:Connect(function() TweenService:Create(panelClose, TweenInfo.new(0.15), {ImageColor3 = Zen.Theme.TextDim}):Play() end)

    local contentFrame = Instance.new(loadstring(base64decode("RnJhbWU="))())
    contentFrame.Size = UDim2.new(1, 0, 1, -55)
    contentFrame.Position = UDim2.new(0, 0, 0, 55)
    contentFrame.BackgroundTransparency = 1
    contentFrame.Parent = panel

    local contentPadding = Instance.new(loadstring(base64decode("VUlQYWRkaW5n"))(), contentFrame)
    contentPadding.PaddingLeft = UDim.new(0, 8)
    contentPadding.PaddingRight = UDim.new(0, 8)

    local contentLayout = Instance.new(loadstring(base64decode("VUlMaXN0TGF5b3V0"))(), contentFrame)
    contentLayout.Padding = UDim.new(0, spacing)
    contentLayout.SortOrder = Enum.SortOrder.LayoutOrder
    contentLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
    contentLayout.VerticalAlignment = Enum.VerticalAlignment.Center

    local player = cloneref(Players.LocalPlayer)

    local avatarWrapper = Instance.new(loadstring(base64decode("RnJhbWU="))())
    avatarWrapper.Size = UDim2.new(0, avatarSize + 6, 0, avatarSize + 6)
    avatarWrapper.BackgroundTransparency = 1
    avatarWrapper.LayoutOrder = 1
    avatarWrapper.Parent = contentFrame

    local avatarGlow = Instance.new(loadstring(base64decode("RnJhbWU="))())
    avatarGlow.Size = UDim2.new(1, 0, 1, 0)
    avatarGlow.Position = UDim2.new(0.5, 0, 0.5, 0)
    avatarGlow.AnchorPoint = Vector2.new(0.5, 0.5)
    avatarGlow.BackgroundColor3 = Zen.Theme.Accent
    avatarGlow.BackgroundTransparency = 0.5
    avatarGlow.BorderSizePixel = 0
    avatarGlow.Parent = avatarWrapper
    Instance.new(loadstring(base64decode("VUlDb3JuZXI="))(), avatarGlow).CornerRadius = UDim.new(0, 4)

    local avatarGlowStroke = Instance.new(loadstring(base64decode("VUlTdHJva2U="))(), avatarGlow)
    avatarGlowStroke.Color = Zen.Theme.Accent
    avatarGlowStroke.Thickness = 1.5
    avatarGlowStroke.Transparency = 0.3

    local avatarContainer = Instance.new(loadstring(base64decode("RnJhbWU="))())
    avatarContainer.Size = UDim2.new(0, avatarSize, 0, avatarSize)
    avatarContainer.Position = UDim2.new(0.5, 0, 0.5, 0)
    avatarContainer.AnchorPoint = Vector2.new(0.5, 0.5)
    avatarContainer.BackgroundColor3 = Zen.Theme.Input
    avatarContainer.BorderSizePixel = 0
    avatarContainer.ClipsDescendants = true
    avatarContainer.Parent = avatarWrapper
    Instance.new(loadstring(base64decode("VUlDb3JuZXI="))(), avatarContainer).CornerRadius = UDim.new(0, 4)

    local avatarImage = Instance.new(loadstring(base64decode("SW1hZ2VMYWJlbA=="))())
    avatarImage.Size = UDim2.new(1, 0, 1, 0)
    avatarImage.Position = UDim2.new(0.5, 0, 0.5, 0)
    avatarImage.AnchorPoint = Vector2.new(0.5, 0.5)
    avatarImage.BackgroundTransparency = 1
    avatarImage.ScaleType = Enum.ScaleType.Crop
    avatarImage.Parent = avatarContainer
    pcall(function()
        local content = Players:GetUserThumbnailAsync(player and player.UserId or 0, Enum.ThumbnailType.HeadShot, Enum.ThumbnailSize.Size150x150)
        avatarImage.Image = content
    end)

    local welcomeLabel = Instance.new(loadstring(base64decode("VGV4dExhYmVs"))())
    welcomeLabel.Size = UDim2.new(1, 0, 0, isCompact and 14 or 18)
    welcomeLabel.BackgroundTransparency = 1
    welcomeLabel.Text = loadstring(base64decode("V2VsY29tZSwg"))() .. (player and player.DisplayName or loadstring(base64decode("VXNlcg=="))())
    welcomeLabel.TextColor3 = Zen.Theme.Text
    welcomeLabel.TextSize = welcomeSize
    welcomeLabel.Font = Enum.Font.ArimoBold
    welcomeLabel.TextTruncate = Enum.TextTruncate.AtEnd
    welcomeLabel.LayoutOrder = 2
    welcomeLabel.Parent = contentFrame

    local divider1 = Instance.new(loadstring(base64decode("RnJhbWU="))())
    divider1.Size = UDim2.new(1, 16, 0, 2)
    divider1.Position = UDim2.new(0.5, 0, 0, 0)
    divider1.AnchorPoint = Vector2.new(0.5, 0)
    divider1.BackgroundColor3 = Zen.Theme.Divider
    divider1.BorderSizePixel = 0
    divider1.LayoutOrder = 3
    divider1.Parent = contentFrame

    local executorContainer = Instance.new(loadstring(base64decode("RnJhbWU="))())
    executorContainer.Size = UDim2.new(1, 0, 0, fieldHeight)
    executorContainer.BackgroundTransparency = 1
    executorContainer.LayoutOrder = 4
    executorContainer.Parent = contentFrame

    local executorTitle = Instance.new(loadstring(base64decode("VGV4dExhYmVs"))())
    executorTitle.Size = UDim2.new(1, 0, 0, 11)
    executorTitle.BackgroundTransparency = 1
    executorTitle.Text = loadstring(base64decode("RXhlY3V0b3I="))()
    executorTitle.TextColor3 = Zen.Theme.TextDim
    executorTitle.TextSize = titleSize
    executorTitle.Font = Enum.Font.ArimoBold
    executorTitle.TextXAlignment = Enum.TextXAlignment.Left
    executorTitle.Parent = executorContainer

    local executorValue = Instance.new(loadstring(base64decode("VGV4dExhYmVs"))())
    executorValue.Size = UDim2.new(1, 0, 0, 14)
    executorValue.Position = UDim2.new(0, 0, 0, 11)
    executorValue.BackgroundTransparency = 1
    executorValue.Text = getExecutorName()
    executorValue.TextColor3 = Zen.Theme.Accent
    executorValue.TextSize = valueSize
    executorValue.Font = Enum.Font.ArimoBold
    executorValue.TextXAlignment = Enum.TextXAlignment.Left
    executorValue.TextTruncate = Enum.TextTruncate.AtEnd
    executorValue.Parent = executorContainer

    local deviceContainer = Instance.new(loadstring(base64decode("RnJhbWU="))())
    deviceContainer.Size = UDim2.new(1, 0, 0, fieldHeight)
    deviceContainer.BackgroundTransparency = 1
    deviceContainer.LayoutOrder = 5
    deviceContainer.Parent = contentFrame

    local deviceTitle = Instance.new(loadstring(base64decode("VGV4dExhYmVs"))())
    deviceTitle.Size = UDim2.new(1, 0, 0, 11)
    deviceTitle.BackgroundTransparency = 1
    deviceTitle.Text = loadstring(base64decode("RGV2aWNl"))()
    deviceTitle.TextColor3 = Zen.Theme.TextDim
    deviceTitle.TextSize = titleSize
    deviceTitle.Font = Enum.Font.ArimoBold
    deviceTitle.TextXAlignment = Enum.TextXAlignment.Left
    deviceTitle.Parent = deviceContainer

    local deviceValue = Instance.new(loadstring(base64decode("VGV4dExhYmVs"))())
    deviceValue.Size = UDim2.new(1, 0, 0, 14)
    deviceValue.Position = UDim2.new(0, 0, 0, 11)
    deviceValue.BackgroundTransparency = 1
    deviceValue.Text = getDeviceType()
    deviceValue.TextColor3 = Zen.Theme.Accent
    deviceValue.TextSize = valueSize
    deviceValue.Font = Enum.Font.ArimoBold
    deviceValue.TextXAlignment = Enum.TextXAlignment.Left
    deviceValue.TextTruncate = Enum.TextTruncate.AtEnd
    deviceValue.Parent = deviceContainer

    local divider2 = Instance.new(loadstring(base64decode("RnJhbWU="))())
    divider2.Size = UDim2.new(1, 16, 0, 2)
    divider2.Position = UDim2.new(0.5, 0, 0, 0)
    divider2.AnchorPoint = Vector2.new(0.5, 0)
    divider2.BackgroundColor3 = Zen.Theme.Divider
    divider2.BorderSizePixel = 0
    divider2.LayoutOrder = 6
    divider2.Parent = contentFrame

    local hwidContainer = Instance.new(loadstring(base64decode("RnJhbWU="))())
    hwidContainer.Size = UDim2.new(1, 0, 0, fieldHeight)
    hwidContainer.BackgroundTransparency = 1
    hwidContainer.LayoutOrder = 7
    hwidContainer.Parent = contentFrame

    local hwidTitle = Instance.new(loadstring(base64decode("VGV4dExhYmVs"))())
    hwidTitle.Size = UDim2.new(1, 0, 0, 11)
    hwidTitle.BackgroundTransparency = 1
    hwidTitle.Text = loadstring(base64decode("SFdJRA=="))()
    hwidTitle.TextColor3 = Zen.Theme.TextDim
    hwidTitle.TextSize = titleSize
    hwidTitle.Font = Enum.Font.ArimoBold
    hwidTitle.TextXAlignment = Enum.TextXAlignment.Left
    hwidTitle.Parent = hwidContainer

    local fullHWID = getHWID()
    local copyBtnSize = 18
    local dotAreaWidth = panelWidth - 16 - copyBtnSize - 6
    local hiddenDots = generateHiddenDots(dotAreaWidth, 5)

    local hwidValue = Instance.new(loadstring(base64decode("VGV4dExhYmVs"))())
    hwidValue.Size = UDim2.new(1, -(copyBtnSize + 6), 0, 14)
    hwidValue.Position = UDim2.new(0, 0, 0, 11)
    hwidValue.BackgroundTransparency = 1
    hwidValue.Text = hiddenDots
    hwidValue.TextColor3 = Zen.Theme.TextDim
    hwidValue.TextSize = isCompact and 9 or 10
    hwidValue.Font = Enum.Font.ArimoBold
    hwidValue.TextXAlignment = Enum.TextXAlignment.Left
    hwidValue.TextTruncate = Enum.TextTruncate.AtEnd
    hwidValue.Parent = hwidContainer

    local copyBtn = Instance.new(loadstring(base64decode("SW1hZ2VCdXR0b24="))())
    copyBtn.Size = UDim2.new(0, copyBtnSize, 0, copyBtnSize)
    copyBtn.Position = UDim2.new(1, 0, 0.5, 1)
    copyBtn.AnchorPoint = Vector2.new(1, 0.5)
    copyBtn.BackgroundTransparency = 1
    copyBtn.Image = getIcon(loadstring(base64decode("Y29weQ=="))())
    copyBtn.ImageColor3 = Zen.Theme.TextDim
    copyBtn.ScaleType = Enum.ScaleType.Fit
    copyBtn.Parent = hwidContainer
    copyBtn.MouseEnter:Connect(function() TweenService:Create(copyBtn, TweenInfo.new(0.15), {ImageColor3 = Zen.Theme.Accent}):Play() end)
    copyBtn.MouseLeave:Connect(function() TweenService:Create(copyBtn, TweenInfo.new(0.15), {ImageColor3 = Zen.Theme.TextDim}):Play() end)
    copyBtn.MouseButton1Click:Connect(function()
        pcall(function() setclipboard(fullHWID) end)
        TweenService:Create(copyBtn, TweenInfo.new(0.1), {ImageColor3 = Zen.Theme.Success}):Play()
        task.delay(0.3, function() TweenService:Create(copyBtn, TweenInfo.new(0.15), {ImageColor3 = Zen.Theme.TextDim}):Play() end)
        Zen:Notify(loadstring(base64decode("Q29waWVk"))(), loadstring(base64decode("SFdJRCBjb3BpZWQgdG8gY2xpcGJvYXJk"))(), 2, loadstring(base64decode("Y29weQ=="))())
    end)

    local divider3 = Instance.new(loadstring(base64decode("RnJhbWU="))())
    divider3.Size = UDim2.new(1, 16, 0, 2)
    divider3.Position = UDim2.new(0.5, 0, 0, 0)
    divider3.AnchorPoint = Vector2.new(0.5, 0)
    divider3.BackgroundColor3 = Zen.Theme.Divider
    divider3.BorderSizePixel = 0
    divider3.LayoutOrder = 8
    divider3.Parent = contentFrame

    local clockContainer = Instance.new(loadstring(base64decode("RnJhbWU="))())
    clockContainer.Size = UDim2.new(1, 0, 0, isCompact and 30 or 38)
    clockContainer.BackgroundTransparency = 1
    clockContainer.LayoutOrder = 9
    clockContainer.Parent = contentFrame

    local clockRow = Instance.new(loadstring(base64decode("RnJhbWU="))())
    clockRow.Size = UDim2.new(1, 0, 0, isCompact and 18 or 22)
    clockRow.Position = UDim2.new(0.5, -8, 0, 0)
    clockRow.AnchorPoint = Vector2.new(0.5, 0)
    clockRow.BackgroundTransparency = 1
    clockRow.Parent = clockContainer

    local clockRowLayout = Instance.new(loadstring(base64decode("VUlMaXN0TGF5b3V0"))(), clockRow)
    clockRowLayout.FillDirection = Enum.FillDirection.Horizontal
    clockRowLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
    clockRowLayout.VerticalAlignment = Enum.VerticalAlignment.Center
    clockRowLayout.Padding = UDim.new(0, isCompact and 4 or 6)

    local clockIcon = Instance.new(loadstring(base64decode("SW1hZ2VMYWJlbA=="))())
    clockIcon.Size = UDim2.new(0, isCompact and 14 or 16, 0, isCompact and 14 or 16)
    clockIcon.BackgroundTransparency = 1
    clockIcon.Image = getIcon(loadstring(base64decode("Y2xvY2s="))())
    clockIcon.ImageColor3 = Zen.Theme.Accent
    clockIcon.ScaleType = Enum.ScaleType.Fit
    clockIcon.LayoutOrder = 1
    clockIcon.Parent = clockRow

    local clockTimeLabel = Instance.new(loadstring(base64decode("VGV4dExhYmVs"))())
    clockTimeLabel.Size = UDim2.new(0, 0, 1, 0)
    clockTimeLabel.AutomaticSize = Enum.AutomaticSize.X
    clockTimeLabel.BackgroundTransparency = 1
    clockTimeLabel.Text = formatTime12()
    clockTimeLabel.TextColor3 = Zen.Theme.Accent
    clockTimeLabel.TextSize = isCompact and 14 or 16
    clockTimeLabel.Font = Enum.Font.ArimoBold
    clockTimeLabel.LayoutOrder = 2
    clockTimeLabel.Parent = clockRow

    local clockDateLabel = Instance.new(loadstring(base64decode("VGV4dExhYmVs"))())
    clockDateLabel.Size = UDim2.new(1, 0, 0, isCompact and 12 or 14)
    clockDateLabel.Position = UDim2.new(0, -8, 0, isCompact and 18 or 22)
    clockDateLabel.BackgroundTransparency = 1
    clockDateLabel.Text = formatDate()
    clockDateLabel.TextColor3 = Zen.Theme.TextDim
    clockDateLabel.TextSize = isCompact and 9 or 11
    clockDateLabel.Font = Enum.Font.ArimoBold
    clockDateLabel.TextXAlignment = Enum.TextXAlignment.Center
    clockDateLabel.Parent = clockContainer

    local clockRunning = true
    task.spawn(function()
        while clockRunning do
            if not clockTimeLabel or not clockTimeLabel.Parent then clockRunning = false break end
            clockTimeLabel.Text = formatTime12()
            clockDateLabel.Text = formatDate()
            task.wait(1)
        end
    end)
    panel.Destroying:Connect(function() clockRunning = false end)

    local function toggle(userIcon, container, baseWidth)
        isOpen = not isOpen
        if isOpen then
            TweenService:Create(panelStroke, TweenInfo.new(0.2), {Transparency = 0.4}):Play()
            TweenService:Create(panel, TweenInfo.new(0.4, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {Size = UDim2.new(0, panelWidth, 0, panelHeight)}):Play()
            TweenService:Create(container, TweenInfo.new(0.4, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {Size = UDim2.new(0, baseWidth + gap + panelWidth, 0, panelHeight)}):Play()
        else
            TweenService:Create(panelStroke, TweenInfo.new(0.2), {Transparency = 1}):Play()
            TweenService:Create(panel, TweenInfo.new(0.3, Enum.EasingStyle.Quart, Enum.EasingDirection.In), {Size = UDim2.new(0, 0, 0, panelHeight)}):Play()
            TweenService:Create(container, TweenInfo.new(0.3, Enum.EasingStyle.Quart, Enum.EasingDirection.In), {Size = UDim2.new(0, baseWidth, 0, panelHeight)}):Play()
        end
    end

    panelClose.MouseButton1Click:Connect(function() if isOpen then toggle(nil, parent, windowWidth) end end)
    return panel, toggle, function() return isOpen end, panelWidth
end

local function handleKeylessSkip()
    getgenv().SCRIPT_KEY = loadstring(base64decode("S0VZTEVTUw=="))()
    getgenv().ZenLoaded = false
    Zen:Notify(loadstring(base64decode("QWNjZXNzIEdyYW50ZWQ="))(), loadstring(base64decode("S2V5bGVzcyBhY2Nlc3MgYXBwcm92ZWQh"))(), 3, loadstring(base64decode("c3VjY2Vzcw=="))())
    task.wait(0.3)
    if Zen.Callbacks.OnSuccess then Zen.Callbacks.OnSuccess() end
end

local function BuildCenteredUI(windowWidth, windowHeight, panelHeight, userPanelWidth, changelogPanelWidth, gap, buildContent)
    local gui = buildContent.gui

    local container = Instance.new(loadstring(base64decode("RnJhbWU="))())
    container.Name = loadstring(base64decode("Q29udGFpbmVy"))()
    container.Size = UDim2.new(0, windowWidth, 0, panelHeight)
    container.Position = UDim2.new(0.5, 0, 1.5, 0)
    container.AnchorPoint = Vector2.new(0.5, 0.5)
    container.BackgroundTransparency = 1
    container.Parent = gui

    local mainFrame = Instance.new(loadstring(base64decode("RnJhbWU="))())
    mainFrame.Name = loadstring(base64decode("TWFpbkZyYW1l"))()
    mainFrame.Size = UDim2.new(0, windowWidth, 0, windowHeight)
    mainFrame.Position = UDim2.new(0.5, 0, 0, 0)
    mainFrame.AnchorPoint = Vector2.new(0.5, 0)
    mainFrame.BackgroundColor3 = Zen.Theme.Background
    mainFrame.BorderSizePixel = 0
    mainFrame.Parent = container
    Instance.new(loadstring(base64decode("VUlDb3JuZXI="))(), mainFrame).CornerRadius = UDim.new(0, 4)

    local mainStroke = Instance.new(loadstring(base64decode("VUlTdHJva2U="))(), mainFrame)
    mainStroke.Color = Zen.Theme.Accent
    mainStroke.Thickness = 2
    mainStroke.Transparency = 0.4

    local userPanel, toggleUserPanel, isUserOpen, userPanelActualWidth = CreateUserInfoPanel(container, windowWidth, panelHeight, userPanelWidth, mainFrame, gap, false)
    local changelogPanel, toggleChangelog, isChangelogOpen, changelogPanelActualWidth = CreateChangelogPanel(container, windowWidth, panelHeight, changelogPanelWidth, mainFrame, gap)

    local function getContainerWidth()
        local w = windowWidth
        if isUserOpen() then w = w + gap + userPanelActualWidth end
        if isChangelogOpen() then w = w + gap + changelogPanelActualWidth end
        return w
    end

    local function toggleUser(userIcon)
        local currentW = getContainerWidth()
        if isUserOpen() then
            toggleUserPanel(userIcon, container, currentW - gap - userPanelActualWidth)
        else
            toggleUserPanel(userIcon, container, currentW)
        end
    end

    local function toggleCL(changelogIcon)
        local currentW = getContainerWidth()
        if isChangelogOpen() then
            toggleChangelog(changelogIcon, container, currentW - gap - changelogPanelActualWidth)
        else
            toggleChangelog(changelogIcon, container, currentW)
        end
    end

    local function closeAllPanels(userIcon, changelogIcon, callback)
        if isChangelogOpen() then toggleCL(changelogIcon) task.wait(0.35) end
        if isUserOpen() then toggleUser(userIcon) task.wait(0.35) end
        if callback then callback() end
    end

    return {
        container = container,
        mainFrame = mainFrame,
        mainStroke = mainStroke,
        toggleUser = toggleUser,
        toggleCL = toggleCL,
        isUserOpen = isUserOpen,
        isChangelogOpen = isChangelogOpen,
        closeAllPanels = closeAllPanels
    }
end

local function BuildKeylessUI()
    local oldGui = hui:FindFirstChild(loadstring(base64decode("WmVuS2V5bGVzc1N5c3RlbQ=="))())
    if oldGui then oldGui:Destroy() end
    local oldGui2 = hui:FindFirstChild(loadstring(base64decode("WmVuS2V5U3lzdGVt"))())
    if oldGui2 then oldGui2:Destroy() end

    enableBlur()

    local mobile = isMobile()
    local padding = 14
    local windowWidth = 300
    local windowHeight = 265
    local userPanelWidth = 165
    local changelogPanelWidth = 200
    local gap = 12

    local gui = Instance.new(loadstring(base64decode("U2NyZWVuR3Vp"))())
    gui.Name = loadstring(base64decode("WmVuS2V5bGVzc1N5c3RlbQ=="))()
    gui.ResetOnSpawn = false
    gui.IgnoreGuiInset = true
    gui.Parent = hui

    local ui = BuildCenteredUI(windowWidth, windowHeight, windowHeight, userPanelWidth, changelogPanelWidth, gap, {gui = gui})
    local container = ui.container
    local main = ui.mainFrame
    local mainStroke = ui.mainStroke

    local header = Instance.new(loadstring(base64decode("RnJhbWU="))())
    header.Size = UDim2.new(1, 0, 0, 50)
    header.BackgroundColor3 = Zen.Theme.Header
    header.BorderSizePixel = 0
    header.Active = true
    header.Parent = main
    Instance.new(loadstring(base64decode("VUlDb3JuZXI="))(), header).CornerRadius = UDim.new(0, 4)

    local headerFix = Instance.new(loadstring(base64decode("RnJhbWU="))())
    headerFix.Size = UDim2.new(1, 0, 0, 8)
    headerFix.Position = UDim2.new(0, 0, 1, -8)
    headerFix.BackgroundColor3 = Zen.Theme.Header
    headerFix.BorderSizePixel = 0
    headerFix.Parent = header

    local headerLine = Instance.new(loadstring(base64decode("RnJhbWU="))())
    headerLine.Size = UDim2.new(1, 0, 0, 1)
    headerLine.Position = UDim2.new(0, 0, 1, 0)
    headerLine.BackgroundColor3 = Zen.Theme.Accent
    headerLine.BackgroundTransparency = 0.6
    headerLine.BorderSizePixel = 0
    headerLine.Parent = header

    local logo = Instance.new(loadstring(base64decode("SW1hZ2VMYWJlbA=="))())
    logo.Size = UDim2.new(0, 30, 0, 30)
    logo.Position = UDim2.new(0, padding, 0.5, 0)
    logo.AnchorPoint = Vector2.new(0, 0.5)
    logo.BackgroundTransparency = 1
    logo.Image = getLogoIcon()
    logo.ImageColor3 = Zen.Theme.Text
    logo.ScaleType = Enum.ScaleType.Fit
    logo.Parent = header

    local title = Instance.new(loadstring(base64decode("VGV4dExhYmVs"))())
    title.Size = UDim2.new(1, -90, 1, 0)
    title.Position = UDim2.new(0, padding + 40, 0, 0)
    title.BackgroundTransparency = 1
    title.Text = Zen.Appearance.Title
    title.TextColor3 = Zen.Theme.Text
    title.TextSize = mobile and 24 or 26
    title.Font = Enum.Font.ArimoBold
    title.TextXAlignment = Enum.TextXAlignment.Left
    title.Parent = header

    local closeBtn = Instance.new(loadstring(base64decode("SW1hZ2VCdXR0b24="))())
    closeBtn.Size = UDim2.new(0, 22, 0, 22)
    closeBtn.Position = UDim2.new(1, -padding, 0.5, 0)
    closeBtn.AnchorPoint = Vector2.new(1, 0.5)
    closeBtn.BackgroundTransparency = 1
    closeBtn.Image = getIcon(loadstring(base64decode("Y2xvc2U="))())
    closeBtn.ImageColor3 = Zen.Theme.TextDim
    closeBtn.ScaleType = Enum.ScaleType.Fit
    closeBtn.Parent = header
    closeBtn.MouseEnter:Connect(function() TweenService:Create(closeBtn, TweenInfo.new(0.15), {ImageColor3 = Zen.Theme.Error}):Play() end)
    closeBtn.MouseLeave:Connect(function() TweenService:Create(closeBtn, TweenInfo.new(0.15), {ImageColor3 = Zen.Theme.TextDim}):Play() end)

    local contentY = 60

    local successBox = Instance.new(loadstring(base64decode("RnJhbWU="))())
    successBox.Size = UDim2.new(0.94, 0, 0, 52)
    successBox.Position = UDim2.new(0.5, 0, 0, contentY)
    successBox.AnchorPoint = Vector2.new(0.5, 0)
    successBox.BackgroundColor3 = Zen.Theme.Success
    successBox.BackgroundTransparency = 0.85
    successBox.BorderSizePixel = 0
    successBox.Parent = main
    Instance.new(loadstring(base64decode("VUlDb3JuZXI="))(), successBox).CornerRadius = UDim.new(0, 4)

    local successStroke = Instance.new(loadstring(base64decode("VUlTdHJva2U="))(), successBox)
    successStroke.Color = Zen.Theme.Success
    successStroke.Thickness = 1
    successStroke.Transparency = 0.5

    local checkIcon = Instance.new(loadstring(base64decode("SW1hZ2VMYWJlbA=="))())
    checkIcon.Size = UDim2.new(0, 24, 0, 24)
    checkIcon.Position = UDim2.new(0, 16, 0.5, 0)
    checkIcon.AnchorPoint = Vector2.new(0, 0.5)
    checkIcon.BackgroundTransparency = 1
    checkIcon.Image = getIcon(loadstring(base64decode("Y2hlY2s="))())
    checkIcon.ImageColor3 = Zen.Theme.Success
    checkIcon.ScaleType = Enum.ScaleType.Fit
    checkIcon.Parent = successBox

    local successText = Instance.new(loadstring(base64decode("VGV4dExhYmVs"))())
    successText.Size = UDim2.new(1, -60, 1, 0)
    successText.Position = UDim2.new(0, 52, 0, 0)
    successText.BackgroundTransparency = 1
    successText.Text = loadstring(base64decode("QWNjZXNzIEdyYW50ZWQ="))()
    successText.TextColor3 = Zen.Theme.Success
    successText.TextSize = mobile and 17 or 18
    successText.Font = Enum.Font.ArimoBold
    successText.TextXAlignment = Enum.TextXAlignment.Left
    successText.Parent = successBox

    local keylessText = Instance.new(loadstring(base64decode("VGV4dExhYmVs"))())
    keylessText.Size = UDim2.new(1, 0, 0, 20)
    keylessText.Position = UDim2.new(0.5, 0, 0, contentY + 60)
    keylessText.AnchorPoint = Vector2.new(0.5, 0)
    keylessText.BackgroundTransparency = 1
    keylessText.Text = loadstring(base64decode("S2V5bGVzcyBTY3JpcHQ="))()
    keylessText.TextColor3 = Zen.Theme.TextDim
    keylessText.TextSize = mobile and 14 or 15
    keylessText.Font = Enum.Font.ArimoBold
    keylessText.Parent = main

    local divider = Instance.new(loadstring(base64decode("RnJhbWU="))())
    divider.Size = UDim2.new(1, 0, 0, 3)
    divider.Position = UDim2.new(0, 0, 0, contentY + 88)
    divider.BackgroundColor3 = Zen.Theme.Divider
    divider.BorderSizePixel = 0
    divider.Parent = main

    local launchBtn = Instance.new(loadstring(base64decode("VGV4dEJ1dHRvbg=="))())
    launchBtn.Size = UDim2.new(0.75, 0, 0, 42)
    launchBtn.Position = UDim2.new(0.5, 0, 0, contentY + 103)
    launchBtn.AnchorPoint = Vector2.new(0.5, 0)
    launchBtn.BackgroundColor3 = Zen.Theme.Accent
    launchBtn.BorderSizePixel = 0
    launchBtn.Text = loadstring(base64decode(""))()
    launchBtn.AutoButtonColor = false
    launchBtn.Parent = main
    Instance.new(loadstring(base64decode("VUlDb3JuZXI="))(), launchBtn).CornerRadius = UDim.new(0, 4)

    local launchStroke = Instance.new(loadstring(base64decode("VUlTdHJva2U="))(), launchBtn)
    launchStroke.Color = Zen.Theme.AccentHover
    launchStroke.Thickness = 1
    launchStroke.Transparency = 0.5

    local launchContent = Instance.new(loadstring(base64decode("RnJhbWU="))())
    launchContent.Size = UDim2.new(1, 0, 1, 0)
    launchContent.BackgroundTransparency = 1
    launchContent.Parent = launchBtn

    local launchLayout = Instance.new(loadstring(base64decode("VUlMaXN0TGF5b3V0"))(), launchContent)
    launchLayout.FillDirection = Enum.FillDirection.Horizontal
    launchLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
    launchLayout.VerticalAlignment = Enum.VerticalAlignment.Center
    launchLayout.Padding = UDim.new(0, 8)

    local launchIcon = Instance.new(loadstring(base64decode("SW1hZ2VMYWJlbA=="))())
    launchIcon.Size = UDim2.new(0, 18, 0, 18)
    launchIcon.BackgroundTransparency = 1
    launchIcon.Image = getIcon(loadstring(base64decode("c2hpZWxk"))())
    launchIcon.ImageColor3 = Zen.Theme.Text
    launchIcon.ScaleType = Enum.ScaleType.Fit
    launchIcon.LayoutOrder = 1
    launchIcon.Parent = launchContent

    local launchLabel = Instance.new(loadstring(base64decode("VGV4dExhYmVs"))())
    launchLabel.Size = UDim2.new(0, 0, 0, 18)
    launchLabel.AutomaticSize = Enum.AutomaticSize.X
    launchLabel.BackgroundTransparency = 1
    launchLabel.Text = loadstring(base64decode("TGF1bmNoIFNjcmlwdA=="))()
    launchLabel.TextColor3 = Zen.Theme.Text
    launchLabel.TextSize = mobile and 14 or 15
    launchLabel.Font = Enum.Font.ArimoBold
    launchLabel.LayoutOrder = 2
    launchLabel.Parent = launchContent

    launchBtn.MouseEnter:Connect(function() TweenService:Create(launchBtn, TweenInfo.new(0.15), {BackgroundColor3 = Zen.Theme.AccentHover}):Play() end)
    launchBtn.MouseLeave:Connect(function() TweenService:Create(launchBtn, TweenInfo.new(0.15), {BackgroundColor3 = Zen.Theme.Accent}):Play() end)

    local bottomY = contentY + 153

    local userBtn = Instance.new(loadstring(base64decode("VGV4dEJ1dHRvbg=="))())
    userBtn.Size = UDim2.new(0, 36, 0, 36)
    userBtn.Position = UDim2.new(0.5, -44, 0, bottomY)
    userBtn.AnchorPoint = Vector2.new(0.5, 0)
    userBtn.BackgroundColor3 = Zen.Theme.Background
    userBtn.BorderSizePixel = 0
    userBtn.Text = loadstring(base64decode(""))()
    userBtn.AutoButtonColor = false
    userBtn.Parent = main
    Instance.new(loadstring(base64decode("VUlDb3JuZXI="))(), userBtn).CornerRadius = UDim.new(0, 4)

    local userIcon = Instance.new(loadstring(base64decode("SW1hZ2VMYWJlbA=="))())
    userIcon.Size = UDim2.new(0, 18, 0, 18)
    userIcon.Position = UDim2.new(0.5, 0, 0.5, 0)
    userIcon.AnchorPoint = Vector2.new(0.5, 0.5)
    userIcon.BackgroundTransparency = 1
    userIcon.Image = getIcon(loadstring(base64decode("dXNlcg=="))())
    userIcon.ImageColor3 = Zen.Theme.TextDim
    userIcon.ScaleType = Enum.ScaleType.Fit
    userIcon.Parent = userBtn
    userBtn.MouseEnter:Connect(function() TweenService:Create(userIcon, TweenInfo.new(0.15), {ImageColor3 = Zen.Theme.Accent}):Play() end)
    userBtn.MouseLeave:Connect(function() TweenService:Create(userIcon, TweenInfo.new(0.15), {ImageColor3 = Zen.Theme.TextDim}):Play() end)

    local discordBtn = Instance.new(loadstring(base64decode("VGV4dEJ1dHRvbg=="))())
    discordBtn.Size = UDim2.new(0, 36, 0, 36)
    discordBtn.Position = UDim2.new(0.5, 0, 0, bottomY)
    discordBtn.AnchorPoint = Vector2.new(0.5, 0)
    discordBtn.BackgroundColor3 = Zen.Theme.Background
    discordBtn.BorderSizePixel = 0
    discordBtn.Text = loadstring(base64decode(""))()
    discordBtn.AutoButtonColor = false
    discordBtn.Parent = main
    Instance.new(loadstring(base64decode("VUlDb3JuZXI="))(), discordBtn).CornerRadius = UDim.new(0, 4)

    local discordIcon = Instance.new(loadstring(base64decode("SW1hZ2VMYWJlbA=="))())
    discordIcon.Size = UDim2.new(0, 18, 0, 18)
    discordIcon.Position = UDim2.new(0.5, 0, 0.5, 0)
    discordIcon.AnchorPoint = Vector2.new(0.5, 0.5)
    discordIcon.BackgroundTransparency = 1
    discordIcon.Image = getIcon(loadstring(base64decode("ZGlzY29yZA=="))())
    discordIcon.ImageColor3 = Zen.Theme.Discord
    discordIcon.ScaleType = Enum.ScaleType.Fit
    discordIcon.Parent = discordBtn
    discordBtn.MouseEnter:Connect(function() TweenService:Create(discordIcon, TweenInfo.new(0.15), {ImageColor3 = Zen.Theme.DiscordHover}):Play() end)
    discordBtn.MouseLeave:Connect(function() TweenService:Create(discordIcon, TweenInfo.new(0.15), {ImageColor3 = Zen.Theme.Discord}):Play() end)

    local changelogBtn = Instance.new(loadstring(base64decode("VGV4dEJ1dHRvbg=="))())
    changelogBtn.Size = UDim2.new(0, 36, 0, 36)
    changelogBtn.Position = UDim2.new(0.5, 44, 0, bottomY)
    changelogBtn.AnchorPoint = Vector2.new(0.5, 0)
    changelogBtn.BackgroundColor3 = Zen.Theme.Background
    changelogBtn.BorderSizePixel = 0
    changelogBtn.Text = loadstring(base64decode(""))()
    changelogBtn.AutoButtonColor = false
    changelogBtn.Parent = main
    Instance.new(loadstring(base64decode("VUlDb3JuZXI="))(), changelogBtn).CornerRadius = UDim.new(0, 4)

    local changelogIcon = Instance.new(loadstring(base64decode("SW1hZ2VMYWJlbA=="))())
    changelogIcon.Size = UDim2.new(0, 18, 0, 18)
    changelogIcon.Position = UDim2.new(0.5, 0, 0.5, 0)
    changelogIcon.AnchorPoint = Vector2.new(0.5, 0.5)
    changelogIcon.BackgroundTransparency = 1
    changelogIcon.Image = getIcon(loadstring(base64decode("Y2hhbmdlbG9n"))())
    changelogIcon.ImageColor3 = Zen.Theme.TextDim
    changelogIcon.ScaleType = Enum.ScaleType.Fit
    changelogIcon.Parent = changelogBtn
    changelogBtn.MouseEnter:Connect(function() TweenService:Create(changelogIcon, TweenInfo.new(0.15), {ImageColor3 = Zen.Theme.Text}):Play() end)
    changelogBtn.MouseLeave:Connect(function() TweenService:Create(changelogIcon, TweenInfo.new(0.15), {ImageColor3 = Zen.Theme.TextDim}):Play() end)

    if #Zen.Changelog == 0 then
        changelogBtn.Visible = false
        userBtn.Position = UDim2.new(0.5, -22, 0, bottomY)
        discordBtn.Position = UDim2.new(0.5, 22, 0, bottomY)
    end

    local doors = CreateDoorOverlay(main, windowWidth, windowHeight)

    userBtn.MouseButton1Click:Connect(function() ui.toggleUser(userIcon) end)
    changelogBtn.MouseButton1Click:Connect(function() ui.toggleCL(changelogIcon) end)

    local function closeDoorsThenExit(callback)
        ui.closeAllPanels(userIcon, changelogIcon, function()
            doors.close(function() task.wait(0.3) if callback then callback() end end)
        end)
    end

    closeBtn.MouseButton1Click:Connect(function()
        Zen:Notify(loadstring(base64decode("R29vZGJ5ZQ=="))(), loadstring(base64decode("U2VlIHlvdSBuZXh0IHRpbWUh"))(), 2, loadstring(base64decode("Y2xvc2U="))())
        closeDoorsThenExit(function()
            fullCleanup()
            TweenService:Create(container, TweenInfo.new(0.4, Enum.EasingStyle.Quart), {Position = UDim2.new(0.5, 0, -0.5, 0)}):Play()
            TweenService:Create(main, TweenInfo.new(0.3), {BackgroundTransparency = 1}):Play()
            TweenService:Create(mainStroke, TweenInfo.new(0.3), {Transparency = 1}):Play()
            task.wait(0.4) gui:Destroy()
        end)
        if Zen.Callbacks.OnClose then Zen.Callbacks.OnClose() end
    end)

    launchBtn.MouseButton1Click:Connect(function()
        Zen:Notify(loadstring(base64decode("TGF1bmNoaW5n"))(), loadstring(base64decode("U2NyaXB0IGxvYWRlZCBzdWNjZXNzZnVsbHkh"))(), 2, loadstring(base64decode("c3VjY2Vzcw=="))())
        getgenv().SCRIPT_KEY = loadstring(base64decode("S0VZTEVTUw=="))()
        getgenv().ZenLoaded = false
        closeDoorsThenExit(function()
            disableBlur()
            TweenService:Create(container, TweenInfo.new(0.4, Enum.EasingStyle.Quart), {Position = UDim2.new(0.5, 0, -0.5, 0)}):Play()
            TweenService:Create(main, TweenInfo.new(0.3), {BackgroundTransparency = 1}):Play()
            TweenService:Create(mainStroke, TweenInfo.new(0.3), {Transparency = 1}):Play()
            task.wait(0.4) gui:Destroy()
            if not Internal.IsJunkieMode and Zen.Callbacks.OnSuccess then Zen.Callbacks.OnSuccess() end
        end)
    end)

    discordBtn.MouseButton1Click:Connect(function()
        if Zen.Links.Discord ~= loadstring(base64decode(""))() then
            Zen:Notify(loadstring(base64decode("RGlzY29yZA=="))(), loadstring(base64decode("SW52aXRlIGxpbmsgY29waWVkIQ=="))(), 2, loadstring(base64decode("ZGlzY29yZA=="))())
            pcall(function() setclipboard(Zen.Links.Discord) end)
        end
    end)

    setupDragging(header, container)
    TweenService:Create(container, TweenInfo.new(0.5, Enum.EasingStyle.Quart), {Position = UDim2.new(0.5, 0, 0.45, 0)}):Play()
    task.wait(0.6)
    doors.open(function()
        checkIcon.Size = UDim2.new(0, 0, 0, 0)
        TweenService:Create(checkIcon, TweenInfo.new(0.4, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {Size = UDim2.new(0, 24, 0, 24)}):Play()
        task.wait(0.2)
        ui.toggleUser(userIcon)
        if #Zen.Changelog > 0 then task.wait(0.3) ui.toggleCL(changelogIcon) end
    end)
end

local function BuildKeyUI()
    local oldGui = hui:FindFirstChild(loadstring(base64decode("WmVuS2V5U3lzdGVt"))())
    if oldGui then oldGui:Destroy() end
    local oldGui2 = hui:FindFirstChild(loadstring(base64decode("WmVuS2V5bGVzc1N5c3RlbQ=="))())
    if oldGui2 then oldGui2:Destroy() end

    enableBlur()

    local mobile = isMobile()
    local scale = getScale()
    local padding = 14
    local showShop = isShopEnabled()
    local shopHeight = 52
    local shopDividerHeight = 1
    local shopExtra = showShop and (shopHeight + shopDividerHeight) or 0
    local baseWindowHeight = mobile and math.clamp(360 * scale, 320, 400) or 360
    local windowWidth = mobile and math.clamp(400 * scale, 320, 440) or 400
    local windowHeight = baseWindowHeight + shopExtra
    local elementHeight = mobile and math.clamp(56 * scale, 48, 62) or 56
    local buttonHeight = mobile and math.clamp(42 * scale, 38, 48) or 42
    local statusHeight = mobile and math.clamp(60 * scale, 52, 68) or 60
    local userPanelWidth = 180
    local changelogPanelWidth = 220
    local gap = 12

    local screenGui = Instance.new(loadstring(base64decode("U2NyZWVuR3Vp"))())
    screenGui.Name = loadstring(base64decode("WmVuS2V5U3lzdGVt"))()
    screenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
    screenGui.ResetOnSpawn = false
    screenGui.IgnoreGuiInset = true
    screenGui.Parent = hui

    local ui = BuildCenteredUI(windowWidth, windowHeight, baseWindowHeight, userPanelWidth, changelogPanelWidth, gap, {gui = screenGui})
    local container = ui.container
    local mainFrame = ui.mainFrame
    local mainStroke = ui.mainStroke

    local header = Instance.new(loadstring(base64decode("RnJhbWU="))())
    header.Size = UDim2.new(1, 0, 0, 50)
    header.BackgroundColor3 = Zen.Theme.Header
    header.BorderSizePixel = 0
    header.Active = true
    header.Parent = mainFrame
    Instance.new(loadstring(base64decode("VUlDb3JuZXI="))(), header).CornerRadius = UDim.new(0, 4)

    local headerFix = Instance.new(loadstring(base64decode("RnJhbWU="))())
    headerFix.Size = UDim2.new(1, 0, 0, 6)
    headerFix.Position = UDim2.new(0, 0, 1, -6)
    headerFix.BackgroundColor3 = Zen.Theme.Header
    headerFix.BorderSizePixel = 0
    headerFix.Parent = header

    local headerLine = Instance.new(loadstring(base64decode("RnJhbWU="))())
    headerLine.Size = UDim2.new(1, 0, 0, 1)
    headerLine.Position = UDim2.new(0, 0, 1, 0)
    headerLine.BackgroundColor3 = Zen.Theme.Accent
    headerLine.BackgroundTransparency = 0.6
    headerLine.BorderSizePixel = 0
    headerLine.Parent = header

    local logo = Instance.new(loadstring(base64decode("SW1hZ2VMYWJlbA=="))())
    logo.Size = Zen.Appearance.IconSize
    logo.Position = UDim2.new(0, padding, 0.5, 0)
    logo.AnchorPoint = Vector2.new(0, 0.5)
    logo.BackgroundTransparency = 1
    logo.Image = getLogoIcon()
    logo.ImageColor3 = Zen.Theme.Text
    logo.ScaleType = Enum.ScaleType.Fit
    logo.Parent = header

    local titleLabel = Instance.new(loadstring(base64decode("VGV4dExhYmVs"))())
    titleLabel.Size = UDim2.new(1, -90, 1, 0)
    titleLabel.Position = UDim2.new(0, padding + Zen.Appearance.IconSize.X.Offset + 10, 0, 0)
    titleLabel.BackgroundTransparency = 1
    titleLabel.Text = Zen.Appearance.Title
    titleLabel.TextColor3 = Zen.Theme.Text
    titleLabel.TextSize = mobile and 24 or 26
    titleLabel.Font = Enum.Font.ArimoBold
    titleLabel.TextXAlignment = Enum.TextXAlignment.Left
    titleLabel.Parent = header

    local closeBtn = Instance.new(loadstring(base64decode("SW1hZ2VCdXR0b24="))())
    closeBtn.Size = UDim2.new(0, 22, 0, 22)
    closeBtn.Position = UDim2.new(1, -padding, 0.5, 0)
    closeBtn.AnchorPoint = Vector2.new(1, 0.5)
    closeBtn.BackgroundTransparency = 1
    closeBtn.Image = getIcon(loadstring(base64decode("Y2xvc2U="))())
    closeBtn.ImageColor3 = Zen.Theme.TextDim
    closeBtn.ScaleType = Enum.ScaleType.Fit
    closeBtn.Parent = header
    closeBtn.MouseEnter:Connect(function() TweenService:Create(closeBtn, TweenInfo.new(0.15), {ImageColor3 = Zen.Theme.Error}):Play() end)
    closeBtn.MouseLeave:Connect(function() TweenService:Create(closeBtn, TweenInfo.new(0.15), {ImageColor3 = Zen.Theme.TextDim}):Play() end)

    local contentStartY = 60

    local statusFrame = Instance.new(loadstring(base64decode("RnJhbWU="))())
    statusFrame.Size = UDim2.new(0.94, 0, 0, statusHeight)
    statusFrame.Position = UDim2.new(0.5, 0, 0, contentStartY)
    statusFrame.AnchorPoint = Vector2.new(0.5, 0)
    statusFrame.BackgroundColor3 = Zen.Theme.Input
    statusFrame.BorderSizePixel = 0
    statusFrame.ClipsDescendants = true
    statusFrame.Parent = mainFrame
    Instance.new(loadstring(base64decode("VUlDb3JuZXI="))(), statusFrame).CornerRadius = UDim.new(0, 4)

    local statusStroke = Instance.new(loadstring(base64decode("VUlTdHJva2U="))(), statusFrame)
    statusStroke.Color = Zen.Theme.Accent
    statusStroke.Thickness = 1
    statusStroke.Transparency = 0.8

    local statusIcon = Instance.new(loadstring(base64decode("SW1hZ2VMYWJlbA=="))())
    statusIcon.Size = UDim2.new(0, 24, 0, 24)
    statusIcon.Position = UDim2.new(0, 16, 0.5, 0)
    statusIcon.AnchorPoint = Vector2.new(0, 0.5)
    statusIcon.BackgroundTransparency = 1
    statusIcon.Image = getIcon(loadstring(base64decode("bG9jaw=="))())
    statusIcon.ImageColor3 = Zen.Theme.StatusIdle
    statusIcon.ScaleType = Enum.ScaleType.Fit
    statusIcon.Parent = statusFrame

    local statusLabel = Instance.new(loadstring(base64decode("VGV4dExhYmVs"))())
    statusLabel.Size = UDim2.new(1, -60, 1, 0)
    statusLabel.Position = UDim2.new(0, 52, 0, 0)
    statusLabel.BackgroundTransparency = 1
    statusLabel.Text = Zen.Appearance.Subtitle
    statusLabel.TextColor3 = Zen.Theme.StatusIdle
    statusLabel.TextSize = mobile and 17 or 18
    statusLabel.Font = Enum.Font.ArimoBold
    statusLabel.TextXAlignment = Enum.TextXAlignment.Left
    statusLabel.TextTruncate = Enum.TextTruncate.AtEnd
    statusLabel.Parent = statusFrame

    local inputStartY = contentStartY + statusHeight + 10

    local inputFrame = Instance.new(loadstring(base64decode("RnJhbWU="))())
    inputFrame.Size = UDim2.new(0.94, 0, 0, elementHeight)
    inputFrame.Position = UDim2.new(0.5, 0, 0, inputStartY)
    inputFrame.AnchorPoint = Vector2.new(0.5, 0)
    inputFrame.BackgroundColor3 = Zen.Theme.Input
    inputFrame.BorderSizePixel = 0
    inputFrame.ClipsDescendants = true
    inputFrame.Parent = mainFrame
    Instance.new(loadstring(base64decode("VUlDb3JuZXI="))(), inputFrame).CornerRadius = UDim.new(0, 4)

    local inputStroke = Instance.new(loadstring(base64decode("VUlTdHJva2U="))(), inputFrame)
    inputStroke.Color = Zen.Theme.Accent
    inputStroke.Thickness = 1
    inputStroke.Transparency = 0.7

    local textBox = Instance.new(loadstring(base64decode("VGV4dEJveA=="))())
    textBox.Size = UDim2.new(1, -24, 1, 0)
    textBox.Position = UDim2.new(0, 12, 0.5, 0)
    textBox.AnchorPoint = Vector2.new(0, 0.5)
    textBox.BackgroundTransparency = 1
    textBox.Text = loadstring(base64decode(""))()
    textBox.TextColor3 = Zen.Theme.Text
    textBox.PlaceholderText = loadstring(base64decode("RW50ZXIgeW91ciBrZXkuLi4="))()
    textBox.PlaceholderColor3 = Zen.Theme.TextDim
    textBox.TextSize = mobile and 17 or 18
    textBox.Font = Enum.Font.ArimoBold
    textBox.ClearTextOnFocus = false
    textBox.TextTruncate = Enum.TextTruncate.AtEnd
    textBox.TextXAlignment = Enum.TextXAlignment.Left
    textBox.Parent = inputFrame
    textBox.Focused:Connect(function() TweenService:Create(inputStroke, TweenInfo.new(0.15), {Transparency = 0.3}):Play() end)
    textBox.FocusLost:Connect(function() TweenService:Create(inputStroke, TweenInfo.new(0.15), {Transparency = 0.7}):Play() end)

    local dividerY = inputStartY + elementHeight + 12

    local dividerLine = Instance.new(loadstring(base64decode("RnJhbWU="))())
    dividerLine.Size = UDim2.new(1, 0, 0, 3)
    dividerLine.Position = UDim2.new(0, 0, 0, dividerY)
    dividerLine.BackgroundColor3 = Zen.Theme.Divider
    dividerLine.BorderSizePixel = 0
    dividerLine.Parent = mainFrame

    local acquireStartY = dividerY + 15

    local function createButton(text, iconKey, isPrimary, yPos)
        local btn = Instance.new(loadstring(base64decode("VGV4dEJ1dHRvbg=="))())
        btn.Size = UDim2.new(0.75, 0, 0, buttonHeight)
        btn.Position = UDim2.new(0.5, 0, 0, yPos)
        btn.AnchorPoint = Vector2.new(0.5, 0)
        btn.BackgroundColor3 = isPrimary and Zen.Theme.Accent or Zen.Theme.Input
        btn.BorderSizePixel = 0
        btn.Text = loadstring(base64decode(""))()
        btn.AutoButtonColor = false
        btn.Parent = mainFrame
        Instance.new(loadstring(base64decode("VUlDb3JuZXI="))(), btn).CornerRadius = UDim.new(0, 4)

        local btnStroke = Instance.new(loadstring(base64decode("VUlTdHJva2U="))(), btn)
        btnStroke.Color = isPrimary and Zen.Theme.AccentHover or Zen.Theme.Accent
        btnStroke.Thickness = 1
        btnStroke.Transparency = isPrimary and 0.5 or 0.7

        local content = Instance.new(loadstring(base64decode("RnJhbWU="))())
        content.Size = UDim2.new(1, 0, 1, 0)
        content.BackgroundTransparency = 1
        content.Parent = btn

        local layout = Instance.new(loadstring(base64decode("VUlMaXN0TGF5b3V0"))(), content)
        layout.FillDirection = Enum.FillDirection.Horizontal
        layout.HorizontalAlignment = Enum.HorizontalAlignment.Center
        layout.VerticalAlignment = Enum.VerticalAlignment.Center
        layout.Padding = UDim.new(0, 8)

        local iconImg = Instance.new(loadstring(base64decode("SW1hZ2VMYWJlbA=="))())
        iconImg.Size = UDim2.new(0, 18, 0, 18)
        iconImg.BackgroundTransparency = 1
        iconImg.Image = getIcon(iconKey)
        iconImg.ImageColor3 = Zen.Theme.Text
        iconImg.ScaleType = Enum.ScaleType.Fit
        iconImg.LayoutOrder = 1
        iconImg.Parent = content

        local label = Instance.new(loadstring(base64decode("VGV4dExhYmVs"))())
        label.Size = UDim2.new(0, 0, 0, 20)
        label.AutomaticSize = Enum.AutomaticSize.X
        label.BackgroundTransparency = 1
        label.Text = text
        label.TextColor3 = Zen.Theme.Text
        label.TextSize = mobile and 14 or 15
        label.Font = Enum.Font.ArimoBold
        label.LayoutOrder = 2
        label.Parent = content

        local origColor = btn.BackgroundColor3
        local hoverColor = isPrimary and Zen.Theme.AccentHover or Zen.Theme.Accent
        btn.MouseEnter:Connect(function() TweenService:Create(btn, TweenInfo.new(0.15), {BackgroundColor3 = hoverColor}):Play() end)
        btn.MouseLeave:Connect(function() TweenService:Create(btn, TweenInfo.new(0.15), {BackgroundColor3 = origColor}):Play() end)
        return btn
    end

    local acquireBtn = createButton(Zen.Options.NoGetKey and loadstring(base64decode("VW5hdmFpbGFibGU="))() or loadstring(base64decode("R2V0IEtleQ=="))(), Zen.Options.NoGetKey and loadstring(base64decode("bm9nZXRrZXk="))() or loadstring(base64decode("a2V5"))(), false, acquireStartY)
    if Zen.Options.NoGetKey then
        acquireBtn.Active = false
        TweenService:Create(acquireBtn, TweenInfo.new(0), {BackgroundColor3 = Zen.Theme.Pending}):Play()
    end

    local redeemBtn = createButton(loadstring(base64decode("UmVkZWVtIEtleQ=="))(), loadstring(base64decode("c2hpZWxk"))(), true, acquireStartY + buttonHeight + 5)
    local bottomY = acquireStartY + buttonHeight * 2 + 10

    local userBtn = Instance.new(loadstring(base64decode("VGV4dEJ1dHRvbg=="))())
    userBtn.Size = UDim2.new(0, 36, 0, 36)
    userBtn.Position = UDim2.new(0.5, -44, 0, bottomY)
    userBtn.AnchorPoint = Vector2.new(0.5, 0)
    userBtn.BackgroundColor3 = Zen.Theme.Background
    userBtn.BorderSizePixel = 0
    userBtn.Text = loadstring(base64decode(""))()
    userBtn.AutoButtonColor = false
    userBtn.Parent = mainFrame
    Instance.new(loadstring(base64decode("VUlDb3JuZXI="))(), userBtn).CornerRadius = UDim.new(0, 4)

    local userIcon = Instance.new(loadstring(base64decode("SW1hZ2VMYWJlbA=="))())
    userIcon.Size = UDim2.new(0, 18, 0, 18)
    userIcon.Position = UDim2.new(0.5, 0, 0.5, 0)
    userIcon.AnchorPoint = Vector2.new(0.5, 0.5)
    userIcon.BackgroundTransparency = 1
    userIcon.Image = getIcon(loadstring(base64decode("dXNlcg=="))())
    userIcon.ImageColor3 = Zen.Theme.TextDim
    userIcon.ScaleType = Enum.ScaleType.Fit
    userIcon.Parent = userBtn
    userBtn.MouseEnter:Connect(function() TweenService:Create(userIcon, TweenInfo.new(0.15), {ImageColor3 = Zen.Theme.Accent}):Play() end)
    userBtn.MouseLeave:Connect(function() TweenService:Create(userIcon, TweenInfo.new(0.15), {ImageColor3 = Zen.Theme.TextDim}):Play() end)

    local discordBtn = Instance.new(loadstring(base64decode("VGV4dEJ1dHRvbg=="))())
    discordBtn.Size = UDim2.new(0, 36, 0, 36)
    discordBtn.Position = UDim2.new(0.5, 0, 0, bottomY)
    discordBtn.AnchorPoint = Vector2.new(0.5, 0)
    discordBtn.BackgroundColor3 = Zen.Theme.Background
    discordBtn.BorderSizePixel = 0
    discordBtn.Text = loadstring(base64decode(""))()
    discordBtn.AutoButtonColor = false
    discordBtn.Parent = mainFrame
    Instance.new(loadstring(base64decode("VUlDb3JuZXI="))(), discordBtn).CornerRadius = UDim.new(0, 4)

    local discordIcon = Instance.new(loadstring(base64decode("SW1hZ2VMYWJlbA=="))())
    discordIcon.Size = UDim2.new(0, 18, 0, 18)
    discordIcon.Position = UDim2.new(0.5, 0, 0.5, 0)
    discordIcon.AnchorPoint = Vector2.new(0.5, 0.5)
    discordIcon.BackgroundTransparency = 1
    discordIcon.Image = getIcon(loadstring(base64decode("ZGlzY29yZA=="))())
    discordIcon.ImageColor3 = Zen.Theme.Discord
    discordIcon.ScaleType = Enum.ScaleType.Fit
    discordIcon.Parent = discordBtn
    discordBtn.MouseEnter:Connect(function() TweenService:Create(discordIcon, TweenInfo.new(0.15), {ImageColor3 = Zen.Theme.DiscordHover}):Play() end)
    discordBtn.MouseLeave:Connect(function() TweenService:Create(discordIcon, TweenInfo.new(0.15), {ImageColor3 = Zen.Theme.Discord}):Play() end)

    local changelogBtn = Instance.new(loadstring(base64decode("VGV4dEJ1dHRvbg=="))())
    changelogBtn.Size = UDim2.new(0, 36, 0, 36)
    changelogBtn.Position = UDim2.new(0.5, 44, 0, bottomY)
    changelogBtn.AnchorPoint = Vector2.new(0.5, 0)
    changelogBtn.BackgroundColor3 = Zen.Theme.Background
    changelogBtn.BorderSizePixel = 0
    changelogBtn.Text = loadstring(base64decode(""))()
    changelogBtn.AutoButtonColor = false
    changelogBtn.Parent = mainFrame
    Instance.new(loadstring(base64decode("VUlDb3JuZXI="))(), changelogBtn).CornerRadius = UDim.new(0, 4)

    local changelogIcon = Instance.new(loadstring(base64decode("SW1hZ2VMYWJlbA=="))())
    changelogIcon.Size = UDim2.new(0, 18, 0, 18)
    changelogIcon.Position = UDim2.new(0.5, 0, 0.5, 0)
    changelogIcon.AnchorPoint = Vector2.new(0.5, 0.5)
    changelogIcon.BackgroundTransparency = 1
    changelogIcon.Image = getIcon(loadstring(base64decode("Y2hhbmdlbG9n"))())
    changelogIcon.ImageColor3 = Zen.Theme.TextDim
    changelogIcon.ScaleType = Enum.ScaleType.Fit
    changelogIcon.Parent = changelogBtn
    changelogBtn.MouseEnter:Connect(function() TweenService:Create(changelogIcon, TweenInfo.new(0.15), {ImageColor3 = Zen.Theme.Text}):Play() end)
    changelogBtn.MouseLeave:Connect(function() TweenService:Create(changelogIcon, TweenInfo.new(0.15), {ImageColor3 = Zen.Theme.TextDim}):Play() end)

    if #Zen.Changelog == 0 then
        changelogBtn.Visible = false
        userBtn.Position = UDim2.new(0.5, -22, 0, bottomY)
        discordBtn.Position = UDim2.new(0.5, 22, 0, bottomY)
    end

    if showShop then
        local shopDivider = Instance.new(loadstring(base64decode("RnJhbWU="))())
        shopDivider.Size = UDim2.new(1, 0, 0, shopDividerHeight)
        shopDivider.Position = UDim2.new(0, 0, 1, -shopHeight - shopDividerHeight)
        shopDivider.AnchorPoint = Vector2.new(0, 0)
        shopDivider.BackgroundColor3 = Zen.Theme.Accent
        shopDivider.BackgroundTransparency = 0.6
        shopDivider.BorderSizePixel = 0
        shopDivider.Parent = mainFrame

        local shopFrame = Instance.new(loadstring(base64decode("RnJhbWU="))())
        shopFrame.Size = UDim2.new(1, 0, 0, shopHeight)
        shopFrame.Position = UDim2.new(0, 0, 1, -shopHeight)
        shopFrame.AnchorPoint = Vector2.new(0, 0)
        shopFrame.BackgroundColor3 = Zen.Theme.Header
        shopFrame.BorderSizePixel = 0
        shopFrame.ClipsDescendants = true
        shopFrame.Parent = mainFrame

        local shopCorner = Instance.new(loadstring(base64decode("VUlDb3JuZXI="))(), shopFrame)
        shopCorner.CornerRadius = UDim.new(0, 4)

        local shopTopFix = Instance.new(loadstring(base64decode("RnJhbWU="))())
        shopTopFix.Size = UDim2.new(1, 0, 0, 8)
        shopTopFix.Position = UDim2.new(0, 0, 0, 0)
        shopTopFix.BackgroundColor3 = Zen.Theme.Header
        shopTopFix.BorderSizePixel = 0
        shopTopFix.Parent = shopFrame

        local shopPadding = 14
        local shopIconSize = 28

        local shopIconWrapper = Instance.new(loadstring(base64decode("RnJhbWU="))())
        shopIconWrapper.Size = UDim2.new(0, shopIconSize + 4, 0, shopIconSize + 4)
        shopIconWrapper.Position = UDim2.new(0, shopPadding, 0.5, 0)
        shopIconWrapper.AnchorPoint = Vector2.new(0, 0.5)
        shopIconWrapper.BackgroundColor3 = Zen.Theme.Accent
        shopIconWrapper.BackgroundTransparency = 0.7
        shopIconWrapper.BorderSizePixel = 0
        shopIconWrapper.Parent = shopFrame
        Instance.new(loadstring(base64decode("VUlDb3JuZXI="))(), shopIconWrapper).CornerRadius = UDim.new(0, 4)

        local shopIconStroke = Instance.new(loadstring(base64decode("VUlTdHJva2U="))(), shopIconWrapper)
        shopIconStroke.Color = Zen.Theme.Accent
        shopIconStroke.Thickness = 1
        shopIconStroke.Transparency = 0.5

        local shopIconImg = Instance.new(loadstring(base64decode("SW1hZ2VMYWJlbA=="))())
        shopIconImg.Size = UDim2.new(0, shopIconSize, 0, shopIconSize)
        shopIconImg.Position = UDim2.new(0.5, 0, 0.5, 0)
        shopIconImg.AnchorPoint = Vector2.new(0.5, 0.5)
        shopIconImg.BackgroundTransparency = 1
        shopIconImg.Image = getShopIcon()
        shopIconImg.ImageColor3 = Zen.Theme.Text
        shopIconImg.ScaleType = Enum.ScaleType.Fit
        shopIconImg.Parent = shopIconWrapper

        local buyBtnWidth = 60
        local textStartX = shopPadding + shopIconSize + 4 + 10
        local textAreaWidth = windowWidth - textStartX - buyBtnWidth - shopPadding - 8

        local shopTitle = Instance.new(loadstring(base64decode("VGV4dExhYmVs"))())
        shopTitle.Size = UDim2.new(0, textAreaWidth, 0, 18)
        shopTitle.Position = UDim2.new(0, textStartX, 0, 9)
        shopTitle.BackgroundTransparency = 1
        shopTitle.Text = Zen.Shop.Title
        shopTitle.TextColor3 = Zen.Theme.Text
        shopTitle.TextSize = mobile and 13 or 14
        shopTitle.Font = Enum.Font.ArimoBold
        shopTitle.TextXAlignment = Enum.TextXAlignment.Left
        shopTitle.TextTruncate = Enum.TextTruncate.AtEnd
        shopTitle.Parent = shopFrame

        local shopSubtitle = Instance.new(loadstring(base64decode("VGV4dExhYmVs"))())
        shopSubtitle.Size = UDim2.new(0, textAreaWidth, 0, 14)
        shopSubtitle.Position = UDim2.new(0, textStartX, 0, 29)
        shopSubtitle.BackgroundTransparency = 1
        shopSubtitle.Text = Zen.Shop.Subtitle
        shopSubtitle.TextColor3 = Zen.Theme.TextDim
        shopSubtitle.TextSize = mobile and 10 or 11
        shopSubtitle.Font = Enum.Font.ArimoBold
        shopSubtitle.TextXAlignment = Enum.TextXAlignment.Left
        shopSubtitle.TextTruncate = Enum.TextTruncate.AtEnd
        shopSubtitle.Parent = shopFrame

        local buyBtn = Instance.new(loadstring(base64decode("VGV4dEJ1dHRvbg=="))())
        buyBtn.Size = UDim2.new(0, buyBtnWidth, 0, 30)
        buyBtn.Position = UDim2.new(1, -shopPadding, 0.5, 0)
        buyBtn.AnchorPoint = Vector2.new(1, 0.5)
        buyBtn.BackgroundColor3 = Zen.Theme.Accent
        buyBtn.BorderSizePixel = 0
        buyBtn.Text = loadstring(base64decode(""))()
        buyBtn.AutoButtonColor = false
        buyBtn.Parent = shopFrame
        Instance.new(loadstring(base64decode("VUlDb3JuZXI="))(), buyBtn).CornerRadius = UDim.new(0, 4)

        local buyBtnStroke = Instance.new(loadstring(base64decode("VUlTdHJva2U="))(), buyBtn)
        buyBtnStroke.Color = Zen.Theme.AccentHover
        buyBtnStroke.Thickness = 1
        buyBtnStroke.Transparency = 0.5

        local buyContent = Instance.new(loadstring(base64decode("RnJhbWU="))())
        buyContent.Size = UDim2.new(1, 0, 1, 0)
        buyContent.BackgroundTransparency = 1
        buyContent.Parent = buyBtn

        local buyLayout = Instance.new(loadstring(base64decode("VUlMaXN0TGF5b3V0"))(), buyContent)
        buyLayout.FillDirection = Enum.FillDirection.Horizontal
        buyLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
        buyLayout.VerticalAlignment = Enum.VerticalAlignment.Center
        buyLayout.Padding = UDim.new(0, 5)

        local buyIcon = Instance.new(loadstring(base64decode("SW1hZ2VMYWJlbA=="))())
        buyIcon.Size = UDim2.new(0, 14, 0, 14)
        buyIcon.BackgroundTransparency = 1
        buyIcon.Image = getIcon(loadstring(base64decode("Y2FydA=="))())
        buyIcon.ImageColor3 = Zen.Theme.Text
        buyIcon.ScaleType = Enum.ScaleType.Fit
        buyIcon.LayoutOrder = 1
        buyIcon.Parent = buyContent

        local buyLabel = Instance.new(loadstring(base64decode("VGV4dExhYmVs"))())
        buyLabel.Size = UDim2.new(0, 0, 0, 14)
        buyLabel.AutomaticSize = Enum.AutomaticSize.X
        buyLabel.BackgroundTransparency = 1
        buyLabel.Text = Zen.Shop.ButtonText
        buyLabel.TextColor3 = Zen.Theme.Text
        buyLabel.TextSize = mobile and 11 or 12
        buyLabel.Font = Enum.Font.ArimoBold
        buyLabel.LayoutOrder = 2
        buyLabel.Parent = buyContent

        buyBtn.MouseEnter:Connect(function() TweenService:Create(buyBtn, TweenInfo.new(0.15), {BackgroundColor3 = Zen.Theme.AccentHover}):Play() end)
        buyBtn.MouseLeave:Connect(function() TweenService:Create(buyBtn, TweenInfo.new(0.15), {BackgroundColor3 = Zen.Theme.Accent}):Play() end)
        buyBtn.MouseButton1Click:Connect(function()
            if Zen.Shop.Link ~= loadstring(base64decode(""))() then
                pcall(function() setclipboard(Zen.Shop.Link) end)
                Zen:Notify(loadstring(base64decode("U2hvcA=="))(), loadstring(base64decode("U2hvcCBsaW5rIGNvcGllZCB0byBjbGlwYm9hcmQh"))(), 2, loadstring(base64decode("Y29weQ=="))())
            end
        end)
    end

    local doors = CreateDoorOverlay(mainFrame, windowWidth, windowHeight)

    userBtn.MouseButton1Click:Connect(function() ui.toggleUser(userIcon) end)
    changelogBtn.MouseButton1Click:Connect(function() ui.toggleCL(changelogIcon) end)

    local spinConnection, dotsThread

    local function setStatus(state, customText)
        if spinConnection then spinConnection:Disconnect() spinConnection = nil statusIcon.Rotation = 0 end
        if dotsThread then task.cancel(dotsThread) dotsThread = nil end
        local color, icon, text = Zen.Theme.StatusIdle, getIcon(loadstring(base64decode("bG9jaw=="))()), customText or loadstring(base64decode("Tm8ga2V5IGRldGVjdGVk"))()
        if state == loadstring(base64decode("dmVyaWZ5aW5n"))() then
            color, icon, text = Zen.Theme.Accent, getIcon(loadstring(base64decode("bG9hZGluZw=="))()), loadstring(base64decode("VmVyaWZ5aW5nIGtleQ=="))()
            spinConnection = RunService.Heartbeat:Connect(function(dt)
                if statusIcon and statusIcon.Parent then statusIcon.Rotation = (statusIcon.Rotation + dt * 360) % 360
                else if spinConnection then spinConnection:Disconnect() end end
            end)
            local dots, cfowyH5M = {loadstring(base64decode("Lg=="))(), loadstring(base64decode("Li4="))(), loadstring(base64decode("Li4u"))(), loadstring(base64decode(""))()}, 1
            dotsThread = task.spawn(function()
                while statusLabel and statusLabel.Parent and statusLabel.Text:find(loadstring(base64decode("VmVyaWZ5aW5n"))(), 1, true) do
                    statusLabel.Text = text .. dots[cfowyH5M] cfowyH5M = (cfowyH5M % #dots) + 1 task.wait(0.4)
                end
            end)
        elseif state == loadstring(base64decode("c3VjY2Vzcw=="))() then color, icon, text = Zen.Theme.Success, getIcon(loadstring(base64decode("Y2hlY2s="))()), customText or loadstring(base64decode("QWNjZXNzIEdyYW50ZWQ="))()
        elseif state == loadstring(base64decode("ZXJyb3I="))() then color, icon, text = Zen.Theme.Error, getIcon(loadstring(base64decode("YWxlcnQ="))()), customText or loadstring(base64decode("SW52YWxpZCBLZXk="))() end
        TweenService:Create(statusLabel, TweenInfo.new(0.3), {TextColor3 = color}):Play()
        TweenService:Create(statusIcon, TweenInfo.new(0.3), {ImageColor3 = color}):Play()
        statusLabel.Text = text statusIcon.Image = icon
    end

    local function closeDoorsThenExit(callback)
        ui.closeAllPanels(userIcon, changelogIcon, function()
            doors.close(function() task.wait(0.3) if callback then callback() end end)
        end)
    end

    closeBtn.MouseButton1Click:Connect(function()
        Zen:Notify(loadstring(base64decode("R29vZGJ5ZQ=="))(), loadstring(base64decode("U2VlIHlvdSBuZXh0IHRpbWUh"))(), 2, loadstring(base64decode("Y2xvc2U="))())
        closeDoorsThenExit(function()
            fullCleanup()
            TweenService:Create(container, TweenInfo.new(0.4, Enum.EasingStyle.Quart), {Position = UDim2.new(0.5, 0, -0.5, 0)}):Play()
            TweenService:Create(mainFrame, TweenInfo.new(0.3), {BackgroundTransparency = 1}):Play()
            task.wait(0.4) screenGui:Destroy()
            if Zen.Callbacks.OnClose then Zen.Callbacks.OnClose() end
        end)
    end)

    local function handleRedeem()
        local key = textBox.Text:gsub(loadstring(base64decode("JXMr"))(), loadstring(base64decode(""))())
        if key == loadstring(base64decode(""))() then Zen:Notify(loadstring(base64decode("RXJyb3I="))(), loadstring(base64decode("UGxlYXNlIGVudGVyIHlvdXIga2V5"))(), 3, loadstring(base64decode("d2FybmluZw=="))()) return end
        setStatus(loadstring(base64decode("dmVyaWZ5aW5n"))()) redeemBtn.Active = false task.wait(0.3)
        local valid, errorMsg = false, loadstring(base64decode("SW52YWxpZCBrZXk="))()
        if Internal.ValidateFunction then
            local success, result, msg = pcall(Internal.ValidateFunction, key)
            if success then
                if type(result) == loadstring(base64decode("dGFibGU="))() then
                    valid = result.valid == true
                    local errMsgs = {
                        KEY_INVALID = loadstring(base64decode("S2V5IG5vdCBmb3VuZCBpbiBzeXN0ZW0="))(), KEY_EXPIRED = loadstring(base64decode("S2V5IGhhcyBleHBpcmVk"))(),
                        HWID_BANNED = loadstring(base64decode("SGFyZHdhcmUgYmFubmVk"))(), KEY_INVALIDATED = loadstring(base64decode("S2V5IHdhcyByZXZva2Vk"))(),
                        ALREADY_USED = loadstring(base64decode("T25lLXRpbWUga2V5IGFscmVhZHkgdXNlZA=="))(), HWID_MISMATCH = loadstring(base64decode("SFdJRCBsaW1pdCByZWFjaGVk"))(),
                        SERVICE_NOT_FOUND = loadstring(base64decode("U2VydmljZSBub3QgZm91bmQ="))(), SERVICE_MISMATCH = loadstring(base64decode("V3Jvbmcgc2VydmljZQ=="))(),
                        PREMIUM_REQUIRED = loadstring(base64decode("UHJlbWl1bSByZXF1aXJlZA=="))(), ERROR = loadstring(base64decode("TmV0d29yayBlcnJvcg=="))()
                    }
                    local errCode = result.error or loadstring(base64decode("VW5rbm93bg=="))()
                    errorMsg = errMsgs[errCode] or result.message or errCode
                    if errCode == loadstring(base64decode("SFdJRF9CQU5ORUQ="))() then task.delay(2, function() cloneref(Players.LocalPlayer):Kick(loadstring(base64decode("SGFyZHdhcmUgYmFubmVk"))()) end) end
                elseif type(result) == loadstring(base64decode("Ym9vbGVhbg=="))() then valid = result errorMsg = msg or loadstring(base64decode("SW52YWxpZCBrZXk="))() end
            end
        end
        redeemBtn.Active = true
        if valid then
            saveKey(key) getgenv().SCRIPT_KEY = key getgenv().ZenLoaded = false
            setStatus(loadstring(base64decode("c3VjY2Vzcw=="))()) Zen:Notify(loadstring(base64decode("U3VjY2Vzcw=="))(), loadstring(base64decode("S2V5IHZhbGlkYXRlZCBzdWNjZXNzZnVsbHkh"))(), 2, loadstring(base64decode("c3VjY2Vzcw=="))()) task.wait(1)
            closeDoorsThenExit(function()
                disableBlur()
                TweenService:Create(container, TweenInfo.new(0.4, Enum.EasingStyle.Quart), {Position = UDim2.new(0.5, 0, -0.5, 0)}):Play()
                TweenService:Create(mainFrame, TweenInfo.new(0.3), {BackgroundTransparency = 1}):Play()
                task.wait(0.4) screenGui:Destroy()
                if not Internal.IsJunkieMode and Zen.Callbacks.OnSuccess then Zen.Callbacks.OnSuccess() end
            end)
        else
            setStatus(loadstring(base64decode("ZXJyb3I="))(), errorMsg) Zen:Notify(loadstring(base64decode("SW52YWxpZA=="))(), errorMsg, 4, loadstring(base64decode("ZXJyb3I="))())
            if Zen.Callbacks.OnFail then Zen.Callbacks.OnFail(errorMsg) end
        end
    end

    redeemBtn.MouseButton1Click:Connect(handleRedeem)
    acquireBtn.MouseButton1Click:Connect(function()
        if Zen.Options.NoGetKey then
            Zen:Notify(loadstring(base64decode("VW5hdmFpbGFibGU="))(), loadstring(base64decode("R2V0IEtleSBpcyB1bmF2YWlsYWJsZQ=="))(), 3, loadstring(base64decode("bm9nZXRrZXk="))())
            return
        end
        if Zen.Links.GetKey ~= loadstring(base64decode(""))() then
            Zen:Notify(loadstring(base64decode("Q29waWVk"))(), loadstring(base64decode("S2V5IGxpbmsgY29waWVkIQ=="))(), 3, loadstring(base64decode("Y29weQ=="))())
            pcall(function() setclipboard(Zen.Links.GetKey) end)
        else
            Zen:Notify(loadstring(base64decode("RXJyb3I="))(), loadstring(base64decode("Tm8ga2V5IGxpbmsgc2V0"))(), 3, loadstring(base64decode("d2FybmluZw=="))())
        end
    end)
    discordBtn.MouseButton1Click:Connect(function()
        if Zen.Links.Discord ~= loadstring(base64decode(""))() then Zen:Notify(loadstring(base64decode("RGlzY29yZA=="))(), loadstring(base64decode("SW52aXRlIGxpbmsgY29waWVkIQ=="))(), 2, loadstring(base64decode("ZGlzY29yZA=="))()) pcall(function() setclipboard(Zen.Links.Discord) end) end
    end)
    textBox.FocusLost:Connect(function(enter) if enter then handleRedeem() end end)

    setupDragging(header, container)
    TweenService:Create(container, TweenInfo.new(0.5, Enum.EasingStyle.Quart), {Position = UDim2.new(0.5, 0, 0.45, 0)}):Play()
    task.wait(0.6)
    doors.open(function()
        task.wait(0.2)
        ui.toggleUser(userIcon)
        if #Zen.Changelog > 0 then task.wait(0.3) ui.toggleCL(changelogIcon) end
    end)
end

function Zen:Launch()
    Internal.IsJunkieMode = false
    Internal.ValidateFunction = Zen.Callbacks.OnVerify
    local existingKey = getgenv().SCRIPT_KEY
    if existingKey and existingKey ~= loadstring(base64decode(""))() then
        if existingKey == loadstring(base64decode("S0VZTEVTUw=="))() then
            Zen:Notify(loadstring(base64decode("RXhlY3V0ZWQ="))(), loadstring(base64decode("U2NyaXB0IGxvYWRlZCBzdWNjZXNzZnVsbHkh"))(), 2, loadstring(base64decode("c3VjY2Vzcw=="))())
            if Zen.Callbacks.OnSuccess then Zen.Callbacks.OnSuccess() end return
        elseif Internal.ValidateFunction and validateKey(existingKey, Internal.ValidateFunction) then
            Zen:Notify(loadstring(base64decode("RXhlY3V0ZWQ="))(), loadstring(base64decode("U2NyaXB0IGxvYWRlZCBzdWNjZXNzZnVsbHkh"))(), 2, loadstring(base64decode("c3VjY2Vzcw=="))())
            if Zen.Callbacks.OnSuccess then Zen.Callbacks.OnSuccess() end return
        end
        getgenv().SCRIPT_KEY = nil
    end
    getgenv().ZenClosed = false
    EnsureIconsReady(function()
        if Zen.Options.Keyless == true then
            if Zen.Options.KeylessUI == false then handleKeylessSkip() return end
            BuildKeylessUI()
            while not getgenv().SCRIPT_KEY and not getgenv().ZenClosed do task.wait(0.1) end
            return
        end
        if Zen.Storage.AutoLoad and Internal.ValidateFunction then
            local savedKey = loadKey()
            if savedKey and savedKey ~= loadstring(base64decode(""))() then
                Zen:Notify(loadstring(base64decode("Q2hlY2tpbmc="))(), loadstring(base64decode("VmFsaWRhdGluZyBzYXZlZCBrZXkuLi4="))(), 2, loadstring(base64decode("c2hpZWxk"))()) task.wait(0.5)
                if validateKey(savedKey, Internal.ValidateFunction) then
                    getgenv().SCRIPT_KEY = savedKey
                    Zen:Notify(loadstring(base64decode("V2VsY29tZSBCYWNr"))(), loadstring(base64decode("S2V5IHZhbGlkYXRlZCE="))(), 2, loadstring(base64decode("c3VjY2Vzcw=="))())
                    if Zen.Callbacks.OnSuccess then Zen.Callbacks.OnSuccess() end return
                else clearKey() Zen:Notify(loadstring(base64decode("RXhwaXJlZA=="))(), loadstring(base64decode("U2F2ZWQga2V5IGlzIG5vIGxvbmdlciB2YWxpZA=="))(), 3, loadstring(base64decode("d2FybmluZw=="))()) task.wait(1) end
            end
        end
        BuildKeyUI()
        while not getgenv().SCRIPT_KEY and not getgenv().ZenClosed do task.wait(0.1) end
    end)
end

function Zen:LaunchJunkie(config)
    assert(config and config.Service and config.Identifier and config.Provider, loadstring(base64decode("Q29uZmlnIHJlcXVpcmVkOiBTZXJ2aWNlLCBJZGVudGlmaWVyLCBQcm92aWRlcg=="))())
    Internal.IsJunkieMode = true
    local existingKey = getgenv().SCRIPT_KEY
    if existingKey and existingKey ~= loadstring(base64decode(""))() then
        Zen:Notify(loadstring(base64decode("RXhlY3V0ZWQ="))(), loadstring(base64decode("U2NyaXB0IGxvYWRlZCBzdWNjZXNzZnVsbHkh"))(), 2, loadstring(base64decode("c3VjY2Vzcw=="))())
        if Zen.Callbacks.OnSuccess then Zen.Callbacks.OnSuccess() end return
    end
    getgenv().ZenClosed = false
    EnsureIconsReady(function()
        local success, Junkie = pcall(function() return loadstring(game:HttpGet(loadstring(base64decode("aHR0cHM6Ly9qbmtpZS5jb20vc2RrL2xpYnJhcnkubHVh"))()))() end)
        if not success or not Junkie then Zen:Notify(loadstring(base64decode("RXJyb3I="))(), loadstring(base64decode("RmFpbGVkIHRvIGxvYWQgSnVua2llIFNESw=="))(), 5, loadstring(base64decode("ZXJyb3I="))()) return end
        Junkie.service = config.Service
        Junkie.identifier = config.Identifier
        Junkie.provider = config.Provider
        Internal.Junkie = Junkie
        if Zen.Links.GetKey == loadstring(base64decode(""))() then pcall(function() Zen.Links.GetKey = Junkie.get_key_link() end) end
        Internal.ValidateFunction = function(key) return Junkie.check_key(key) end
        if Zen.Options.Keyless == nil then
            local ks, kr = pcall(function() return Junkie.check_key(loadstring(base64decode("S0VZTEVTUw=="))()) end)
            if ks and kr and kr.valid then
                if Zen.Options.KeylessUI == false then handleKeylessSkip() return end
                BuildKeylessUI()
                while not getgenv().SCRIPT_KEY and not getgenv().ZenClosed do task.wait(0.1) end
                return
            end
        elseif Zen.Options.Keyless == true then
            if Zen.Options.KeylessUI == false then handleKeylessSkip() return end
            BuildKeylessUI()
            while not getgenv().SCRIPT_KEY and not getgenv().ZenClosed do task.wait(0.1) end
            return
        end
        if Zen.Storage.AutoLoad then
            local savedKey = loadKey()
            if savedKey and savedKey ~= loadstring(base64decode(""))() then
                Zen:Notify(loadstring(base64decode("Q2hlY2tpbmc="))(), loadstring(base64decode("VmFsaWRhdGluZyBzYXZlZCBrZXkuLi4="))(), 2, loadstring(base64decode("c2hpZWxk"))()) task.wait(0.5)
                local vs, vr = pcall(function() return Junkie.check_key(savedKey) end)
                if vs and vr and vr.valid then
                    getgenv().SCRIPT_KEY = savedKey
                    Zen:Notify(loadstring(base64decode("V2VsY29tZSBCYWNr"))(), loadstring(base64decode("S2V5IHZhbGlkYXRlZCE="))(), 2, loadstring(base64decode("c3VjY2Vzcw=="))())
                    if Zen.Callbacks.OnSuccess then Zen.Callbacks.OnSuccess() end return
                else clearKey() Zen:Notify(loadstring(base64decode("RXhwaXJlZA=="))(), loadstring(base64decode("U2F2ZWQga2V5IGlzIG5vIGxvbmdlciB2YWxpZA=="))(), 3, loadstring(base64decode("d2FybmluZw=="))()) task.wait(1) end
            end
        end
        BuildKeyUI()
        while not getgenv().SCRIPT_KEY and not getgenv().ZenClosed do task.wait(0.1) end
    end)
    local key = getgenv().SCRIPT_KEY
    return key ~= nil and key ~= loadstring(base64decode(""))()
end

function Zen:GetSavedKey() return loadKey() end
function Zen:ClearSavedKey() return clearKey() end

getgenv().Zen = Zen

local CFG = {
    Service = loadstring(base64decode("a2V5"))(),
    Identifier = loadstring(base64decode("MTIzNDgxOQ=="))(),
    Provider = loadstring(base64decode("a2V5c3lzdGVt"))(),
    ScriptUrl = loadstring(base64decode(""))(),
    ScriptFile = loadstring(base64decode("WmVuU2NyaXB0cy5sdWE="))()
}

local function loadCheat()
    local ok, err = pcall(function()
        local source
        if CFG.ScriptUrl ~= loadstring(base64decode(""))() then
            source = game:HttpGet(CFG.ScriptUrl)
        elseif typeof(isfile) == loadstring(base64decode("ZnVuY3Rpb24="))() and isfile(CFG.ScriptFile) then
            source = readfile(CFG.ScriptFile)
        end
        if not source then
            error(loadstring(base64decode("Y2hlYXQgc2NyaXB0IG5vdCBmb3VuZDogc2V0IFNjcmlwdFVybCBvciBwbGFjZSA="))() .. CFG.ScriptFile .. loadstring(base64decode("IGluIHRoZSB3b3Jrc3BhY2UgZm9sZGVy"))(), 0)
        end
        local chunk, parseError = loadstring(source)
        if not chunk then error(parseError, 0) end
        chunk()
    end)
    if not ok then
        warn(loadstring(base64decode("W1plblNjcmlwdHNdIA=="))() .. tostring(err))
        Zen:Notify(loadstring(base64decode("RXJyb3I="))(), loadstring(base64decode("Q291bGQgbm90IHN0YXJ0IHRoZSBzY3JpcHQ="))(), 4, loadstring(base64decode("ZXJyb3I="))())
    end
end

if Zen:LaunchJunkie({Service = CFG.Service, Identifier = CFG.Identifier, Provider = CFG.Provider}) then
    loadCheat()
end
end
e6bN0Sz3(DBEsA)
end)(...)