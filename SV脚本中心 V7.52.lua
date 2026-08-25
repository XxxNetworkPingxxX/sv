--bro你还真看，反正我真放

local WindUI = loadstring(game:HttpGet("https://github.com/Footagesus/WindUI/releases/latest/download/main.lua"))()

local Window = WindUI:CreateWindow({
    Title = "SV Hub",
    Icon = "solar:code-circle-linear",
    Author = "由NetworkPing制作"
})

Window:EditOpenButton({
    Title = "SV脚本中心",
    Icon = "solar:atom-outline",
    CornerRadius = UDim.new(2, 16),
    StrokeThickness = 2,
    Color = ColorSequence.new(Color3.fromHex("FF0F7B"), Color3.fromHex("F89B29")),
    OnlyMobile = false,
    Enabled = true,
    Draggable = true,
})

Window:Tag({
    Title = "v7.52",
    Icon = "solar:star-circle-linear",
    Color = Color3.fromHex("#30ff6a"),
    Radius = 20,
})

Window:IsResizable(false)

WindUI:AddTheme({
    Name = "SV主题",
    
    Accent = Color3.fromHex("#FF0000"),
    Background = Color3.fromHex("#5EB7D9"),
    Outline = Color3.fromHex("#FF0000"),
    Text = Color3.fromHex("#000000"),
    Placeholder = Color3.fromHex("#FF0000"),
    Button = Color3.fromHex("#FF0000"),
    Icon = Color3.fromHex("#FF0000"),
})

WindUI:SetTheme("SV主题")

local InfoTab = Window:Tab({ Title = "信息", Icon = "info" })
local MainTab = Window:Tab({ Title = "通用", Icon = "settings" })
local ESPTab = Window:Tab({ Title = "高亮/透视", Icon = "solar:eye-scan-outline" })
local MoneyTab = Window:Tab({ Title = "无限R币", Icon = "dollar-sign" })
local FeTab = Window:Tab({ Title = "FE动作", Icon = "music" })
local DoorsTab = Window:Tab({ Title = "Doors", Icon = "door-closed" })
local BuildTab = Window:Tab({ Title = "造船寻宝", Icon = "anchor" })
local OutTab = Window:Tab({ Title = "击倒🐧", Icon = "target" })
local FloodTab = Window:Tab({ Title = "逃离海啸", Icon = "waves" })
local GoldTab = Window:Tab({ Title = "亡命速递", Icon = "truck" })
local DrawTab = Window:Tab({ Title = "画我", Icon = "brush" })
local CarTab = Window:Tab({ Title = "无所事事车", Icon = "car" })
local ForestTab = Window:Tab({ Title = "森林中的99夜", Icon = "trees" })
local NdsTab = Window:Tab({ Title = "自然灾害", Icon = "cloud-rain" })
local ScriptsTab = Window:Tab({ Title = "其他脚本中心", Icon = "code" })
local BackdoorTab = Window:Tab({ Title = "漏洞利用", Icon = "solar:bug-minimalistic-outline" })
local DiscordTab = Window:Tab({ Title = "社交群", Icon = "message-circle" })

local player = game.Players.LocalPlayer
local lighting = game:GetService("Lighting")

local function getHumanoid()
    return player.Character and player.Character:FindFirstChild("Humanoid")
end

InfoTab:Section({ Title = "2026/8/25" })
InfoTab:Section({ Title = "脚本源码完全开放！" })
InfoTab:Section({ Title = "关于Discord社区" })
InfoTab:Section({ Title = "想要反馈或者加什么就去discord上说明" })
InfoTab:Section({ Title = "Q群：883146290" })
InfoTab:Section({ Title = "注意事项" })
InfoTab:Section({ Title = "关闭脚本前记得把所有功能功能关闭" })
InfoTab:Section({ Title = "关了UI之后功能效果还在" })
InfoTab:Section({ Title = "您的名称：" .. player.Name })
InfoTab:Section({ Title = "您的ID：" .. tostring(player.UserId) })
InfoTab:Section({ Title = "免费的缝合中心" })
InfoTab:Section({ Title = "作者：NetworkPing" })
InfoTab:Section({ Title = "远古版本作者：。。。(已查无此人)" })
InfoTab:Section({ Title = "急急纳如律令🤫妈咪贝贝轰🤫" })
InfoTab:Section({ Title = "急→急↗急↘急×114514→急→急🗣" })
InfoTab:Section({ Title = "急急纳如律令🤔妈咪贝贝轰🤓" })
InfoTab:Section({ Title = "世界万物🤫它皆为我所用😡" })
InfoTab:Section({ Title = "手持桃木🤓随我踏马出征🤫" })
InfoTab:Section({ Title = "斩尽小人💀还我一世安宁😋" })
InfoTab:Section({ Title = "急急纳如律令🤩妈咪贝贝轰🤓" })
InfoTab:Section({ Title = "临兵斗者🧐皆列阵前行😜" })
InfoTab:Section({ Title = "两仪生四象😈万物化三清💀" })
InfoTab:Section({ Title = "超脱于三界外😈不在那五行中☠️" })
InfoTab:Section({ Title = "《聚财咒》" })

MainTab:Section({ Title = "玩家设置" })

local speedEnabled = false
local currentSpeed = 50
local originalSpeed = nil

local function applySpeed()
    local h = getHumanoid()
    if not h then return end
    if originalSpeed == nil then originalSpeed = h.WalkSpeed end
    h.WalkSpeed = speedEnabled and currentSpeed or originalSpeed
end

local SpeedSlider = MainTab:Slider({
    Title = "速度",
    Step = 0.1,
    Value = { Min = 0, Max = 500, Default = 50 },
    Callback = function(value)
        currentSpeed = value
        if speedEnabled then applySpeed() end
    end
})

local SpeedToggle = MainTab:Toggle({
    Title = "设置玩家速度",
    Type = "Checkbox",
    Value = false,
    Callback = function(state)
        speedEnabled = state
        applySpeed()
    end
})

local gravityEnabled = false
local currentGravity = 196
local originalGravity = nil

local function applyGravity()
    if gravityEnabled then
        game.Workspace.Gravity = currentGravity
    elseif originalGravity then
        game.Workspace.Gravity = originalGravity
    end
end

local GravitySlider = MainTab:Slider({
    Title = "重力值",
    Step = 0.1,
    Value = { Min = 0, Max = 500, Default = 196 },
    Callback = function(value)
        currentGravity = value
        if gravityEnabled then applyGravity() end
    end
})

local GravityToggle = MainTab:Toggle({
    Title = "设置重力",
    Type = "Checkbox",
    Value = false,
    Callback = function(state)
        if state and originalGravity == nil then
            originalGravity = game.Workspace.Gravity
        end
        gravityEnabled = state
        applyGravity()
    end
})

local jumpEnabled = false
local currentJump = 50
local originalJump = nil

local function applyJump()
    local h = getHumanoid()
    if not h then return end
    if originalJump == nil then originalJump = h.JumpPower end
    h.JumpPower = jumpEnabled and currentJump or originalJump
end

local JumpSlider = MainTab:Slider({
    Title = "跳跃高度",
    Step = 0.1,
    Value = { Min = 0, Max = 500, Default = 50 },
    Callback = function(value)
        currentJump = value
        if jumpEnabled then applyJump() end
    end
})

local JumpToggle = MainTab:Toggle({
    Title = "设置玩家跳跃",
    Type = "Checkbox",
    Value = false,
    Callback = function(state)
        jumpEnabled = state
        applyJump()
    end
})

MainTab:Section({ Title = "功能" })

local noclipEnabled = false
local noclipConn = nil

local NoclipToggle = MainTab:Toggle({
    Title = "穿墙模式",
    Type = "Checkbox",
    Value = false,
    Callback = function(state)
        noclipEnabled = state
        if noclipConn then noclipConn:Disconnect() end
        if noclipEnabled then
            noclipConn = game:GetService("RunService").Stepped:Connect(function()
                local char = player.Character
                if char then
                    for _, part in pairs(char:GetDescendants()) do
                        if part:IsA("BasePart") then
                            part.CanCollide = false
                        end
                    end
                end
            end)
        end
    end
})

local autoWeaponEnabled = false
local autoWeaponDelay = 0.1
local autoWeaponThread = nil

local WeaponDelaySlider = MainTab:Slider({
    Title = "武器使用间隔",
    Step = 0.00001,
    Value = { Min = 0, Max = 1, Default = 0.1 },
    Callback = function(value)
        autoWeaponDelay = value
        if autoWeaponEnabled then
            if autoWeaponThread then task.cancel(autoWeaponThread) end
            autoWeaponThread = task.spawn(function()
                while autoWeaponEnabled do
                    local character = player.Character
                    if character then
                        local tool = character:FindFirstChildWhichIsA("Tool")
                        if tool then
                            pcall(function() tool:Activate() end)
                        end
                    end
                    task.wait(autoWeaponDelay)
                end
            end)
        end
    end
})

local AutoWeaponToggle = MainTab:Toggle({
    Title = "自动使用武器",
    Type = "Checkbox",
    Value = false,
    Callback = function(state)
        autoWeaponEnabled = state
        if autoWeaponEnabled then
            if autoWeaponThread then task.cancel(autoWeaponThread) end
            autoWeaponThread = task.spawn(function()
                while autoWeaponEnabled do
                    local character = player.Character
                    if character then
                        local tool = character:FindFirstChildWhichIsA("Tool")
                        if tool then
                            pcall(function() tool:Activate() end)
                        end
                    end
                    task.wait(autoWeaponDelay)
                end
            end)
        else
            if autoWeaponThread then
                task.cancel(autoWeaponThread)
                autoWeaponThread = nil
            end
        end
    end
})

local infJumpEnabled = false
local infJumpConn = nil

local InfJumpToggle = MainTab:Toggle({
    Title = "无限跳",
    Type = "Checkbox",
    Value = false,
    Callback = function(state)
        infJumpEnabled = state
        if infJumpConn then infJumpConn:Disconnect() end
        if infJumpEnabled then
            infJumpConn = game:GetService("UserInputService").JumpRequest:Connect(function()
                local h = getHumanoid()
                if h and h:GetState() ~= Enum.HumanoidStateType.Jumping then
                    h:ChangeState(Enum.HumanoidStateType.Jumping)
                end
            end)
        end
    end
})

local nvEnabled = false
local nvBrightness = 2
local origBrightness = nil
local origAmbient = nil
local nvConn = nil

local NVSlider = MainTab:Slider({
    Title = "夜视亮度",
    Step = 0.1,
    Value = { Min = 0.5, Max = 5, Default = 2 },
    Callback = function(value)
        nvBrightness = value
        if nvEnabled then lighting.Brightness = value end
    end
})

local NightVisionToggle = MainTab:Toggle({
    Title = "夜视+去雾",
    Type = "Checkbox",
    Value = false,
    Callback = function(state)
        nvEnabled = state
        if nvConn then nvConn:Disconnect() end
        if nvEnabled then
            if origBrightness == nil then origBrightness = lighting.Brightness end
            if origAmbient == nil then origAmbient = lighting.Ambient end
            nvConn = game:GetService("RunService").RenderStepped:Connect(function()
                lighting.Brightness = nvBrightness
                lighting.Ambient = Color3.fromRGB(255, 255, 255)
                lighting.OutdoorAmbient = Color3.fromRGB(255, 255, 255)
                lighting.ColorShift_Top = Color3.fromRGB(255, 255, 255)
                lighting.ColorShift_Bottom = Color3.fromRGB(255, 255, 255)
                lighting.FogStart = 9e9
                lighting.FogEnd = 9e9
            end)
        else
            if origBrightness then lighting.Brightness = origBrightness end
            if origAmbient then lighting.Ambient = origAmbient end
            lighting.OutdoorAmbient = Color3.fromRGB(0, 0, 0)
            lighting.ColorShift_Top = Color3.fromRGB(0, 0, 0)
            lighting.ColorShift_Bottom = Color3.fromRGB(0, 0, 0)
        end
    end
})

local antiFling = false
local flingParts = {}

local AntiFlingToggle = MainTab:Toggle({
    Title = "防甩飞",
    Type = "Checkbox",
    Value = false,
    Callback = function(state)
        antiFling = state
        if antiFling then
            game:GetService("RunService").Heartbeat:Connect(function()
                if not antiFling then return end
                for _, p in pairs(game.Players:GetPlayers()) do
                    if p ~= player and p.Character then
                        for _, part in pairs(p.Character:GetDescendants()) do
                            if part:IsA("BasePart") then
                                if flingParts[part] == nil then flingParts[part] = part.CanCollide end
                                part.CanCollide = false
                            end
                        end
                    end
                end
            end)
        else
            for part, col in pairs(flingParts) do pcall(function() part.CanCollide = col end) end
            flingParts = {}
        end
    end
})

local fastPrompt = false
local promptDurs = {}

local function applyFastPrompts()
    for _, p in pairs(workspace:GetDescendants()) do
        if p:IsA("ProximityPrompt") and promptDurs[p] == nil then
            promptDurs[p] = p.HoldDuration
            p.HoldDuration = 0
        end
    end
end

local FastPromptToggle = MainTab:Toggle({
    Title = "瞬间互动",
    Type = "Checkbox",
    Value = false,
    Callback = function(state)
        fastPrompt = state
        if fastPrompt then
            applyFastPrompts()
            workspace.DescendantAdded:Connect(function(d)
                if fastPrompt and d:IsA("ProximityPrompt") and promptDurs[d] == nil then
                    promptDurs[d] = d.HoldDuration
                    d.HoldDuration = 0
                end
            end)
        else
            for p, dur in pairs(promptDurs) do pcall(function() p.HoldDuration = dur end) end
            promptDurs = {}
        end
    end
})

MainTab:Button({
    Title = "飞行",
    Desc = "自己汉化的👁",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/XxxNetworkPingxxX/fly/main/fly%20v3"))()
    end
})

MainTab:Button({
    Title = "光影",
    Desc = "适合摄影👍",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/MZEEN2424/Graphics/main/Graphics.xml"))()
    end
})

MainTab:Button({
    Title = "自由视角",
    Desc = "让我们打开自由视角🤓",
    Callback = function()
        loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-Universal-Freecam-48608"))()
    end
})

MainTab:Button({
    Title = "缓慢降落",
    Desc = "c00lkid💀👍",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/XxxNetworkPingxxX/Slow-descent/main/script"))()
    end
})

MainTab:Button({
    Title = "虚假朋友",
    Desc = "别人看见了滚木朋友🤫",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/sigmaboy123z/MYFRIENDSCRIPT/refs/heads/main/MYNEWFRIENDSPAWNER"))()
    end
})

MainTab:Button({
    Title = "常规飞车",
    Desc = "刹不住车🤔",
    Callback = function()
        loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-Vfly-indonesian-53139"))()
    end
})

MainTab:Button({
    Title = "不常见飞车",
    Desc = "开车不让用角色轮盘就老实了💀",
    Callback = function()
        loadstring(game:HttpGet('https://raw.githubusercontent.com/ScpGuest666/Random-Roblox-script/refs/heads/main/Roblox%20Vehicle%20Fly%20Gui%20script'))()
    end
})

MainTab:Button({
    Title = "铁拳",
    Desc = "拉回🤫角色无碰撞🤫",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/XxxNetworkPingxxX/fling/main/ok"))()
    end
})

MainTab:Button({
    Title = "传送脚本",
    Desc = "只能加不能删🤔",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/XxxNetworkPingxxX/go/main/to"))()
    end
})

MainTab:Button({
    Title = "点击传送工具",
    Desc = "老演员了💀",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/XxxNetworkPingxxX/click/main/tp"))()
    end
})

MainTab:Button({
    Title = "坐标传送脚本",
    Desc = "🤔",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/XxxNetworkPingxxX/tp/4576cd95cf9bd9959442edee1af2f3a8b66ef0e8/%E4%BC%A0%E9%80%81%E8%84%9A%E6%9C%AC"))()
    end
})

MainTab:Button({
    Title = "TAS",
    Desc = "录制然后反复跑🤨",
    Callback = function()
        loadstring(game:HttpGet("https://super-lab-3b9f.sowonaha.workers.dev"))()
    end
})

MainTab:Button({
    Title = "剑脚本",
    Desc = "没有剑就老实了💀",
    Callback = function()
        loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-Sword-Script-57458"))()
    end
})

MainTab:Button({
    Title = "Egor同款重力",
    Desc = "物件也会一样",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/Rawbr10/Roblox-Scripts/refs/heads/main/0%20Graviy%20Trip%20Universal"))()
    end
})

MainTab:Button({
    Title = "踏空行走",
    Desc = "妈妈快看☠️那里有个人踩着滚木行走😱",
    Callback = function()
        loadstring(game:HttpGet('https://raw.githubusercontent.com/GhostPlayer352/Test4/main/Float'))()
    end
})

MainTab:Button({
    Title = "音乐脚本客户端",
    Desc = "豪听😋😋😋",
    Callback = function()
        loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-YouTube-Music-Player-72222"))()
    end
})

MainTab:Button({
    Title = "滑倒(娱乐)",
    Desc = "不给予评价",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/XxxNetworkPingxxX/slip/main/滑倒"))()
    end
})

MainTab:Button({
    Title = "漏洞提取与抓包",
    Desc = "🤔🤔🤔",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/cytj777i/-./main/Casual"))()
    end
})

MainTab:Button({
    Title = "无敌少侠飞行R15(Mobile)",
    Desc = "果冻人💀👍",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/396abc/Script/refs/heads/main/MobileFly.lua"))()
    end
})

MainTab:Button({
    Title = "无敌少侠飞行R15(PC)",
    Desc = "还是果冻",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/396abc/Script/refs/heads/main/FlyR15.lua"))()
    end
})

MainTab:Button({
    Title = "Mobile调灵敏度",
    Desc = "好用😋👍",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/XxxNetworkPingxxX/sensitivity/main/手机端调节灵敏度脚本"))()
    end
})

MainTab:Button({
    Title = "祖国人飞行",
    Desc = "中国人能飞🤔🤔队友镭射关一下🤫",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/GioBolqv1/homelander-by-GioBolqv1-/refs/heads/main/homelander.lua"))()
    end
})

MainTab:Button({
    Title = "自瞄",
    Desc = "不大好用👁",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/Mark22028-2ndAcc/Scripts/refs/heads/main/OPCamlock.lua"))()
    end
})

MainTab:Button({
    Title = "飞踢R15",
    Desc = "不是怎么老倍踢啊😭",
    Callback = function()
        loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-Fe-DropKick-Script-165813"))()
    end
})

MainTab:Button({
    Title = "隐身",
    Desc = "小心拉回💀👍",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/XxxNetworkPingxxX/lnvisible/main/that's%20great"))()
    end
})

MainTab:Button({
    Title = "FE超强重力",
    Desc = "👍",
    Callback = function()
        loadstring(game:HttpGet("https://pastebin.com/raw/CZnp0N45"))()
    end
})

MainTab:Button({
    Title = "冻结物体",
    Desc = "克一切(？能操控物体的脚本💀",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/XxxNetworkPingxxX/Roblox/main/Frozenobjects"))()
    end
})

MainTab:Button({
    Title = "视角锁",
    Desc = "👍",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/XxxNetworkPingxxX/Roblox/main/ShiftLock"))()
    end
})

MainTab:Button({
    Title = "IY指令脚本",
    Desc = "不懂英文的有福了🗣",
    Callback = function()
        loadstring(game:HttpGet('https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source'))()
    end
})

MainTab:Paragraph({
    Title = "dex",
    Desc = "用IY指令脚本输入dex即可"
})

MainTab:Button({
    Title = "ERROR-404-NOT-FOUND",
    Desc = "ERROR-404-NOT-FOUND",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/XxxNetworkPingxxX/WHAT/main/WHISTLE"))()
    end
})

ESPTab:Section({ Title = "由于显示文字和追踪线用的是Drawing库" })
ESPTab:Section({ Title = "部分注入器可能无法显示" })

local highlightEnabled = false
local highlightFillColor = Color3.fromRGB(255, 0, 0)
local highlightOutlineColor = Color3.fromRGB(255, 255, 255)
local highlightFillTransparency = 0.5
local highlightOutlineTransparency = 0
local highlightInstances = {}
local highlightPlayerConns = {}
local highlightPlayerAddedConn = nil
local renderConn = nil

local showName = true
local showDistance = true
local showHealth = true
local showTracer = false
local tracerColor = Color3.fromRGB(255, 255, 255)
local tracerTransparency = 0.5

local PlayerinformationDropdown = ESPTab:Dropdown({
    Title = "高亮显示内容",
    Values = { "名称", "距离", "血量", "追踪线" },
    Value = { "名称", "距离", "血量" },
    Multi = true,
    AllowNone = true,
    Callback = function(option)
        showName = false
        showDistance = false
        showHealth = false
        showTracer = false
        for _, v in pairs(option) do
            if v == "名称" then showName = true end
            if v == "距离" then showDistance = true end
            if v == "血量" then showHealth = true end
            if v == "追踪线" then showTracer = true end
        end
    end
})

local drawObjects = {}

local function clearAllDrawings()
    for _, data in pairs(drawObjects) do
        pcall(function()
            if data.nameText then data.nameText:Remove() end
            if data.distText then data.distText:Remove() end
            if data.healthText then data.healthText:Remove() end
            if data.tracer then data.tracer:Remove() end
        end)
    end
    drawObjects = {}
end

local function clearAllHighlights()
    for _, h in pairs(highlightInstances) do
        pcall(function() h:Destroy() end)
    end
    highlightInstances = {}
end

local function addHighlightToCharacter(character)
    if not character or character == player.Character then return end
    local highlight = Instance.new("Highlight")
    highlight.FillColor = highlightFillColor
    highlight.FillTransparency = highlightFillTransparency
    highlight.OutlineColor = highlightOutlineColor
    highlight.OutlineTransparency = highlightOutlineTransparency
    highlight.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
    highlight.Parent = character
    table.insert(highlightInstances, highlight)
end

local function refreshAllHighlights()
    clearAllHighlights()
    if not highlightEnabled then return end
    for _, p in pairs(game.Players:GetPlayers()) do
        if p ~= player and p.Character then
            addHighlightToCharacter(p.Character)
        end
    end
end

local function startRender()
    if renderConn then renderConn:Disconnect() end
    renderConn = game:GetService("RunService").RenderStepped:Connect(function()
        if not highlightEnabled then return end
        
        local camera = workspace.CurrentCamera
        if not camera then return end
        
        local myRoot = player.Character and player.Character:FindFirstChild("HumanoidRootPart")
        local myPos = myRoot and myRoot.Position or Vector3.new(0, 0, 0)
        local viewportHeight = camera.ViewportSize.Y
        local viewportWidth = camera.ViewportSize.X
        
        for plr, data in pairs(drawObjects) do
            if not plr or not plr.Parent then
                pcall(function()
                    if data.nameText then data.nameText:Remove() end
                    if data.distText then data.distText:Remove() end
                    if data.healthText then data.healthText:Remove() end
                    if data.tracer then data.tracer:Remove() end
                end)
                drawObjects[plr] = nil
            end
        end
        
        for _, plr in pairs(game.Players:GetPlayers()) do
            if plr ~= player and plr.Character then
                local rootPart = plr.Character:FindFirstChild("HumanoidRootPart") or plr.Character:FindFirstChild("Head")
                if rootPart then
                    local screenPos, onScreen = camera:WorldToViewportPoint(rootPart.Position)
                    if onScreen then
                        local dist = (rootPart.Position - myPos).Magnitude
                        local scale = math.clamp(80 / dist, 0.3, 1.2)
                        
                        local humanoid = plr.Character:FindFirstChild("Humanoid")
                        local showHealthText = false
                        local healthTextStr = ""
                        local healthColor = Color3.fromRGB(0, 255, 0)
                        
                        if humanoid then
                            local curHp = math.floor(humanoid.Health)
                            local maxHp = humanoid.MaxHealth
                            local hpPercent = curHp / maxHp
                            healthTextStr = curHp .. "/" .. maxHp
                            showHealthText = true
                            
                            if hpPercent > 0.6 then
                                healthColor = Color3.fromRGB(0, 255, 0)
                            elseif hpPercent > 0.3 then
                                healthColor = Color3.fromRGB(255, 255, 0)
                            else
                                healthColor = Color3.fromRGB(255, 0, 0)
                            end
                        end
                        
                        local data = drawObjects[plr]
                        if not data then
                            local nameText = Drawing.new("Text")
                            nameText.Center = true
                            nameText.Color = Color3.fromRGB(255, 255, 255)
                            nameText.Size = 14
                            nameText.Outline = true
                            
                            local distText = Drawing.new("Text")
                            distText.Center = true
                            distText.Color = Color3.fromRGB(200, 200, 200)
                            distText.Size = 12
                            distText.Outline = true
                            
                            local healthText = Drawing.new("Text")
                            healthText.Center = true
                            healthText.Color = healthColor
                            healthText.Size = 12
                            healthText.Outline = true
                            
                            local tracer = Drawing.new("Line")
                            tracer.Thickness = 2
                            tracer.Color = tracerColor
                            tracer.Transparency = tracerTransparency
                            
                            drawObjects[plr] = {nameText = nameText, distText = distText, healthText = healthText, tracer = tracer}
                            data = drawObjects[plr]
                        end
                        
                        if showHealth and showHealthText then
                            data.healthText.Text = healthTextStr
                            data.healthText.Color = healthColor
                        end
                        
                        local nameY = screenPos.Y - 35 * scale
                        local distY = screenPos.Y + 30 * scale
                        local healthY = screenPos.Y + 50 * scale
                        
                        if showName then
                            data.nameText.Visible = true
                            data.nameText.Text = plr.Name
                            data.nameText.Position = Vector2.new(screenPos.X, nameY)
                        else
                            data.nameText.Visible = false
                        end
                        
                        if showDistance then
                            data.distText.Visible = true
                            data.distText.Text = string.format("%.1f m", dist)
                            data.distText.Position = Vector2.new(screenPos.X, distY)
                        else
                            data.distText.Visible = false
                        end
                        
                        if showHealth and showHealthText then
                            data.healthText.Visible = true
                            data.healthText.Position = Vector2.new(screenPos.X, healthY)
                        else
                            if data.healthText then data.healthText.Visible = false end
                        end
                        
                        if showTracer then
                            local currentPos = "中"
                            if TracerPositionDropdown and TracerPositionDropdown.Value then
                                currentPos = TracerPositionDropdown.Value[1]
                            end
                            
                            local tracerStartY = viewportHeight / 2
                            if currentPos == "上" then
                                tracerStartY = 0
                            elseif currentPos == "下" then
                                tracerStartY = viewportHeight
                            else
                                tracerStartY = viewportHeight / 2
                            end
                            
                            data.tracer.From = Vector2.new(viewportWidth / 2, tracerStartY)
                            data.tracer.To = Vector2.new(screenPos.X, screenPos.Y)
                            data.tracer.Visible = true
                            data.tracer.Color = tracerColor
                            data.tracer.Transparency = tracerTransparency
                        else
                            if data.tracer then data.tracer.Visible = false end
                        end
                    else
                        local data = drawObjects[plr]
                        if data then
                            if data.nameText then data.nameText.Visible = false end
                            if data.distText then data.distText.Visible = false end
                            if data.healthText then data.healthText.Visible = false end
                            if data.tracer then data.tracer.Visible = false end
                        end
                    end
                end
            end
        end
    end)
end

local function setupPlayerListener(p)
    if p == player then return end
    local conn = p.CharacterAdded:Connect(function(char)
        task.wait(0.5)
        if highlightEnabled then
            addHighlightToCharacter(char)
        end
    end)
    highlightPlayerConns[p] = conn
end

local HighlightToggle = ESPTab:Toggle({
    Title = "高亮玩家",
    Type = "Checkbox",
    Value = false,
    Callback = function(state)
        highlightEnabled = state
        if state then
            refreshAllHighlights()
            startRender()
            for _, p in pairs(game.Players:GetPlayers()) do
                setupPlayerListener(p)
            end
            highlightPlayerAddedConn = game.Players.PlayerAdded:Connect(function(p)
                setupPlayerListener(p)
                task.wait(0.5)
                if highlightEnabled and p.Character then
                    addHighlightToCharacter(p.Character)
                end
            end)
        else
            clearAllHighlights()
            clearAllDrawings()
            if renderConn then renderConn:Disconnect() end
            for _, conn in pairs(highlightPlayerConns) do
                pcall(function() conn:Disconnect() end)
            end
            highlightPlayerConns = {}
            if highlightPlayerAddedConn then
                highlightPlayerAddedConn:Disconnect()
                highlightPlayerAddedConn = nil
            end
        end
    end
})

local HighlightFillColorPicker = ESPTab:Colorpicker({
    Title = "填充颜色",
    Value = Color3.fromRGB(255, 0, 0),
    Callback = function(color)
        highlightFillColor = color
        if highlightEnabled then refreshAllHighlights() end
    end
})

local HighlightOutlineColorPicker = ESPTab:Colorpicker({
    Title = "描边颜色",
    Value = Color3.fromRGB(255, 255, 255),
    Callback = function(color)
        highlightOutlineColor = color
        if highlightEnabled then refreshAllHighlights() end
    end
})

local TracerColorPicker = ESPTab:Colorpicker({
    Title = "追踪线颜色",
    Value = Color3.fromRGB(255, 255, 255),
    Callback = function(color)
        tracerColor = color
        for _, data in pairs(drawObjects) do
            if data.tracer then data.tracer.Color = tracerColor end
        end
    end
})

local HighlightFillSlider = ESPTab:Slider({
    Title = "填充透明度",
    Step = 1,
    Value = { Min = 0, Max = 100, Default = 50 },
    Callback = function(value)
        highlightFillTransparency = value / 100
        if highlightEnabled then refreshAllHighlights() end
    end
})

local HighlightOutlineSlider = ESPTab:Slider({
    Title = "描边透明度",
    Step = 1,
    Value = { Min = 0, Max = 100, Default = 0 },
    Callback = function(value)
        highlightOutlineTransparency = value / 100
        if highlightEnabled then refreshAllHighlights() end
    end
})

local TracerTransparencySlider = ESPTab:Slider({
    Title = "追踪线透明度",
    Step = 1,
    Value = { Min = 0, Max = 100, Default = 50 },
    Callback = function(value)
        tracerTransparency = (100 - value) / 100
        for _, data in pairs(drawObjects) do
            if data.tracer then data.tracer.Transparency = tracerTransparency end
        end
    end
})

MoneyTab:Button({
    Title = "10R",
    Desc = "🤑🤑🤑",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/XxxNetworkPingxxX/error/main/error"))()
    end
})

MoneyTab:Button({
    Title = "100R",
    Desc = "🤑🤑🤑",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/XxxNetworkPingxxX/error/main/error"))()
    end
})

MoneyTab:Button({
    Title = "1000R",
    Desc = "🤑🤑🤑",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/XxxNetworkPingxxX/error/main/error"))()
    end
})

MoneyTab:Button({
    Title = "10000R",
    Desc = "🤑🤑🤑",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/XxxNetworkPingxxX/error/main/error"))()
    end
})

MoneyTab:Button({
    Title = "10000000R",
    Desc = "🤑🤑🤑",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/XxxNetworkPingxxX/error/main/error"))()
    end
})

MoneyTab:Button({
    Title = "Inf R",
    Desc = "🤑🤑🤑",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/XxxNetworkPingxxX/error/main/error"))()
    end
})

MoneyTab:Section({ Title = "服务器" })

MoneyTab:Button({
    Title = "获得管理员",
    Desc = "😍😍😍",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/XxxNetworkPingxxX/error/main/error"))()
    end
})

MoneyTab:Button({
    Title = "踢出所有人",
    Desc = "😍😍😍",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/XxxNetworkPingxxX/error/main/error"))()
    end
})

MoneyTab:Button({
    Title = "获得服务器所有者权限",
    Desc = "😍😍😍",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/XxxNetworkPingxxX/error/main/error"))()
    end
})

FeTab:Section({ Title = "R15" })

FeTab:Button({
    Title = "🦌",
    Desc = "😍",
    Callback = function()
        loadstring(game:HttpGet("https://pastefy.app/YZoglOyJ/raw"))()
    end
})

FeTab:Button({
    Title = "FE动作",
    Desc = "伪装氪金大佬中......",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/7yd7/Hub/refs/heads/Branch/GUIS/Emotes.lua"))()
    end
})

FeTab:Button({
    Title = "变成汽车",
    Desc = "F1赛车...人？！",
    Callback = function()
        loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-FE-SILLY-CAR-V1-48227"))()
    end
})

FeTab:Section({ Title = "R6" })

FeTab:Button({
    Title = "🦌",
    Desc = "😍",
    Callback = function()
        loadstring(game:HttpGet("https://pastefy.app/wa3v2Vgm/raw"))()
    end
})

FeTab:Button({
    Title = "舞蹈(音乐和特效均不可见)",
    Desc = "光放个音乐给自己听了💀",
    Callback = function()
        loadstring(game:HttpGet("https://rawscripts.net/raw/SCP-Games-and-SCP-Monsters-Epic-dance-r6-93460"))()
    end
})

FeTab:Button({
    Title = "更多的动作",
    Desc = "R6不让跳舞😡",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/p0e1/1/refs/heads/main/Fe%20R6%20Animation"))()
    end
})

DoorsTab:Button({
    Title = "夜视仪",
    Desc = "浪费时间是死亡的关键🤓",
    Callback = function()
        loadstring(game:HttpGet("https://pastebin.com/raw/4Vsv1Xwn"))()
    end
})

DoorsTab:Button({
    Title = "橡皮手电筒",
    Desc = "吵闹是遮盖声音的作用🤓",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/K0t1n/Public/main/Gummy%20Flashlight.lua"))()
    end
})

DoorsTab:Button({
    Title = "蜡烛",
    Desc = "🤔",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/ChronoAccelerator/Public-Scripts/main/Items/Candle.lua"))()
    end
})

DoorsTab:Button({
    Title = "硬核Beta",
    Desc = "怎么幸掉这么多模式啊😭",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/Focuslol666/RbxScripts/refs/heads/main/DOORS/Fixed_Hardcore/Loader.lua"))()
    end
})

DoorsTab:Button({
    Title = "msdoors",
    Desc = "不给于评价",
    Callback = function()
        loadstring(game:HttpGet("https://www.msdoors.xyz/script"))()
    end
})

DoorsTab:Button({
    Title = "XK HUB(Doors)",
    Desc = "🤔",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/DevSloPo/Main/refs/heads/main/DOORS"))()
    end
})

DoorsTab:Button({
    Title = "XA HUB(Doors)",
    Desc = "💀",
    Callback = function()
        loadstring(game:HttpGet("\104\116\116\112\115\58\47\47\112\97\115\116\101\98\105\110\46\99\111\109\47\114\97\119\47\54\53\84\119\84\56\106\97"))()
    end
})

DoorsTab:Button({
    Title = "自动A1000",
    Desc = "依旧残疾人💀(无恶意)",
    Callback = function()
        loadstring(game:HttpGet('https://pastebin.com/raw/wjNJccfz'))()
    end
})

DoorsTab:Button({
    Title = "mshax汉化",
    Desc = "上帝模式+跳跃会有一些问题",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/atnew2025/Chinese-scripts/refs/heads/main/mshax(prohax).txt"))()
    end
})

DoorsTab:Button({
    Title = "Orange Hub",
    Desc = "有时候没反应，但是绕过是真的强👍",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/TheHunterSolo1/OrangeHub/refs/heads/main/Rehax.luau"))()
    end
})

DoorsTab:Button({
    Title = "NullFire",
    Desc = "太冷门了也不好用",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/TeamNullFire/NullFire/main/loader.lua"))()
    end
})

DoorsTab:Button({
    Title = "Mspaint",
    Desc = "真神💀👍",
    Callback = function()
        loadstring(game:HttpGet("https://api.luarmor.net/files/v3/loaders/002c19202c9946e6047b0c6e0ad51f84.lua"))()
    end
})

DoorsTab:Button({
    Title = "刷死亡",
    Desc = "刷这东西干什么👁",
    Callback = function()
        loadstring(game:HttpGet("https://raw.msdoors.xyz/deathfarm"))()
    end
})

BuildTab:Button({
    Title = "特别好用的一个脚本",
    Desc = "好用😋👍",
    Callback = function()
        loadstring(game:HttpGet('https://raw.githubusercontent.com/TheRealAsu/BABFT/refs/heads/main/Loader.lua'))()
    end
})

BuildTab:Button({
    Title = "BH",
    Desc = "在这里输入文本",
    Callback = function()
        loadstring(game:HttpGet("https://raw[doge].githubusercontent.com/kode-sec/Butter/refs/heads/main/main.lua"))()
    end
})

OutTab:Button({
    Title = "脚本",
    Desc = "🗣",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/RobloxScriptBlox/Script/refs/heads/main/Knockout"))()
    end
})

FloodTab:Button({
    Title = "无敌",
    Desc = "跳一下就炸了🗣",
    Callback = function()
        loadstring(game:HttpGet("https://api.luarmor.net/files/v4/loaders/2a5ddc7c8e8a9dae47982f38c72fda82.lua"))()
    end
})

GoldTab:Button({
    Title = "CK",
    Desc = "可以的👍就是有点卡👁",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/DevSloPo/Main/refs/heads/main/Game/DesperadoExpress"))()
    end
})

GoldTab:Button({
    Title = "刷钱",
    Desc = "不给予评价🗣",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/SNSDARK/Scripts/refs/heads/main/Deadly%20Delivery.lua"))()
    end
})

DrawTab:Button({
    Title = "导图",
    Desc = "一想到有人会拿这玩意干什么我就想笑😇",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/ke9460394-dot/ugik/refs/heads/main/KENNY画我.lua"))()
    end
})

CarTab:Button({
    Title = "获取神秘徽章",
    Desc = "🧐",
    Callback = function()
        loadstring(game:HttpGet("https://rawscripts.net/raw/cart-ride-around-nothing-FREE-BADGE-AND-CART-42116"))()
    end
})

CarTab:Button({
    Title = "车轮磁铁",
    Desc = "800个弯都甩不下去🤫",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/XxxNetworkPingxxX/cart-ride-around-nothing/main/根深蒂固"))()
    end
})

ForestTab:Section({ Title = "可能过于老用不了" })
ForestTab:Button({
    Title = "不知道",
    Desc = "反正我的身材很曼妙🤓",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/Xingtaiduan/Script/refs/heads/main/Games/森林中的99夜.lua"))()
    end
})

ForestTab:Button({
    Title = "自动钻石",
    Desc = "🧐",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/Rezexis/Main-Lua/refs/heads/main/Loader.lua"))()
    end
})

local antiFallEnabled = false
local antiFallConn = nil
local antiFallCharConn = nil
local z = Vector3.zero

local function applyAntiFall(character)
    if not character or not antiFallEnabled then return end
    
    local humanoidRootPart = character:FindFirstChild("HumanoidRootPart")
    if not humanoidRootPart then return end
    
    if antiFallConn then
        antiFallConn:Disconnect()
        antiFallConn = nil
    end
    
    antiFallConn = game:GetService("RunService").Heartbeat:Connect(function()
        if not antiFallEnabled then return end
        if not humanoidRootPart or not humanoidRootPart.Parent then
            if antiFallConn then
                antiFallConn:Disconnect()
                antiFallConn = nil
            end
            return
        end
        
        local velocity = humanoidRootPart.AssemblyLinearVelocity
        humanoidRootPart.AssemblyLinearVelocity = z
        game:GetService("RunService").RenderStepped:Wait()
        humanoidRootPart.AssemblyLinearVelocity = velocity
    end)
end

local function removeAntiFall()
    if antiFallConn then
        antiFallConn:Disconnect()
        antiFallConn = nil
    end
end

local AntiFallToggle = NdsTab:Toggle({
    Title = "免疫坠落伤害",
    Type = "Checkbox",
    Value = false,
    Callback = function(state)
        antiFallEnabled = state
        
        if state then
            if player.Character then
                applyAntiFall(player.Character)
            end
            
            if antiFallCharConn then
                antiFallCharConn:Disconnect()
            end
            antiFallCharConn = player.CharacterAdded:Connect(function(character)
                if antiFallEnabled then
                    applyAntiFall(character)
                end
            end)
        else
            removeAntiFall()
            if antiFallCharConn then
                antiFallCharConn:Disconnect()
                antiFallCharConn = nil
            end
        end
    end
})

NdsTab:Button({
    Title = "环绕V6",
    Desc = "依旧黑洞",
    Callback = function()
        loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-Super-ring-Parts-V6-28581"))()
    end
})



NdsTab:Button({
    Title = "零件反重力",
    Desc = "自己汉化的👽",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/XxxNetworkPingxxX/Gravity-Inversion-script/main/XxxNetworkPingxxX"))()
    end
})

NdsTab:Button({
    Title = "Noob All",
    Desc = "依旧卡服",
    Callback = function()
        loadstring(game:HttpGet("https://rawscripts.net/raw/Natural-Disaster-Survival-noob-all-110242"))()
    end
})

NdsTab:Button({
    Title = "零件破坏者",
    Desc = "防黑洞🤔好像又没用🤨",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/cytj777i/-/main/零件破坏者v2"))()
    end
})

ScriptsTab:Button({
    Title = "禁漫中心",
    Desc = "不",
    Callback = function()
        getgenv().LS = "禁漫中心"
        loadstring(game:HttpGet("https://raw.githubusercontent.com/dingding123hhh/ng/main/jmlllllllIIIIlllllII.lua"))()
    end
})

ScriptsTab:Button({
    Title = "XK Hub",
    Desc = "给",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/BINjiaobzx6/BINjiao/main/XK.lua"))()
    end
})

ScriptsTab:Button({
    Title = "落叶中心",
    Desc = "予",
    Callback = function()
        getgenv().LS = "落叶中心"
        loadstring(game:HttpGet("https://raw.githubusercontent.com/krlpl/Deciduous-center-LS/main/%E8%90%BD%E5%8F%B6%E4%B8%AD%E5%BF%83%E6%B7%B7%E6%B7%86.txt"))()
    end
})

ScriptsTab:Button({
    Title = "皮脚本",
    Desc = "评",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/xiaopi77/xiaopi77/main/QQ1002100032-Roblox-Pi-script.lua"))()
    end
})

ScriptsTab:Button({
    Title = "情云脚本",
    Desc = "价",
    Callback = function()
        loadstring(utf8.char((function() return table.unpack({108,111,97,100,115,116,114,105,110,103,40,103,97,109,101,58,72,116,116,112,71,101,116,40,34,104,116,116,112,115,58,47,47,114,97,119,46,103,105,116,104,117,98,117,115,101,114,99,111,110,116,101,110,116,46,99,111,109,47,67,104,105,110,97,81,89,47,45,47,109,97,105,110,47,37,69,54,37,56,53,37,56,51,37,69,52,37,66,65,37,57,49,34,41,41,40,41})end)()))()
    end
})

ScriptsTab:Button({
    Title = "XC脚本中心",
    Desc = "不给予评价",
    Callback = function()
        loadstring(game:HttpGet("\104\116\116\112\115\58\47\47\112\97\115\116\101\98\105\110\46\99\111\109\47\114\97\119\47\103\101\109\120\72\119\65\49"))()
    end
})

ScriptsTab:Button({
    Title = "BS黑洞中心",
    Desc = "最正确的👍",
    Callback = function()
        BS = "\104\116\116\112\115\58\47\47\103\105\116\101\101\46\99\111\109\47\66\83\95\115\99\114\105\112\116\47\115\99\114\105\112\116\47\114\97\119\47\109\97\115\116\101\114\47\66\83\95\83\99\114\105\112\116\46\76\117\97\117"
        loadstring(game:HttpGet(BS))()
    end
})

BackdoorTab:Button({
    Title = "backdoor.exe",
    Desc = "纯娱乐💀常规服务器能有后门就怪了🗣",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/iK4oS/backdoor.exe/v6x/source.lua"))()
    end
})

BackdoorTab:Button({
    Title = "A6C",
    Desc = "能留下A6C音乐漏洞的也是神人🤫",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/Roblox-HttpSpy/my-Garbage/refs/heads/main/FeMusicExploit.lua"))()
    end
})

BackdoorTab:Button({
    Title = "免费购买物品",
    Desc = "漏洞名称太长不想打💀部服务器能用",
    Callback = function()
        getgenv().Settings = {
            CopyButton = false,
            -------------------
            AutoButton = false,
            AutoInterval = 0.1,
            -------------------
            InstantPurchase = false,
            AutoMassPurchase = false,
            Debug = false,
        }

        loadstring(game:HttpGet("https://raw.githubusercontent.com/7yd7/FreeGamepass/main/Script.luau"))()
    end
})

DiscordTab:Button({
    Title = "加入DC🤓",
    Desc = "https://discord.gg/DztxbBJb7q",
    Callback = function()
        setclipboard("https://discord.gg/DztxbBJb7q")
        WindUI:Notify({
            Title = "已复制",
            Content = "DC链接已复制",
            Duration = 2,
            Icon = "solar:check-circle-outline"
        })
    end
})

DiscordTab:Button({
    Title = "加入Q群🤓",
    Desc = "883146290",
    Callback = function()
        setclipboard("883146290")
        WindUI:Notify({
            Title = "已复制",
            Content = "QQ群号已复制",
            Duration = 2,
            Icon = "solar:check-circle-outline"
        })
    end
})

player.CharacterAdded:Connect(function(char)
    char:WaitForChild("Humanoid")
    task.wait(0.2)
    originalSpeed = nil
    originalJump = nil
    applySpeed()
    applyJump()
    if highlightEnabled then applyHighlights() end
end)

WindUI:Notify({
    Title = "SV Hub",
    Content = "加载成功",
    Duration = 3,
    Icon = "solar:check-circle-outline"
})