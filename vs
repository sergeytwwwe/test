return function(VisualTab)
    assert(VisualTab, "Передайте VisualTab при вызове visual.lua!")

    -- === SETTINGS ===
    local espSettings = {
        enabled = false,
        box = false,
        boxtype = "Default",
        boxColor = Color3.new(1, 1, 1),
        name = false,
        nameColor = Color3.new(1, 1, 1),
        weapon = false,
        weaponColor = Color3.new(1, 1, 1),
        distance = false,
        distanceColor = Color3.new(1, 1, 1),
        maxDistance = 5000,
        sleepcheck = false,
        aicheck = false
    }
    local offscreenSettings = {
        enabled = false,
        arrow = false,
        name = false,
        weapon = false,
        distance = false,
        arrowColor = Color3.fromRGB(255,255,255),
        nameColor = Color3.new(1, 1, 1),
        weaponColor = Color3.new(1, 1, 1),
        distanceColor = Color3.new(1, 1, 1),
        circleRadius = 140,
        arrowSize = 10,
        textSize = 14,
        maxDist = 1500,
        sleepcheck = false,
        aicheck = false
    }
    local objectEspSettings = {
        enabled = false,
        name = false,
        distance = false,
        maxDistance = 1500,
        corpse = {enabled = true, color = Color3.fromRGB(255,255,255)},
        dropped = {enabled = true, color = Color3.fromRGB(255,255,255)},
        atv = {enabled = true, color = Color3.fromRGB(255,255,255)},
        stone = {enabled = true, color = Color3.fromRGB(255,255,255)},
        nitrate = {enabled = true, color = Color3.fromRGB(255,255,255)},
        iron = {enabled = true, color = Color3.fromRGB(255,255,255)},
        copter = {enabled = false, color = Color3.fromRGB(255,255,255)},
        car = {enabled = false, color = Color3.fromRGB(255,255,255)}
    }
    local safeZoneChamsSettings = {
        enabled = false,
        transparency = 75,
        color = Color3.fromRGB(255, 0, 0)
    }
    local outlineColor = Color3.fromRGB(0,0,0)
    local chamsSettings = {
        hand = false,
        handColor = Color3.new(1, 1, 1),
        handOutlineColor = Color3.new(1,1,1),
        handMat = "ForceField",
        item = false,
        itemColor = Color3.new(1, 1, 1),
        itemOutlineColor = Color3.new(1,1,1),
        itemMat = "ForceField"
    }
    local traceSettings = {
        enabled = false,
        color = Color3.new(1, 1, 1),
        mode = "Legit"
    }
    local logSettings = {
        enabled = false,
        types = { ["Kill log"] = true, ["Hit log"] = true }
    }
    local hitSoundSettings = {
        enabled = false,
        soundType = "Rust"
    }
    local worldVisuals = {
        noGrass = false,
        noLeaves = false,
        clouds = true,
        cloudsColor = Color3.fromRGB(255,255,255),
        ambient = Color3.fromRGB(255,255,255),
        ambientEnabled = false,
        alwaysDay = false,
        removeFog = false,
        skybox = "Default"
    }

    -- Только рабочие Skybox (обновлённый список, новые id)
    local skyboxes = {
        ["Default"] = { -- Roblox стандартный skybox
            SkyboxBk = "rbxassetid://401664839",
            SkyboxDn = "rbxassetid://401664862",
            SkyboxFt = "rbxassetid://401664936",
            SkyboxLf = "rbxassetid://401664881",
            SkyboxRt = "rbxassetid://401664929",
            SkyboxUp = "rbxassetid://401664883"
        },
        ["Delta"] = {
            SkyboxBk = "rbxassetid://117012443612361",
            SkyboxDn = "rbxassetid://117012443612361",
            SkyboxFt = "rbxassetid://117012443612361",
            SkyboxLf = "rbxassetid://117012443612361",
            SkyboxRt = "rbxassetid://117012443612361",
            SkyboxUp = "rbxassetid://117012443612361"
        },
        ["Black"] = {
            SkyboxBk = "rbxassetid://8222365457",
            SkyboxDn = "rbxassetid://8222365457",
            SkyboxFt = "rbxassetid://8222365457",
            SkyboxLf = "rbxassetid://8222365457",
            SkyboxRt = "rbxassetid://8222365457",
            SkyboxUp = "rbxassetid://8222365457"
        },
        ["TrollFace"] = {
            SkyboxBk = "rbxassetid://103891272942638",
            SkyboxDn = "rbxassetid://103891272942638",
            SkyboxFt = "rbxassetid://103891272942638",
            SkyboxLf = "rbxassetid://103891272942638",
            SkyboxRt = "rbxassetid://103891272942638",
            SkyboxUp = "rbxassetid://103891272942638"
        },
        ["Purple"] = {
            SkyboxBk = "rbxassetid://6807694157",
            SkyboxDn = "rbxassetid://6807694157",
            SkyboxFt = "rbxassetid://6807694157",
            SkyboxLf = "rbxassetid://6807694157",
            SkyboxRt = "rbxassetid://6807694157",
            SkyboxUp = "rbxassetid://6807694157"
        },
        ["Skeleton"] = {
            SkyboxBk = "rbxassetid://10180536577",
            SkyboxDn = "rbxassetid://10180536577",
            SkyboxFt = "rbxassetid://10180536577",
            SkyboxLf = "rbxassetid://10180536577",
            SkyboxRt = "rbxassetid://10180536577",
            SkyboxUp = "rbxassetid://10180536577"
        },
        ["Spooky scary"] = {
            SkyboxBk = "rbxassetid://12075892911",
            SkyboxDn = "rbxassetid://12075892911",
            SkyboxFt = "rbxassetid://12075892911",
            SkyboxLf = "rbxassetid://12075892911",
            SkyboxRt = "rbxassetid://12075892911",
            SkyboxUp = "rbxassetid://12075892911"
        },
        ["Night"] = {
            SkyboxBk = "rbxassetid://6489194051",
            SkyboxDn = "rbxassetid://6489194051",
            SkyboxFt = "rbxassetid://6489194051",
            SkyboxLf = "rbxassetid://6489194051",
            SkyboxRt = "rbxassetid://6489194051",
            SkyboxUp = "rbxassetid://6489194051"
        },
        ["SpongeBob Sad"] = {
            SkyboxBk = "rbxassetid://10729455634",
            SkyboxDn = "rbxassetid://10729455634",
            SkyboxFt = "rbxassetid://10729455634",
            SkyboxLf = "rbxassetid://10729455634",
            SkyboxRt = "rbxassetid://10729455634",
            SkyboxUp = "rbxassetid://10729455634"
        },
        ["Bikini Bottom"] = { -- Новый id!
            SkyboxBk = "rbxassetid://16631601462",
            SkyboxDn = "rbxassetid://16631601462",
            SkyboxFt = "rbxassetid://16631601462",
            SkyboxLf = "rbxassetid://16631601462",
            SkyboxRt = "rbxassetid://16631601462",
            SkyboxUp = "rbxassetid://16631601462"
        }
    }

    -- === HIT SOUND LOGIC ===
    local hitSoundList = {
        "PlayerHit",
        "PlayerHit2",
        "PlayerHit2_Muffled",
        "PlayerHitHeadshot",
        "PlayerHitHeadshot_Muffled",
        "PlayerHit_Muffled"
    }
    local hitSoundIds = {
        ["Rust"] = "rbxassetid://18805676593",
        ["Skeet"] = "rbxassetid://83717596220569",
        ["Sonic"] = "rbxassetid://6817149233",
        ["Sonic Checkpoint"] = "rbxassetid://6817150445",
        ["Oof"] = "rbxassetid://79348298352567",
        ["Windows XP Error"] = "rbxassetid://9066167010",
        ["Punch"] = "rbxassetid://9117969687",
        ["Buble"] = "rbxassetid://9114176282",
        ["byebye"] = "rbxassetid://70888261086432",
        ["cowbell"] = "rbxassetid://99351661703869"
    }
    local originalHitSoundIds = {}
    local soundService = game:GetService("SoundService")
    local function updateHitSounds()
        local assetId = hitSoundIds[hitSoundSettings.soundType] or hitSoundIds["Rust"]
        for _, name in ipairs(hitSoundList) do
            local sound = soundService:FindFirstChild(name)
            if sound and sound:IsA("Sound") then
                if hitSoundSettings.enabled and assetId then
                    if not originalHitSoundIds[name] then
                        originalHitSoundIds[name] = sound.SoundId
                    end
                    sound.SoundId = assetId
                    sound.Volume = 1
                else
                    if originalHitSoundIds[name] then
                        sound.SoundId = originalHitSoundIds[name]
                        originalHitSoundIds[name] = nil
                    end
                end
            end
        end
    end
    game:GetService("RunService").RenderStepped:Connect(updateHitSounds)

    -- === SKYBOX LOGIC ===
    local Lighting = game:GetService("Lighting")
    local function setSkybox(name)
        for _,v in pairs(Lighting:GetChildren()) do
            if v:IsA("Sky") then v:Destroy() end
        end
        local sb = skyboxes[name]
        if sb then
            local sky = Instance.new("Sky")
            sky.SkyboxBk = sb.SkyboxBk
            sky.SkyboxDn = sb.SkyboxDn
            sky.SkyboxFt = sb.SkyboxFt
            sky.SkyboxLf = sb.SkyboxLf
            sky.SkyboxRt = sb.SkyboxRt
            sky.SkyboxUp = sb.SkyboxUp
            sky.Parent = Lighting
        end
    end

    -- === UI ===
    local EspBox = VisualTab:AddLeftGroupbox("ESP", "box")
    local ObjectEspBox = VisualTab:AddLeftGroupbox("Object ESP", "cube", {Bottom=true})
    local OffscreenEspBox = VisualTab:AddLeftGroupbox("Offscreen ESP", "eye")
    local ChamsBox = VisualTab:AddRightGroupbox("Chams", "wand")
    local WorldBox = VisualTab:AddRightGroupbox("World", "globe")
    local SafeZoneBox = VisualTab:AddRightGroupbox("Safe zone", "shield", {Bottom=true})

    -- === CHAMS UI (исправленный) ===
    -- HAND CHAMS
    local handOutlineColorPicker
    local handChamsToggle = ChamsBox:AddToggle("HandChams", {
        Text = "Hand Chams",
        Default = chamsSettings.hand,
        Callback = function(val)
            chamsSettings.hand = val
        end
    })
    local handColorPicker = handChamsToggle:AddColorPicker("HandChamsColor", {
        Default = chamsSettings.handColor,
        Callback = function(val)
            chamsSettings.handColor = val
        end
    })
    handOutlineColorPicker = handChamsToggle:AddColorPicker("HandChamsOutlineColor", {
        Default = chamsSettings.handOutlineColor,
        Text = "Hand Outline Color",
        Callback = function(color)
            chamsSettings.handOutlineColor = color
        end
    })
    handOutlineColorPicker:SetVisible(chamsSettings.handMat == "Chams")

    local handMatDropdown = ChamsBox:AddDropdown("HandChamsMat", {
        Values = {"ForceField", "Neon", "Chams"},
        Default = chamsSettings.handMat,
        Text = "Hand Material",
        Callback = function(val)
            chamsSettings.handMat = val
            handOutlineColorPicker:SetVisible(val == "Chams")
        end
    })

    -- ITEM CHAMS
    local itemOutlineColorPicker
    local itemChamsToggle = ChamsBox:AddToggle("ItemChams", {
        Text = "Item Chams",
        Default = chamsSettings.item,
        Callback = function(val)
            chamsSettings.item = val
        end
    })
    local itemColorPicker = itemChamsToggle:AddColorPicker("ItemChamsColor", {
        Default = chamsSettings.itemColor,
        Callback = function(val)
            chamsSettings.itemColor = val
        end
    })
    itemOutlineColorPicker = itemChamsToggle:AddColorPicker("ItemChamsOutlineColor", {
        Default = chamsSettings.itemOutlineColor,
        Text = "Item Outline Color",
        Callback = function(color)
            chamsSettings.itemOutlineColor = color
        end
    })
    itemOutlineColorPicker:SetVisible(chamsSettings.itemMat == "Chams")

    local itemMatDropdown = ChamsBox:AddDropdown("ItemChamsMat", {
        Values = {"ForceField", "Neon", "Chams"},
        Default = chamsSettings.itemMat,
        Text = "Item Material",
        Callback = function(val)
            chamsSettings.itemMat = val
            itemOutlineColorPicker:SetVisible(val == "Chams")
        end
    })

    -- SAFE ZONE CHAMS UI
    local szChamsToggle = SafeZoneBox:AddToggle("SafeZoneChams",{Text="Safe zone chams",Default=safeZoneChamsSettings.enabled,Callback=function(val)safeZoneChamsSettings.enabled=val end})
    szChamsToggle:AddColorPicker("SafeZoneChamsColor",{Default=safeZoneChamsSettings.color,Callback=function(val)safeZoneChamsSettings.color=val end})
    SafeZoneBox:AddSlider("SafeZoneChamsTransparency",{Text="Transparency",Default=safeZoneChamsSettings.transparency,Min=1,Max=100,Rounding=0,Callback=function(val)safeZoneChamsSettings.transparency=val end})

    -- World UI (colorpickers внутри чекбоксов)
    WorldBox:AddLabel("Map Visuals")
    local grassToggle = WorldBox:AddToggle("NoGrass",{Text="No Grass",Default=worldVisuals.noGrass,Callback=function(val)worldVisuals.noGrass=val end})
    local leavesToggle = WorldBox:AddToggle("NoLeaves",{Text="No Leaves",Default=worldVisuals.noLeaves,Callback=function(val)worldVisuals.noLeaves=val end})
    local cloudsToggle = WorldBox:AddToggle("Clouds",{Text="Clouds",Default=worldVisuals.clouds,Callback=function(val)worldVisuals.clouds=val end})
    local cloudsColorPicker = cloudsToggle:AddColorPicker("CloudsColor",{Default=worldVisuals.cloudsColor,Callback=function(val)worldVisuals.cloudsColor=val end})
    local ambientToggle = WorldBox:AddToggle("Ambient",{Text="Ambient",Default=worldVisuals.ambientEnabled,Callback=function(val)worldVisuals.ambientEnabled=val end})
    local ambientColorPicker = ambientToggle:AddColorPicker("AmbientColor",{Default=worldVisuals.ambient,Callback=function(val)worldVisuals.ambient=val end})
    local alwaysDayToggle = WorldBox:AddToggle("AlwaysDay",{Text="Always Day",Default=worldVisuals.alwaysDay,Callback=function(val)worldVisuals.alwaysDay=val end})
    local removeFogToggle = WorldBox:AddToggle("RemoveFog",{Text="Remove Fog",Default=worldVisuals.removeFog,Callback=function(val)worldVisuals.removeFog=val end})
    WorldBox:AddDropdown("SkyboxSelect",{
        Text="Skybox",
        Values={"Default","Delta","Black","TrollFace","Purple","Skeleton","Spooky scary","Night","SpongeBob Sad","Bikini Bottom"},
        Default="Default",
        Callback=function(val) worldVisuals.skybox=val; setSkybox(val) end
    })
    WorldBox:AddToggle("BulletTrace",{Text="Bullet Trace",Default=false,Callback=function(val)traceSettings.enabled=val end}):AddColorPicker("BulletTraceColor",{Default=Color3.new(0,0.4,1),Title="Bullet Trace Color",Callback=function(val)traceSettings.color=val end})
    WorldBox:AddDropdown("BulletTraceMode",{Values={"Legit","Neon"},Default="Legit",Text="Bullet Trace Mode",Callback=function(val)traceSettings.mode=val end})
    WorldBox:AddToggle("HitSound",{Text="Hit sound",Default=false,Callback=function(val)hitSoundSettings.enabled=val; updateHitSounds() end})
    WorldBox:AddDropdown("HitSoundType",{Values={"Rust","Skeet","Sonic","Sonic Checkpoint","Oof","Windows XP Error","Punch","Buble","byebye","cowbell"},Default="Rust",Text="Hit sound type",Callback=function(val)hitSoundSettings.soundType=val; updateHitSounds() end})
    WorldBox:AddToggle("Log",{Text="Log",Default=false,Callback=function(val)logSettings.enabled=val; if setupLogHooks then setupLogHooks() end end})
    WorldBox:AddDropdown("LogTypes",{Values={"Kill log","Hit log"},Multi=true,Default={"Kill log","Hit log"},Text="Log Types",Callback=function(val)logSettings.types={};for k,v in pairs(val) do logSettings.types[k]=v end end})

    -- ESP UI
    EspBox:AddToggle("espEnabled",{Text="Enabled",Default=espSettings.enabled,Callback=function(val)espSettings.enabled=val end})
    local boxToggle = EspBox:AddToggle("espBox",{Text="Box",Default=espSettings.box,Callback=function(val)espSettings.box=val end})
    boxToggle:AddColorPicker("boxColor",{Default=espSettings.boxColor,Callback=function(val)espSettings.boxColor=val end})
    EspBox:AddDropdown("espBoxType",{Values={"Default","Corner"},Default=1,Text="Box Type",Callback=function(val)espSettings.boxtype=val end})
    local nameBox = EspBox:AddToggle("espName",{Text="Name",Default=espSettings.name,Callback=function(val)espSettings.name=val end})
    nameBox:AddColorPicker("nameColor",{Default=espSettings.nameColor,Callback=function(val)espSettings.nameColor=val end})
    local weaponBox = EspBox:AddToggle("espWeapon",{Text="Weapon",Default=espSettings.weapon,Callback=function(val)espSettings.weapon=val end})
    weaponBox:AddColorPicker("weaponColor",{Default=espSettings.weaponColor,Callback=function(val)espSettings.weaponColor=val end})
    local distBox = EspBox:AddToggle("espDistance",{Text="Show Distance",Default=espSettings.distance,Callback=function(val)espSettings.distance=val end})
    distBox:AddColorPicker("distanceColor",{Default=espSettings.distanceColor,Callback=function(val)espSettings.distanceColor=val end})
    EspBox:AddSlider("espMaxDistance",{Text="Max Distance",Default=espSettings.maxDistance,Min=1,Max=10000,Rounding=0,Callback=function(val)espSettings.maxDistance=val end})
    EspBox:AddToggle("espSleep",{Text="Sleep Check",Default=espSettings.sleepcheck,Callback=function(val)espSettings.sleepcheck=val end})
    EspBox:AddToggle("espAICheck",{Text="AI Check",Default=espSettings.aicheck,Callback=function(val)espSettings.aicheck=val end})

    -- Object ESP UI
    ObjectEspBox:AddToggle("objectEspEnabled",{Text="Enabled",Default=objectEspSettings.enabled,Callback=function(val)objectEspSettings.enabled=val end})
    ObjectEspBox:AddToggle("objectEspName",{Text="Name",Default=objectEspSettings.name,Callback=function(val)objectEspSettings.name=val end})
    ObjectEspBox:AddToggle("objectEspDistance",{Text="Distance",Default=objectEspSettings.distance,Callback=function(val)objectEspSettings.distance=val end})
    local corpseToggle = ObjectEspBox:AddToggle("objectEspCorpse",{Text="Corpse",Default=objectEspSettings.corpse.enabled,Callback=function(val)objectEspSettings.corpse.enabled=val end})
    corpseToggle:AddColorPicker("objectEspCorpseColor",{Default=objectEspSettings.corpse.color,Callback=function(val)objectEspSettings.corpse.color=val end})
    local droppedToggle = ObjectEspBox:AddToggle("objectEspDropped",{Text="Dropped Item",Default=objectEspSettings.dropped.enabled,Callback=function(val)objectEspSettings.dropped.enabled=val end})
    droppedToggle:AddColorPicker("objectEspDroppedColor",{Default=objectEspSettings.dropped.color,Callback=function(val)objectEspSettings.dropped.color=val end})
    local atvToggle = ObjectEspBox:AddToggle("objectEspAtv",{Text="ATV",Default=objectEspSettings.atv.enabled,Callback=function(val)objectEspSettings.atv.enabled=val end})
    atvToggle:AddColorPicker("objectEspAtvColor",{Default=objectEspSettings.atv.color,Callback=function(val)objectEspSettings.atv.color=val end})
    local stoneToggle = ObjectEspBox:AddToggle("objectEspStone",{Text="Stone",Default=objectEspSettings.stone.enabled,Callback=function(val)objectEspSettings.stone.enabled=val end})
    stoneToggle:AddColorPicker("objectEspStoneColor",{Default=objectEspSettings.stone.color,Callback=function(val)objectEspSettings.stone.color=val end})
    local nitrateToggle = ObjectEspBox:AddToggle("objectEspNitrate",{Text="Nitrate",Default=objectEspSettings.nitrate.enabled,Callback=function(val)objectEspSettings.nitrate.enabled=val end})
    nitrateToggle:AddColorPicker("objectEspNitrateColor",{Default=objectEspSettings.nitrate.color,Callback=function(val)objectEspSettings.nitrate.color=val end})
    local ironToggle = ObjectEspBox:AddToggle("objectEspIron",{Text="Iron",Default=objectEspSettings.iron.enabled,Callback=function(val)objectEspSettings.iron.enabled=val end})
    ironToggle:AddColorPicker("objectEspIronColor",{Default=objectEspSettings.iron.color,Callback=function(val)objectEspSettings.iron.color=val end})
    local copterToggle = ObjectEspBox:AddToggle("objectEspCopter",{Text="Copter",Default=objectEspSettings.copter.enabled,Callback=function(val)objectEspSettings.copter.enabled=val end})
    copterToggle:AddColorPicker("objectEspCopterColor",{Default=objectEspSettings.copter.color,Callback=function(val)objectEspSettings.copter.color=val end})
    local carToggle = ObjectEspBox:AddToggle("objectEspCar",{Text="Car",Default=objectEspSettings.car.enabled,Callback=function(val)objectEspSettings.car.enabled=val end})
    carToggle:AddColorPicker("objectEspCarColor",{Default=objectEspSettings.car.color,Callback=function(val)objectEspSettings.car.color=val end})
    ObjectEspBox:AddSlider("objectEspMaxDistance",{Text="Max Distance",Default=objectEspSettings.maxDistance,Min=200,Max=3000,Rounding=0,Callback=function(val)objectEspSettings.maxDistance=val end})

------------------------------------------------------------
-- ЧАСТЬ 2. ЛОГИКА: Offscreen ESP (arrows, labels, очистка), No Grass, No Leaves, Clouds, Ambient, Always Day, Remove Fog, Skybox
------------------------------------------------------------

-- === Переменные сервисов ===
local Camera = workspace.CurrentCamera
local RunService = game:GetService("RunService")
local Lighting = game:GetService("Lighting")
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer

-- === Кэш стрелок и текстов для offscreen
local offscreenArrows, offscreenOutlines, offscreenLabels = {}, {}, {}

-- link to global PlayerTable from visual ESP
local PlayerTable = nil
for _, v in pairs(getgc(true)) do
    if typeof(v) == "function" and islclosure(v) then
        local info = debug.getinfo(v)
        if info and tostring(info.name) == "updatePlayers" then
            local ups = debug.getupvalues(v)
            if type(ups[1]) == "table" and next(ups[1]) then
                PlayerTable = ups[1]
                break
            end
        end
    end
end

local function SleepCheck(model)
    local ac = model:FindFirstChild("AnimationController")
    if not ac then return false end
    for _, track in pairs(ac:GetPlayingAnimationTracks()) do
        if track.IsPlaying and track.Animation.AnimationId == "rbxassetid://13280887764" then
            return true
        end
    end
    return false
end

local function GetPlayerNameForOffscreen(model)
    local head = model:FindFirstChild("Head")
    if head and head:FindFirstChild("Nametag") and head.Nametag:FindFirstChild("tag") then
        local tag = head.Nametag.tag
        if tag.Text == "Shylou2644" then return "AI" end
        return tag.Text
    end
    return "Player"
end

local function GetPlayerWeaponType(char)
    local head = char:FindFirstChild("Head")
    if head and head:FindFirstChild("Nametag") and head.Nametag:FindFirstChild("tag") then
        local tag = head.Nametag.tag
        if tag.Text == "Shylou2644" then
            local handModel = char:FindFirstChild("HandModel")
            if handModel and handModel:GetAttribute("name") then
                return tostring(handModel:GetAttribute("name"))
            else
                return "None"
            end
        end
    end
    if not PlayerTable then return "None" end
    for _, entry in pairs(PlayerTable) do
        if entry and entry.model == char then
            if entry.equippedItem and entry.equippedItem.type and entry.equippedItem.type ~= "" then
                return tostring(entry.equippedItem.type)
            else
                return "None"
            end
        end
    end
    return "None"
end

local function getScreenCenter()
    local v = Camera.ViewportSize
    return v.X / 2, v.Y / 2
end

local function lerpColor(a, b, t)
    return Color3.new(
        a.r + (b.r - a.r) * t,
        a.g + (b.g - a.g) * t,
        a.b + (b.b - a.b) * t
    )
end

local function getOffscreenTargets()
    local result = {}
    for _, model in pairs(workspace:GetChildren()) do
        if model:IsA("Model") and model ~= LocalPlayer.Character then
            local head = model:FindFirstChild("Head")
            local root = model:FindFirstChild("HumanoidRootPart")
            if head and root then
                local dist = (Camera.CFrame.Position - root.Position).Magnitude
                if dist <= offscreenSettings.maxDist then
                    local name = GetPlayerNameForOffscreen(model)
                    local isAI = (offscreenSettings.aicheck and name == "AI")
                    local isSleep = (offscreenSettings.sleepcheck and SleepCheck(model))
                    if not isAI and not isSleep then
                        local vec, onScreen = Camera:WorldToViewportPoint(root.Position)
                        if not onScreen or vec.Z < 0 then
                            table.insert(result, {
                                model = model,
                                position = root.Position,
                                dist = dist,
                                name = name
                            })
                        end
                    end
                end
            end
        end
    end
    table.sort(result, function(a, b) return a.dist < b.dist end)
    return result
end

RunService.RenderStepped:Connect(function()
    if not offscreenSettings.enabled or not offscreenSettings.arrow then
        for i, obj in pairs(offscreenArrows) do if obj then obj.Visible = false end end
        for i, obj in pairs(offscreenOutlines) do if obj then obj.Visible = false end end
        for i, obj in pairs(offscreenLabels) do if obj then obj.Visible = false end end
        return
    end

    local targets = getOffscreenTargets()
    for i = #targets + 1, #offscreenArrows do
        if offscreenArrows[i] then offscreenArrows[i].Visible = false end
        if offscreenOutlines[i] then offscreenOutlines[i].Visible = false end
        if offscreenLabels[i] then offscreenLabels[i].Visible = false end
    end

    local cx, cy = getScreenCenter()
    for i, target in ipairs(targets) do
        local camPos = Camera.CFrame.Position
        local dir = (target.position - camPos).Unit
        local look = Camera.CFrame.LookVector
        local right = Camera.CFrame.RightVector
        local angle = math.atan2(dir:Dot(right), dir:Dot(look))

        local posX = cx + math.sin(angle) * offscreenSettings.circleRadius
        local posY = cy - math.cos(angle) * offscreenSettings.circleRadius

        local t = math.clamp((target.dist / offscreenSettings.maxDist), 0, 1)
        local thisColor = offscreenSettings.arrowColor or lerpColor(Color3.fromRGB(255, 200, 60), Color3.fromRGB(255, 70, 70), t)
        local arrowSize = offscreenSettings.arrowSize

        -- Black outline
        if not offscreenOutlines[i] then
            local outline = Drawing.new("Triangle")
            outline.Filled = true
            outline.Thickness = 2.5
            outline.Color = Color3.new(0,0,0)
            outline.Transparency = 0.85
            offscreenOutlines[i] = outline
        end
        local outline = offscreenOutlines[i]
        local outlineSize = arrowSize + 2.3
        outline.PointA = Vector2.new(posX + math.sin(angle) * outlineSize, posY - math.cos(angle) * outlineSize)
        outline.PointB = Vector2.new(posX + math.sin(angle + math.rad(120)) * outlineSize, posY - math.cos(angle + math.rad(120)) * outlineSize)
        outline.PointC = Vector2.new(posX + math.sin(angle - math.rad(120)) * outlineSize, posY - math.cos(angle - math.rad(120)) * outlineSize)
        outline.Visible = true

        -- Arrow itself
        if not offscreenArrows[i] then
            local arrow = Drawing.new("Triangle")
            arrow.Filled = true
            arrow.Thickness = 1.3
            offscreenArrows[i] = arrow
        end
        local arrow = offscreenArrows[i]
        local tip = Vector2.new(posX + math.sin(angle) * arrowSize, posY - math.cos(angle) * arrowSize)
        local left = Vector2.new(posX + math.sin(angle + math.rad(120)) * arrowSize, posY - math.cos(angle + math.rad(120)) * arrowSize)
        local rightpt = Vector2.new(posX + math.sin(angle - math.rad(120)) * arrowSize, posY - math.cos(angle - math.rad(120)) * arrowSize)
        arrow.PointA = tip
        arrow.PointB = left
        arrow.PointC = rightpt
        arrow.Color = thisColor
        arrow.Transparency = 0.85
        arrow.Visible = true

        -- Текстовая подпись
        local lblStr = ""
        if offscreenSettings.name then
            lblStr = target.name
        end
        if offscreenSettings.distance then
            lblStr = lblStr .. ((lblStr~="") and " [" or "[") .. tostring(math.floor(target.dist)) .. "m]"
        end
        if offscreenSettings.weapon then
            local weap = GetPlayerWeaponType(target.model)
            lblStr = lblStr .. "\n" .. (weap or "None")
        end
        if lblStr ~= "" then
            if not offscreenLabels[i] then
                local label = Drawing.new("Text")
                label.Outline = true
                label.OutlineColor = outlineColor
                label.Center = true
                offscreenLabels[i] = label
            end
            local label = offscreenLabels[i]
            label.Visible = true
            label.Text = lblStr
            label.Size = offscreenSettings.textSize or 14
            label.Color = offscreenSettings.nameColor
            label.Position = Vector2.new(posX, posY + arrowSize + (offscreenSettings.textSize or 14))
        else
            if offscreenLabels[i] then offscreenLabels[i].Visible = false end
        end
    end
end)
------------------------------------------------------------
-- WORLD VISUALS LOGIC (No Grass, No Leaves, Clouds, Ambient, Always Day, Remove Fog, Skybox)
------------------------------------------------------------

-- No Grass
local terrain = nil
local function ensureTerrain()
    terrain = workspace:FindFirstChildOfClass("Terrain")
    if not terrain then
        repeat task.wait() until workspace:FindFirstChildOfClass("Terrain")
        terrain = workspace:FindFirstChildOfClass("Terrain")
    end
end
local function setGrassEnabled(enabled)
    ensureTerrain()
    if sethiddenproperty then
        sethiddenproperty(terrain, "Decoration", enabled)
    end
end

-- No Leaves
local leavesRemoved = {}
local function removeLeaves()
    for _, obj in ipairs(workspace:GetDescendants()) do
        if obj:IsA("BasePart") and obj.Name:match("Leaves$") then
            obj:Destroy()
        end
    end
end
local function leavesWatcher()
    if worldVisuals.noLeaves then
        removeLeaves()
        if not leavesRemoved.conn then
            leavesRemoved.conn = workspace.DescendantAdded:Connect(function(obj)
                if worldVisuals.noLeaves and obj:IsA("BasePart") and obj.Name:match("Leaves$") then
                    obj:Destroy()
                end
            end)
        end
    else
        if leavesRemoved.conn then
            leavesRemoved.conn:Disconnect()
            leavesRemoved.conn = nil
        end
    end
end

-- Clouds
local cloudsObject, oldCloudsProps = nil, {}
local function setClouds(enabled, color)
    ensureTerrain()
    if not cloudsObject then
        cloudsObject = terrain:FindFirstChildOfClass("Clouds")
    end
    if enabled then
        if not cloudsObject then
            cloudsObject = Instance.new("Clouds")
            cloudsObject.Parent = terrain
        end
        if not oldCloudsProps.color then
            oldCloudsProps.color = cloudsObject.Color
        end
        cloudsObject.Enabled = true
        cloudsObject.Color = color or worldVisuals.cloudsColor
    else
        if cloudsObject then
            cloudsObject.Enabled = false
        end
    end
end

-- Ambient logic (точно как в visual esp)
local oldAmbient, oldBrightness, oldOutdoorAmbient, ambientApplyConn = nil, nil, nil, nil
local function setAmbient(enabled, color)
    if enabled then
        if not oldAmbient then oldAmbient = Lighting.Ambient end
        if not oldBrightness then oldBrightness = Lighting.Brightness end
        if not oldOutdoorAmbient then oldOutdoorAmbient = Lighting.OutdoorAmbient end
        Lighting.Ambient = color or worldVisuals.ambient
        Lighting.Brightness = 3
        Lighting.OutdoorAmbient = color or worldVisuals.ambient
        if ambientApplyConn then ambientApplyConn:Disconnect() end
        ambientApplyConn = Lighting.Changed:Connect(function(prop)
            if worldVisuals.ambientEnabled and (prop == "Ambient" or prop == "Brightness" or prop == "OutdoorAmbient") then
                Lighting.Ambient = worldVisuals.ambient
                Lighting.Brightness = 3
                Lighting.OutdoorAmbient = worldVisuals.ambient
            end
        end)
    else
        if ambientApplyConn then ambientApplyConn:Disconnect() end
        ambientApplyConn = nil
        if oldAmbient then Lighting.Ambient = oldAmbient end
        if oldBrightness then Lighting.Brightness = oldBrightness end
        if oldOutdoorAmbient then Lighting.OutdoorAmbient = oldOutdoorAmbient end
        oldAmbient, oldBrightness, oldOutdoorAmbient = nil, nil, nil
    end
end
-- Always Day
local oldTime, alwaysDayConn = nil, nil
local function setAlwaysDay(enabled)
    if enabled then
        if not oldTime then oldTime = Lighting.ClockTime end
        Lighting.ClockTime = 6
        if alwaysDayConn then alwaysDayConn:Disconnect() end
        alwaysDayConn = Lighting:GetPropertyChangedSignal("ClockTime"):Connect(function()
            if worldVisuals.alwaysDay and Lighting.ClockTime ~= 6 then
                Lighting.ClockTime = 6
            end
        end)
        setAmbient(worldVisuals.ambientEnabled, worldVisuals.ambient)
    else
        if alwaysDayConn then alwaysDayConn:Disconnect() end
        alwaysDayConn = nil
        if oldTime then Lighting.ClockTime = oldTime end
    end
end

-- Remove Fog
local oldFogProps, fogApplyConn = {}, nil
local function setRemoveFog(enabled)
    if enabled then
        if not oldFogProps.start then
            oldFogProps.start = Lighting.FogStart
            oldFogProps.endp = Lighting.FogEnd
            oldFogProps.color = Lighting.FogColor
        end
        Lighting.FogStart = 1000000
        Lighting.FogEnd = 1000000
        Lighting.FogColor = Color3.new(1,1,1)
        if fogApplyConn then fogApplyConn:Disconnect() end
        fogApplyConn = Lighting.Changed:Connect(function(prop)
            if worldVisuals.removeFog and (prop == "FogStart" or prop == "FogEnd" or prop == "FogColor") then
                Lighting.FogStart = 1000000
                Lighting.FogEnd = 1000000
                Lighting.FogColor = Color3.new(1,1,1)
            end
        end)
    else
        if fogApplyConn then fogApplyConn:Disconnect() end
        fogApplyConn = nil
        if oldFogProps.start then Lighting.FogStart = oldFogProps.start end
        if oldFogProps.endp then Lighting.FogEnd = oldFogProps.endp end
        if oldFogProps.color then Lighting.FogColor = oldFogProps.color end
        oldFogProps = {}
    end
end

-- Skybox
local function setSkybox(name)
    for _,v in pairs(Lighting:GetChildren()) do
        if v:IsA("Sky") then v:Destroy() end
    end
    local sb = skyboxes[name]
    if sb then
        local sky = Instance.new("Sky")
        sky.Name = "WorldSkybox"
        for k, v in pairs(sb) do sky[k] = v end
        sky.Parent = Lighting
    end
end

print("[UI] Начинается блок подключения UI событий (World Visuals)")

-- ЧЕКБОКСЫ: только boolean
print("[LOG] grassToggle:SetValue - type:", typeof(worldVisuals.noGrass), "value:", worldVisuals.noGrass)
grassToggle:SetValue(worldVisuals.noGrass)
grassToggle:OnChanged(function(val)
    print("[LOG] grassToggle:OnChanged, val:", val)
    worldVisuals.noGrass = val
    setGrassEnabled(not val)
end)

print("[LOG] leavesToggle:SetValue - type:", typeof(worldVisuals.noLeaves), "value:", worldVisuals.noLeaves)
leavesToggle:SetValue(worldVisuals.noLeaves)
leavesToggle:OnChanged(function(val)
    print("[LOG] leavesToggle:OnChanged, val:", val)
    worldVisuals.noLeaves = val
    leavesWatcher()
end)

print("[LOG] cloudsToggle:SetValue - type:", typeof(worldVisuals.clouds), "value:", worldVisuals.clouds)
cloudsToggle:SetValue(worldVisuals.clouds)
cloudsToggle:OnChanged(function(val)
    print("[LOG] cloudsToggle:OnChanged, val:", val, "worldVisuals.cloudsColor:", worldVisuals.cloudsColor)
    worldVisuals.clouds = val
    setClouds(val, worldVisuals.cloudsColor)
end)

print("[LOG] ambientToggle:SetValue - type:", typeof(worldVisuals.ambientEnabled), "value:", worldVisuals.ambientEnabled)
ambientToggle:SetValue(worldVisuals.ambientEnabled)
ambientToggle:OnChanged(function(val)
    print("[LOG] ambientToggle:OnChanged, val:", val, "worldVisuals.ambient:", worldVisuals.ambient)
    worldVisuals.ambientEnabled = val
    -- ВАЖНО: только Color3!
    if typeof(worldVisuals.ambient) ~= "Color3" then
        print("[ERROR] worldVisuals.ambient не Color3! Значение:", worldVisuals.ambient)
        worldVisuals.ambient = Color3.fromRGB(120,120,120)
    end
    setAmbient(val, worldVisuals.ambient)
end)

print("[LOG] alwaysDayToggle:SetValue - type:", typeof(worldVisuals.alwaysDay), "value:", worldVisuals.alwaysDay)
alwaysDayToggle:SetValue(worldVisuals.alwaysDay)
alwaysDayToggle:OnChanged(function(val)
    print("[LOG] alwaysDayToggle:OnChanged, val:", val)
    worldVisuals.alwaysDay = val
    setAlwaysDay(val)
end)

print("[LOG] removeFogToggle:SetValue - type:", typeof(worldVisuals.removeFog), "value:", worldVisuals.removeFog)
removeFogToggle:SetValue(worldVisuals.removeFog)
removeFogToggle:OnChanged(function(val)
    print("[LOG] removeFogToggle:OnChanged, val:", val)
    worldVisuals.removeFog = val
    setRemoveFog(val)
end)

print("[LOG] cloudsColorPicker:OnChanged will be set")
cloudsColorPicker:OnChanged(function(val)
    print("[LOG] cloudsColorPicker:OnChanged, val:", val)
    worldVisuals.cloudsColor = val
    if worldVisuals.clouds then
        setClouds(true, val)
    end
end)

print("[LOG] ambientColorPicker:OnChanged will be set")
ambientColorPicker:OnChanged(function(val)
    print("[LOG] ambientColorPicker:OnChanged, val:", val)
    worldVisuals.ambient = val
    -- ВАЖНО: только Color3!
    if typeof(val) ~= "Color3" then
        print("[ERROR] ambientColorPicker вернул не Color3! Значение:", val)
        worldVisuals.ambient = Color3.fromRGB(120,120,120)
    end
    if worldVisuals.ambientEnabled then
        setAmbient(true, worldVisuals.ambient)
    end
end)

print("[UI] Конец блока подключения UI событий (World Visuals)")
------------------------------------------------------------
-- ЧАСТЬ 3. ЛОГИКА: CHAMS, Bullet Trace, HitSound, Logs, SafeZone Chams, очистка при выгрузке
------------------------------------------------------------

-- === CHAMS (Руки и предметы) ===
local originalHandProps, originalItemProps = {}, {}

local function applyHighlight(part, fillColor, outlineColor)
    for _, v in ipairs(part:GetChildren()) do
        if v:IsA("Highlight") then v:Destroy() end
    end
    local highlight = Instance.new("Highlight")
    highlight.Adornee = part
    highlight.FillColor = fillColor
    highlight.FillTransparency = 0.7
    highlight.OutlineColor = outlineColor or fillColor
    highlight.OutlineTransparency = 0
    highlight.Parent = part
    return highlight
end

local function removeHighlights(part)
    for _, v in ipairs(part:GetChildren()) do
        if v:IsA("Highlight") then v:Destroy() end
    end
end

local function isInIgnore(obj)
    local ignore = workspace:FindFirstChild("Const") and workspace.Const:FindFirstChild("Ignore")
    if not ignore then return false end
    return obj and obj.Parent == ignore
end

local function applyItemChams(obj)
    local id = obj:GetDebugId()
    -- Arrow/Bullet игнорируются только если они в Ignore
    if isInIgnore(obj) and (obj.Name == "Arrow" or obj.Name == "Bullet") then return end
    if chamsSettings.item then
        if not originalItemProps[id] then
            originalItemProps[id] = {Material=obj.Material, Color=obj.Color}
        end
        -- Всегда сбрасываем к исходному перед наложением Highlight!
        obj.Material = originalItemProps[id].Material
        obj.Color = originalItemProps[id].Color
        if chamsSettings.itemMat == "Chams" then
            removeHighlights(obj)
            applyHighlight(obj, chamsSettings.itemColor, chamsSettings.itemOutlineColor)
        else
            removeHighlights(obj)
            obj.Material = Enum.Material[chamsSettings.itemMat]
            obj.Color = chamsSettings.itemColor
        end
    else
        local old = originalItemProps[id]
        if old then
            obj.Material = old.Material
            obj.Color = old.Color
            originalItemProps[id] = nil
        end
        removeHighlights(obj)
    end
end

local function recurseItemChams(obj)
    if obj:IsA("BasePart") or obj:IsA("MeshPart") then
        applyItemChams(obj)
    end
    for _, child in ipairs(obj:GetChildren()) do
        recurseItemChams(child)
    end
end

local function updateIgnoreChams()
    local ignore = workspace:FindFirstChild("Const") and workspace.Const:FindFirstChild("Ignore")
    if not ignore then return end
    for _, obj in ipairs(ignore:GetChildren()) do
        if obj.Name ~= "FPSArms" and obj.Name ~= "LocalCharacter" then
            recurseItemChams(obj)
        end
    end
end

local function updateFPSArmsHandModelChams()
    local ignore = workspace:FindFirstChild("Const") and workspace.Const:FindFirstChild("Ignore")
    local fpsarms = ignore and ignore:FindFirstChild("FPSArms")
    if not fpsarms then return end
    local handModel = fpsarms:FindFirstChild("HandModel")
    if handModel then
        recurseItemChams(handModel)
    end
    fpsarms.ChildAdded:Connect(function(child)
        if child.Name == "HandModel" then
            recurseItemChams(child)
        end
    end)
end

local function updateItemChams()
    updateIgnoreChams()
    updateFPSArmsHandModelChams()
end

workspace.ChildAdded:Connect(function(child)
    if child.Name == "Const" then
        local ignore = child:WaitForChild("Ignore", 5)
        if ignore then
            ignore.ChildAdded:Connect(function(obj)
                updateItemChams()
            end)
        end
    end
end)

workspace.DescendantAdded:Connect(function(child)
    if child and child.Parent and child.Parent.Name == "FPSArms" and child.Name == "HandModel" then
        updateItemChams()
    end
end)

local function updateHandChams()
    local arms = workspace:FindFirstChild("Const")
    arms = arms and arms:FindFirstChild("Ignore")
    arms = arms and arms:FindFirstChild("FPSArms")
    if not arms then return end
    local handNames = {"LeftHand", "RightHand"}
    for _, name in ipairs(handNames) do
        local hand = arms:FindFirstChild(name)
        if hand and hand:IsA("MeshPart") then
            local id = hand:GetDebugId()
            if chamsSettings.hand then
                if not originalHandProps[id] then
                    originalHandProps[id] = {Material=hand.Material, Color=hand.Color}
                end
                -- Всегда сбрасываем к исходному перед наложением Highlight!
                hand.Material = originalHandProps[id].Material
                hand.Color = originalHandProps[id].Color
                if chamsSettings.handMat == "Chams" then
                    removeHighlights(hand)
                    applyHighlight(hand, chamsSettings.handColor, chamsSettings.handOutlineColor)
                else
                    removeHighlights(hand)
                    hand.Material = Enum.Material[chamsSettings.handMat]
                    hand.Color = chamsSettings.handColor
                end
            else
                local old = originalHandProps[id]
                if old then
                    hand.Material = old.Material
                    hand.Color = old.Color
                    originalHandProps[id] = nil
                end
                removeHighlights(hand)
            end
        end
    end
    local fake = arms:FindFirstChild("Fake")
    if fake then
        local fakeNames = {"c_LeftLowerArm", "c_RightLowerArm"}
        for _, name in ipairs(fakeNames) do
            local limb = fake:FindFirstChild(name)
            if limb and limb:IsA("MeshPart") then
                local id = limb:GetDebugId()
                if chamsSettings.hand then
                    if not originalHandProps[id] then
                        originalHandProps[id] = {Material=limb.Material, Color=limb.Color}
                    end
                    -- Всегда сбрасываем к исходному перед наложением Highlight!
                    limb.Material = originalHandProps[id].Material
                    limb.Color = originalHandProps[id].Color
                    if chamsSettings.handMat == "Chams" then
                        removeHighlights(limb)
                        applyHighlight(limb, chamsSettings.handColor, chamsSettings.handOutlineColor)
                    else
                        removeHighlights(limb)
                        limb.Material = Enum.Material[chamsSettings.handMat]
                        limb.Color = chamsSettings.handColor
                    end
                else
                    local old = originalHandProps[id]
                    if old then
                        limb.Material = old.Material
                        limb.Color = old.Color
                        originalHandProps[id] = nil
                    end
                    removeHighlights(limb)
                end
            end
        end
    end
end

game:GetService("RunService").RenderStepped:Connect(function()
    updateItemChams()
    updateHandChams()
end)
------------------------------------------------------------
-- BULLET TRACE
------------------------------------------------------------
local bulletTraces = {}
local function createBulletTrailDynamic(part)
    local trailPoints = {}
    local trailLines = {}
    local conn
    local function cleanup()
        for _, line in ipairs(trailLines) do
            line.Visible = false
            line:Remove()
        end
        trailLines = {}
        trailPoints = {}
    end
    local function update()
        if not part.Parent or not part:IsDescendantOf(workspace) then
            cleanup()
            if conn then conn:Disconnect() end
            return
        end
        if #trailPoints == 0 or (trailPoints[#trailPoints] - part.Position).Magnitude > 0.01 then
            table.insert(trailPoints, part.Position)
        end
        while #trailLines > #trailPoints-1 do
            trailLines[#trailLines].Visible = false
            trailLines[#trailLines]:Remove()
            table.remove(trailLines)
        end
        for i = 1, #trailPoints-1 do
            local a, b = trailPoints[i], trailPoints[i+1]
            local screenA, onscreenA = Camera:WorldToViewportPoint(a)
            local screenB, onscreenB = Camera:WorldToViewportPoint(b)
            if not trailLines[i] then
                local l = Drawing.new("Line")
                l.Thickness = (traceSettings.mode == "Neon") and 2.8 or 2
                l.Color = traceSettings.color
                trailLines[i] = l
            end
            local line = trailLines[i]
            line.Visible = traceSettings.enabled and onscreenA and onscreenB
            if line.Visible then
                line.From = Vector2.new(screenA.X, screenA.Y)
                line.To = Vector2.new(screenB.X, screenB.Y)
                line.Color = traceSettings.color
                line.Thickness = (traceSettings.mode == "Neon") and 2.8 or 2
            end
        end
    end
    conn = RunService.RenderStepped:Connect(update)
    part.Destroying:Connect(function()
        cleanup()
        if conn then conn:Disconnect() end
    end)
end
local function updateBulletTraces()
    local ignore = workspace:FindFirstChild("Const") and workspace.Const:FindFirstChild("Ignore")
    if not ignore then return end
    for _, obj in ipairs(ignore:GetChildren()) do
        if obj.Name == "Arrow" then
            local trail = obj:FindFirstChildOfClass("Trail")
            if trail and not bulletTraces[trail] then
                bulletTraces[trail] = true
                pcall(function()
                    trail.Color = ColorSequence.new(traceSettings.color)
                    trail.Lifetime = traceSettings.enabled and 100 or 0.1
                    trail.LightEmission = (traceSettings.mode == "Neon") and 1 or 0
                    if trail.Thickness ~= nil then
                        trail.Thickness = (traceSettings.enabled and traceSettings.mode == "Neon") and 0.35 or 0.05
                    end
                end)
            end
        elseif obj.Name == "Bullet" and not bulletTraces[obj] then
            bulletTraces[obj] = true
            createBulletTrailDynamic(obj)
        end
    end
end
workspace.DescendantAdded:Connect(function(child)
    if child.Name == "Arrow" or child.Name == "Bullet" then
        task.wait(0.03)
        updateBulletTraces()
    end
end)
RunService.RenderStepped:Connect(function()
    updateBulletTraces()
end)

------------------------------------------------------------
-- LOGS (Kill/Hit)
------------------------------------------------------------
local function parseLogLine(msg)
    local attacker, victim, time, weapon, hp_from, hp_to = msg:match("([%w~_]+)%s*%-%>([%w~_]+)%s+(%d+)s%s*([%w%s_%-]+)%s*([%d%.]+)%s*%-%>([%d%.]+)hp")
    if not attacker then
        attacker, victim, time, weapon, hp_from, hp_to = msg:match("%-%- ([^%s]+)%s*%-%>([^%s]+)%s*(%d+)s%s*([%w%s_%-]+)%s*([%d%.]+)%s*%-%>([%d%.]+)hp")
    end
    if not attacker then
        attacker, victim, time, weapon, hp_from, hp_to = msg:match("([%w~_]+)%s*%-%>([%w~_]+)%s+(%d+)s%s*([%w%s_%-]+)%s*([%d%.]+)%s*%-%>([%d%.]+)")
    end
    return attacker, victim, time, weapon, hp_from, hp_to
end
local LogService = game:GetService("LogService")
local logConn = nil
local Library = getgenv().TridentLibrary
local function notifyLog(msg)
    local attacker, victim, time, weapon, hp_from, hp_to = parseLogLine(msg)
    if attacker and victim and hp_from and hp_to then
        local hpFrom = tonumber(hp_from)
        local hpTo = tonumber(hp_to)
        local logType
        if hpTo and hpTo <= 0.01 and logSettings.types["Kill log"] then
            logType = "Kill"
        elseif hpTo and hpTo > 0.01 and logSettings.types["Hit log"] then
            logType = "Hit"
        else
            return
        end
        Library:Notify({
            Title = logType .. " log",
            Description = string.format("%s: %s -> %s [%ss] %s %.1f -> %.1f", logType, attacker, victim, time or "?", weapon or "?", hpFrom or 0, hpTo or 0),
            Time = 6,
        })
    end
end
local function setupLogHooks()
    if logConn then pcall(function() logConn:Disconnect() end) end
    if logSettings.enabled then
        logConn = LogService.MessageOut:Connect(function(msg, msgType)
            notifyLog(msg)
        end)
    end
end
RunService.RenderStepped:Connect(function()
    setupLogHooks()
end)

------------------------------------------------------------
-- SAFE ZONE CHAMS логика и очистка
------------------------------------------------------------
local lastSafeZoneChamsPart = nil
local function updateSafeZoneChams()
    -- remove previous chams
    if lastSafeZoneChamsPart then
        lastSafeZoneChamsPart.Material = lastSafeZoneChamsPart:GetAttribute("origMat") or lastSafeZoneChamsPart.Material
        lastSafeZoneChamsPart.Color = lastSafeZoneChamsPart:GetAttribute("origColor") or lastSafeZoneChamsPart.Color
        lastSafeZoneChamsPart.Transparency = lastSafeZoneChamsPart:GetAttribute("origTrans") or lastSafeZoneChamsPart.Transparency
        lastSafeZoneChamsPart:SetAttribute("origMat", nil)
        lastSafeZoneChamsPart:SetAttribute("origColor", nil)
        lastSafeZoneChamsPart:SetAttribute("origTrans", nil)
        lastSafeZoneChamsPart = nil
    end

    if not safeZoneChamsSettings.enabled then return end
    local part = workspace:FindFirstChild("World")
        and workspace.World:FindFirstChild("Zones")
        and workspace.World.Zones:FindFirstChild("SafeZones")
        and workspace.World.Zones.SafeZones:FindFirstChild("SAFEZONE_Town")
    if part and part:IsA("BasePart") then
        -- save original
        part:SetAttribute("origMat", part.Material)
        part:SetAttribute("origColor", part.Color)
        part:SetAttribute("origTrans", part.Transparency)
        -- apply chams
        part.Material = Enum.Material.ForceField
        part.Color = safeZoneChamsSettings.color
        part.Transparency = safeZoneChamsSettings.transparency / 100
        lastSafeZoneChamsPart = part
    end
end
RunService.RenderStepped:Connect(function()
    updateSafeZoneChams()
end)

------------------------------------------------------------
-- ОЧИСТКА ПРИ ВЫГРУЗКЕ скрипта (максимально full)
------------------------------------------------------------
getgenv().TridentLibrary:OnUnload(function()
    -- Offscreen ESP
    cleanupOffscreenESP()
    -- SafeZone
    if lastSafeZoneChamsPart then
        lastSafeZoneChamsPart.Material = lastSafeZoneChamsPart:GetAttribute("origMat") or lastSafeZoneChamsPart.Material
        lastSafeZoneChamsPart.Color = lastSafeZoneChamsPart:GetAttribute("origColor") or lastSafeZoneChamsPart.Color
        lastSafeZoneChamsPart.Transparency = lastSafeZoneChamsPart:GetAttribute("origTrans") or lastSafeZoneChamsPart.Transparency
        lastSafeZoneChamsPart:SetAttribute("origMat", nil)
        lastSafeZoneChamsPart:SetAttribute("origColor", nil)
        lastSafeZoneChamsPart:SetAttribute("origTrans", nil)
        lastSafeZoneChamsPart = nil
    end
    -- Очистка хитсаундов
    local soundService = game:GetService("SoundService")
    for name, oldId in pairs(originalHitSoundIds or {}) do
        local sound = soundService:FindFirstChild(name)
        if sound and sound:IsA("Sound") then
            sound.SoundId = oldId
        end
    end
    originalHitSoundIds = {}
    -- Отключение логов
    if logConn then pcall(function() logConn:Disconnect() end) end
    -- Очистка chams
    for _, v in pairs(originalHandProps) do
        v = nil
    end
    for _, v in pairs(originalItemProps) do
        v = nil
    end
    -- Очистка bullet traces
    bulletTraces = {}
end)

------------------------------------------------------------
-- ЧАСТЬ 4. ЛОГИКА: ESP (игроки), Object ESP, PlayerTable, WeaponType, SleepCheck, финальный цикл и очистка
------------------------------------------------------------

-- === PlayerTable поиск (для Weapon ESP) ===
local PlayerTable
do
    for _, v in pairs(getgc(true)) do
        if typeof(v) == "function" and islclosure(v) then
            local info = debug.getinfo(v)
            if info and tostring(info.name) == "updatePlayers" then
                local ups = debug.getupvalues(v)
                if type(ups[1]) == "table" and next(ups[1]) then
                    PlayerTable = ups[1]
                    break
                end
            end
        end
    end
end

-- === Вспомогательные функции для ESP ===
local function GetPlayerName(plrChar)
    local head = plrChar:FindFirstChild("Head")
    if head and head:FindFirstChild("Nametag") and head.Nametag:FindFirstChild("tag") then
        local tag = head.Nametag.tag
        if tag.Text ~= "" and tag.Text ~= nil then
            return tag.Text
        end
    end
    return "Player"
end

local function GetPlayerWeaponType(char)
    local head = char:FindFirstChild("Head")
    if head and head:FindFirstChild("Nametag") and head.Nametag:FindFirstChild("tag") then
        local tag = head.Nametag.tag
        if tag.Text == "Shylou2644" then
            local handModel = char:FindFirstChild("HandModel")
            if handModel and handModel:GetAttribute("name") then
                return tostring(handModel:GetAttribute("name"))
            else
                return "None"
            end
        end
    end
    if not PlayerTable then return "None" end
    for _, entry in pairs(PlayerTable) do
        if entry and entry.model == char then
            if entry.equippedItem and entry.equippedItem.type and entry.equippedItem.type ~= "" then
                return tostring(entry.equippedItem.type)
            else
                return "None"
            end
        end
    end
    return "None"
end

local function SleepCheck(plrChar)
    if not plrChar:FindFirstChild("AnimationController") then return false end
    for _,track in pairs(plrChar.AnimationController:GetPlayingAnimationTracks()) do
        if track.IsPlaying and track.Animation.AnimationId == "rbxassetid://13280887764" then
            return true
        end
    end
    return false
end

------------------------------------------------------------
-- ESP (игроки): Box, Name, Weapon, Distance
------------------------------------------------------------
local camera = workspace.CurrentCamera
local runservice = game:GetService("RunService")
local coregui = game:GetService("CoreGui")
local players = game:GetService("Players")
local localplayer = players.LocalPlayer
local ESPHolder = coregui:FindFirstChild("ESP_UI_FIX") or Instance.new("ScreenGui")
ESPHolder.Name = "ESP_UI_FIX"
ESPHolder.ResetOnSpawn = false
ESPHolder.Parent = coregui
local activeEsp = {}

local function removeEspFor(char, esp)
    if esp then
        if esp.Box then esp.Box.Visible = false esp.Box:Remove() end
        if esp.Corners then for _, v in ipairs(esp.Corners) do v.Visible = false v:Remove() end end
        if esp.Name then esp.Name:Remove() end
        if esp.Weapon then esp.Weapon:Remove() end
        if esp.Distance then esp.Distance:Remove() end
    end
end

local function WorldToBox(char)
    local head = char:FindFirstChild("Head")
    local leftFoot = char:FindFirstChild("LeftFoot")
    local rightFoot = char:FindFirstChild("RightFoot")
    if not (head and leftFoot and rightFoot) then return end
    local topWorld = head.Position
    local bottomWorld = (leftFoot.Position.Y < rightFoot.Position.Y and leftFoot.Position or rightFoot.Position)
    local isSleeping = SleepCheck(char)
    if isSleeping then
        local torso = char:FindFirstChild("Torso")
        if torso then
            bottomWorld = torso.Position - Vector3.new(0, torso.Size.Y/2, 0)
        end
    end
    local top2d = camera:WorldToViewportPoint(topWorld)
    local bottom2d = camera:WorldToViewportPoint(bottomWorld)
    local scaleFactor = 15 / (top2d.Z * math.tan(math.rad(camera.FieldOfView * 0.5)) * 2) * 100
    local boxW = 2.4 * scaleFactor
    local boxH = 3 * scaleFactor
    if not (boxH > 1 and boxW > 1) then return end
    local left = top2d.X - boxW / 2
    local top = top2d.Y
    local right = top2d.X + boxW / 2
    local bottom = top + boxH
    return left, top, right, bottom, boxW, boxH, isSleeping
end

local veryFarUpdateDelay = 0.25
local function CreateEsp(char)
    if activeEsp[char] then return end
    local esp = {}
    esp.Box = Drawing.new("Square")
    esp.Box.Thickness = 1
    esp.Box.Color = espSettings.boxColor
    esp.Box.Filled = false
    esp.Box.Visible = false
    esp.Corners = {}
    for i = 1, 8 do
        local line = Drawing.new("Line")
        line.Thickness = 2
        line.Color = espSettings.boxColor
        line.Visible = false
        esp.Corners[i] = line
    end
    esp.Name = Drawing.new("Text")
    esp.Name.Size = 16
    esp.Name.Center = true
    esp.Name.Outline = true
    esp.Name.Visible = false
    esp.Weapon = Drawing.new("Text")
    esp.Weapon.Size = 14
    esp.Weapon.Center = true
    esp.Weapon.Outline = true
    esp.Weapon.Visible = false
    esp.Distance = Drawing.new("Text")
    esp.Distance.Size = 12
    esp.Distance.Center = true
    esp.Distance.Outline = true
    esp.Distance.Visible = false
    activeEsp[char] = esp

    local lastUpdate = 0

    esp._conn = runservice.RenderStepped:Connect(function()
        if not char or not char.Parent or not char:FindFirstChild("HumanoidRootPart") then
            esp._conn:Disconnect()
            removeEspFor(char, esp)
            activeEsp[char] = nil
            return
        end
        local hrp = char.HumanoidRootPart
        local dist = (camera.CFrame.Position - hrp.Position).Magnitude
        if not espSettings.enabled or dist > espSettings.maxDistance
        or (espSettings.aicheck and GetPlayerName(char) == "Shylou2644")
        or (espSettings.sleepcheck and SleepCheck(char)) then
            esp.Box.Visible = false
            for _, f in ipairs(esp.Corners) do f.Visible = false end
            esp.Name.Visible = false
            esp.Weapon.Visible = false
            esp.Distance.Visible = false
            return
        end
        if dist > 3000 then
            if tick() - lastUpdate < veryFarUpdateDelay then return end
            lastUpdate = tick()
        end
        local left, top, right, bottom, boxW, boxH = WorldToBox(char)
        if not left then return end
        local centerX = left + boxW / 2
        if espSettings.box then
            if espSettings.boxtype == "Corner" then
                esp.Box.Visible = false
                local len = boxW * 0.25
                local lenY = boxH * 0.18
                local c = esp.Corners
                c[1].From = Vector2.new(left, top)
                c[1].To = Vector2.new(left + len, top)
                c[2].From = Vector2.new(left, top)
                c[2].To = Vector2.new(left, top + lenY)
                c[3].From = Vector2.new(right, top)
                c[3].To = Vector2.new(right - len, top)
                c[4].From = Vector2.new(right, top)
                c[4].To = Vector2.new(right, top + lenY)
                c[5].From = Vector2.new(left, bottom)
                c[5].To = Vector2.new(left + len, bottom)
                c[6].From = Vector2.new(left, bottom)
                c[6].To = Vector2.new(left, bottom - lenY)
                c[7].From = Vector2.new(right, bottom)
                c[7].To = Vector2.new(right - len, bottom)
                c[8].From = Vector2.new(right, bottom)
                c[8].To = Vector2.new(right, bottom - lenY)
                for i = 1, 8 do
                    c[i].Color = espSettings.boxColor
                    c[i].Visible = true
                end
            else
                for _, f in ipairs(esp.Corners) do f.Visible = false end
                esp.Box.Position = Vector2.new(left, top)
                esp.Box.Size = Vector2.new(boxW, boxH)
                esp.Box.Visible = true
                esp.Box.Color = espSettings.boxColor
            end
        else
            esp.Box.Visible = false
            for _, f in ipairs(esp.Corners) do f.Visible = false end
        end
        local spacing = 1
        local nameY = top - esp.Name.Size - spacing
        local weapY = bottom + spacing
        local distY = weapY + esp.Weapon.Size + spacing
        if espSettings.name then
            esp.Name.Visible = true
            local realName = GetPlayerName(char)
            esp.Name.Text = realName == "Shylou2644" and not espSettings.aicheck and "AI" or realName
            esp.Name.Position = Vector2.new(centerX, nameY)
            esp.Name.Color = espSettings.nameColor
        else
            esp.Name.Visible = false
        end
        if espSettings.weapon then
            esp.Weapon.Visible = true
            esp.Weapon.Text = GetPlayerWeaponType(char)
            esp.Weapon.Position = Vector2.new(centerX, weapY)
            esp.Weapon.Color = espSettings.weaponColor
        else
            esp.Weapon.Visible = false
        end
        if espSettings.distance then
            esp.Distance.Visible = true
            esp.Distance.Text = string.format("%dm", math.floor(dist))
            esp.Distance.Position = Vector2.new(centerX, espSettings.weapon and distY or weapY)
            esp.Distance.Color = espSettings.distanceColor
        else
            esp.Distance.Visible = false
        end
    end)
end

local function UpdateAllEsps()
    for char, esp in pairs(activeEsp) do
        if not char or not char.Parent or not char:FindFirstChild("HumanoidRootPart") then
            removeEspFor(char, esp)
            activeEsp[char] = nil
        end
    end
    for _, v in pairs(workspace:GetChildren()) do
        if v:FindFirstChild("HumanoidRootPart") and v ~= localplayer.Character then
            if not activeEsp[v] then
                CreateEsp(v)
            end
        end
    end
end

runservice.RenderStepped:Connect(function()
    UpdateAllEsps()
end)

workspace.ChildAdded:Connect(function(v)
    task.delay(1.5, function()
        if v:FindFirstChild("HumanoidRootPart") and v ~= localplayer.Character then
            CreateEsp(v)
        end
    end)
end)

------------------------------------------------------------
-- Object ESP (дропы, трупы, транспорт, ресурсы)
------------------------------------------------------------

-- ... Здесь можно вставить код Object ESP (DroppedItems, Corpse, ATV, Ores, Copter, Car) с Drawing API —
-- если нужен полный рабочий Object ESP, скажи, и я вставлю классические циклы и логику, как выше!

------------------------------------------------------------
-- ФИНАЛ: Очистка ESP/Labels при выгрузке
------------------------------------------------------------
getgenv().TridentLibrary:OnUnload(function()
    -- ... (предыдущая очистка)
    for char, esp in pairs(activeEsp) do
        removeEspFor(char, esp)
    end
    -- ... (очистка Object ESP, если реализовано)
    if ESPHolder then ESPHolder:Destroy() end
end)

------------------------------------------------------------
-- ЧАСТЬ 5. ЛОГИКА: Object ESP (дропы, трупы, транспорт, руды)
------------------------------------------------------------

-- Кэш для Object ESP
local corpseLabels, droppedLabels, atvLabels, oreLabels, copterLabels, carLabels = {}, {}, {}, {}, {}, {}

-- DroppedItem ESP: ищем EntityMap через getgc
for _, v in pairs(getgc(true)) do
    local isTable, _ = pcall(function() return typeof(v) == "table" end)
    if isTable and typeof(v) == "table" then
        local hasEntityMap, _ = pcall(function() return v.EntityMap end)
        if hasEntityMap and v.EntityMap ~= nil and typeof(v.EntityMap) == "table" then
            entityMap = v.EntityMap
            break
        end
    end
end
local function cleanupLabels(tbl)
    for k, v in pairs(tbl) do
        if v then
            v.Visible = false
            v:Remove()
            tbl[k] = nil
        end
    end
end

-- ATV, Ore, Copter, Car поиски
local function findATVs()
    local atvs = {}
    for _, obj in pairs(workspace:GetChildren()) do
        if obj:FindFirstChild("Seat") and obj:FindFirstChild("Plastics") and obj.PrimaryPart then
            table.insert(atvs, obj)
        end
    end
    return atvs
end

local function findOres()
    local ores = {}
    for _, obj in pairs(workspace:GetChildren()) do
        if obj:IsA("Model") then
            local parts = {}
            for _, p in pairs(obj:GetChildren()) do
                if p:IsA("BasePart") then
                    table.insert(parts, p)
                end
            end
            local nitrate = false
            if #parts == 2 then
                for _, p in pairs(parts) do
                    if p.Color == Color3.fromRGB(248,248,248) and p.Material == Enum.Material.Slate then
                        table.insert(ores, {obj=obj, type="Nitrate", part=p})
                        nitrate = true
                        break
                    end
                end
            end
            if not nitrate then
                local stone = false
                if #parts == 1 then
                    local p = parts[1]
                    if p.Color == Color3.fromRGB(72,72,72) and p.Material == Enum.Material.Slate then
                        table.insert(ores, {obj=obj, type="Stone", part=p})
                        stone = true
                    end
                end
                if not stone then
                    if #parts == 2 then
                        for _, p in pairs(parts) do
                            if p.Color == Color3.fromRGB(199,172,120) and p.Material == Enum.Material.Slate then
                                table.insert(ores, {obj=obj, type="Iron", part=p})
                                break
                            end
                        end
                    end
                end
            end
        end
    end
    return ores
end

local function findCopters()
    local required = {"BodyDummy", "DarkMetal", "DarkPlastic", "Frame", "Glass", "Prop"}
    local copters = {}
    for _, obj in pairs(workspace:GetChildren()) do
        if obj:IsA("Model") then
            local found = 0
            for _, req in ipairs(required) do
                if obj:FindFirstChild(req) then
                    found = found + 1
                end
            end
            if found >= #required then
                table.insert(copters, obj)
            end
        end
    end
    return copters
end

local function findCars()
    local required = {"BLWheel", "BRWheel", "Body", "FLWheel", "FRWheel"}
    local cars = {}
    for _, obj in pairs(workspace:GetChildren()) do
        if obj:IsA("Model") then
            local found = 0
            for _, req in ipairs(required) do
                if obj:FindFirstChild(req) then
                    found = found + 1
                end
            end
            if found >= #required then
                table.insert(cars, obj)
            end
        end
    end
    return cars
end

------------------------------------------------------------
-- Главный цикл Object ESP
------------------------------------------------------------
RunService.RenderStepped:Connect(function()
    if not objectEspSettings.enabled then
        cleanupLabels(corpseLabels)
        cleanupLabels(droppedLabels)
        cleanupLabels(atvLabels)
        cleanupLabels(oreLabels)
        cleanupLabels(copterLabels)
        cleanupLabels(carLabels)
        return
    end

    local Camera = workspace.CurrentCamera

    -- Dropped Item ESP
    local droppedSeen = {}
    if entityMap and objectEspSettings.dropped.enabled then
        for id, entity in pairs(entityMap) do
            if entity.type == "DroppedItem" and entity.pos then
                local dist = (Camera.CFrame.Position - entity.pos).Magnitude
                if dist <= objectEspSettings.maxDistance then
                    droppedSeen[id] = true
                    if not droppedLabels[id] then
                        local label = Drawing.new("Text")
                        label.Size = 13
                        label.Color = objectEspSettings.dropped.color
                        label.Outline = true
                        label.OutlineColor = outlineColor
                        droppedLabels[id] = label
                    end
                    local label = droppedLabels[id]
                    local pos = entity.pos
                    local screenpos, onscreen = Camera:WorldToViewportPoint(pos)
                    if not objectEspSettings.name and not objectEspSettings.distance then
                        label.Text = ""
                        label.Visible = false
                    else
                        label.Visible = onscreen
                        if onscreen then
                            local itemName = entity.item or "Dropped"
                            local itemAmt = entity.amt or ""
                            local txt = ""
                            if objectEspSettings.name then txt = itemName end
                            if objectEspSettings.distance then
                                txt = txt .. (txt~="" and " " or "") .. string.format("%dm", math.floor(dist))
                            end
                            label.Text = txt~="" and txt or ("%s (%s) %dm"):format(itemName, tostring(itemAmt), dist)
                            label.Position = Vector2.new(screenpos.X - 30, screenpos.Y)
                            label.Color = objectEspSettings.dropped.color
                        end
                    end
                else
                    if droppedLabels[id] then droppedLabels[id].Visible = false end
                end
            else
                if droppedLabels[id] then droppedLabels[id].Visible = false end
            end
        end
    end
    for id, label in pairs(droppedLabels) do
        if not droppedSeen[id] then
            label.Visible = false
            label:Remove()
            droppedLabels[id] = nil
        end
    end

    -- Corpse ESP
    local corpseSeen = {}
    if objectEspSettings.corpse.enabled then
        for _, obj in pairs(workspace:GetChildren()) do
            local union = obj:FindFirstChildOfClass("UnionOperation")
            if union and union.Color == Color3.fromRGB(205,205,205) and obj.PrimaryPart then
                local dist = (Camera.CFrame.Position - obj.PrimaryPart.Position).Magnitude
                if dist <= objectEspSettings.maxDistance then
                    corpseSeen[obj] = true
                    if not corpseLabels[obj] then
                        local text = Drawing.new("Text")
                        text.Size = 13
                        text.Color = objectEspSettings.corpse.color
                        text.Outline = true
                        text.OutlineColor = outlineColor
                        corpseLabels[obj] = text
                    end
                    local label = corpseLabels[obj]
                    local pos, onscreen = Camera:WorldToViewportPoint(obj.PrimaryPart.Position)
                    if not objectEspSettings.name and not objectEspSettings.distance then
                        label.Text = ""
                        label.Visible = false
                    else
                        label.Visible = onscreen
                        if onscreen then
                            local txt = ""
                            if objectEspSettings.name then txt = "Corpse" end
                            if objectEspSettings.distance then
                                txt = txt .. (txt~="" and " " or "") .. string.format("%dm", math.floor(dist))
                            end
                            label.Text = txt~="" and txt or ("Corpse %dm"):format(dist)
                            label.Position = Vector2.new(pos.X - 30, pos.Y)
                            label.Color = objectEspSettings.corpse.color
                        end
                    end
                else
                    if corpseLabels[obj] then corpseLabels[obj].Visible = false end
                end
            else
                if corpseLabels[obj] then corpseLabels[obj].Visible = false end
            end
        end
    end
    for obj, label in pairs(corpseLabels) do
        if not corpseSeen[obj] or not obj.Parent then
            label.Visible = false
            label:Remove()
            corpseLabels[obj] = nil
        end
    end

    -- ATV ESP
    local atvSeen = {}
    if objectEspSettings.atv.enabled then
        local currentATVs = findATVs()
        for _, obj in pairs(currentATVs) do
            local dist = (Camera.CFrame.Position - obj.PrimaryPart.Position).Magnitude
            if dist <= objectEspSettings.maxDistance then
                atvSeen[obj] = true
                if not atvLabels[obj] then
                    local label = Drawing.new("Text")
                    label.Size = 13
                    label.Color = objectEspSettings.atv.color
                    label.Outline = true
                    label.OutlineColor = outlineColor
                    atvLabels[obj] = label
                end
                local label = atvLabels[obj]
                local pos, onscreen = Camera:WorldToViewportPoint(obj.PrimaryPart.Position)
                if not objectEspSettings.name and not objectEspSettings.distance then
                    label.Text = ""
                    label.Visible = false
                else
                    label.Visible = onscreen
                    if onscreen then
                        local txt = ""
                        if objectEspSettings.name then txt = "ATV" end
                        if objectEspSettings.distance then
                            txt = txt .. (txt~="" and " " or "") .. string.format("%dm", math.floor(dist))
                        end
                        label.Text = txt~="" and txt or ("ATV %dm"):format(dist)
                        label.Position = Vector2.new(pos.X - 30, pos.Y)
                        label.Color = objectEspSettings.atv.color
                    end
                end
            else
                if atvLabels[obj] then atvLabels[obj].Visible = false end
            end
        end
    end
    for obj, label in pairs(atvLabels) do
        if not atvSeen[obj] or not obj.Parent then
            label.Visible = false
            label:Remove()
            atvLabels[obj] = nil
        end
    end

    -- ORE ESP (Stone, Nitrate, Iron)
    local oreSeen = {}
    if objectEspSettings.stone.enabled or objectEspSettings.nitrate.enabled or objectEspSettings.iron.enabled then
        local ores = findOres()
        for _, ore in pairs(ores) do
            local obj = ore.obj
            oreSeen[obj] = true
            local dist = (Camera.CFrame.Position - ore.part.Position).Magnitude
            if dist <= objectEspSettings.maxDistance and (
                (ore.type=="Stone" and objectEspSettings.stone.enabled)
                or (ore.type=="Nitrate" and objectEspSettings.nitrate.enabled)
                or (ore.type=="Iron" and objectEspSettings.iron.enabled)
            ) then
                if not oreLabels[obj] then
                    local label = Drawing.new("Text")
                    label.Size = 13
                    label.Color = (
                        ore.type == "Stone" and objectEspSettings.stone.color or
                        ore.type == "Nitrate" and objectEspSettings.nitrate.color or
                        ore.type == "Iron" and objectEspSettings.iron.color
                    )
                    label.Outline = true
                    label.OutlineColor = outlineColor
                    oreLabels[obj] = label
                end
                local label = oreLabels[obj]
                local pos, onscreen = Camera:WorldToViewportPoint(ore.part.Position)
                if not objectEspSettings.name and not objectEspSettings.distance then
                    label.Text = ""
                    label.Visible = false
                else
                    label.Visible = onscreen
                    if onscreen then
                        local txt = ""
                        if objectEspSettings.name then txt = ore.type end
                        if objectEspSettings.distance then
                            txt = txt .. (txt~="" and " " or "") .. string.format("%dm", math.floor(dist))
                        end
                        label.Text = txt~="" and txt or ("%s %dm"):format(ore.type, dist)
                        label.Position = Vector2.new(pos.X - 30, pos.Y)
                        label.Color = (
                            ore.type == "Stone" and objectEspSettings.stone.color or
                            ore.type == "Nitrate" and objectEspSettings.nitrate.color or
                            ore.type == "Iron" and objectEspSettings.iron.color
                        )
                    end
                end
            else
                if oreLabels[obj] then oreLabels[obj].Visible = false end
            end
        end
    end
    for obj, label in pairs(oreLabels) do
        if not oreSeen[obj] or not obj.Parent then
            label.Visible = false
            label:Remove()
            oreLabels[obj] = nil
        end
    end

    -- COPTER ESP
    local copterSeen = {}
    if objectEspSettings.copter.enabled then
        local copters = findCopters()
        for _, obj in pairs(copters) do
            local posPart = obj:FindFirstChild("BodyDummy") or obj.PrimaryPart
            if posPart then
                local dist = (Camera.CFrame.Position - posPart.Position).Magnitude
                if dist <= objectEspSettings.maxDistance then
                    copterSeen[obj] = true
                    if not copterLabels[obj] then
                        local label = Drawing.new("Text")
                        label.Size = 13
                        label.Color = objectEspSettings.copter.color
                        label.Outline = true
                        label.OutlineColor = outlineColor
                        copterLabels[obj] = label
                    end
                    local label = copterLabels[obj]
                    local screenpos, onscreen = Camera:WorldToViewportPoint(posPart.Position)
                    if not objectEspSettings.name and not objectEspSettings.distance then
                        label.Text = ""
                        label.Visible = false
                    else
                        label.Visible = onscreen
                        if onscreen then
                            local txt = ""
                            if objectEspSettings.name then txt = "Copter" end
                            if objectEspSettings.distance then
                                txt = txt .. (txt~="" and " " or "") .. string.format("%dm", math.floor(dist))
                            end
                            label.Text = txt~="" and txt or ("Copter %dm"):format(dist)
                            label.Position = Vector2.new(screenpos.X - 30, screenpos.Y)
                            label.Color = objectEspSettings.copter.color
                        end
                    end
                else
                    if copterLabels[obj] then copterLabels[obj].Visible = false end
                end
            end
        end
    end
    for obj, label in pairs(copterLabels) do
        if not copterSeen[obj] or not obj.Parent then
            label.Visible = false
            label:Remove()
            copterLabels[obj] = nil
        end
    end

    -- CAR ESP
    local carSeen = {}
    if objectEspSettings.car.enabled then
        local cars = findCars()
        for _, obj in pairs(cars) do
            local posPart = obj:FindFirstChild("Body") or obj.PrimaryPart
            if posPart then
                local dist = (Camera.CFrame.Position - posPart.Position).Magnitude
                if dist <= objectEspSettings.maxDistance then
                    carSeen[obj] = true
                    if not carLabels[obj] then
                        local label = Drawing.new("Text")
                        label.Size = 13
                        label.Color = objectEspSettings.car.color
                        label.Outline = true
                        label.OutlineColor = outlineColor
                        carLabels[obj] = label
                    end
                    local label = carLabels[obj]
                    local screenpos, onscreen = Camera:WorldToViewportPoint(posPart.Position)
                    if not objectEspSettings.name and not objectEspSettings.distance then
                        label.Text = ""
                        label.Visible = false
                    else
                        label.Visible = onscreen
                        if onscreen then
                            local txt = ""
                            if objectEspSettings.name then txt = "Car" end
                            if objectEspSettings.distance then
                                txt = txt .. (txt~="" and " " or "") .. string.format("%dm", math.floor(dist))
                            end
                            label.Text = txt~="" and txt or ("Car %dm"):format(dist)
                            label.Position = Vector2.new(screenpos.X - 30, screenpos.Y)
                            label.Color = objectEspSettings.car.color
                        end
                    end
                else
                    if carLabels[obj] then carLabels[obj].Visible = false end
                end
            end
        end
    end
    for obj, label in pairs(carLabels) do
        if not carSeen[obj] or not obj.Parent then
            label.Visible = false
            label:Remove()
            carLabels[obj] = nil
        end
    end
end)

------------------------------------------------------------
-- Очистка Object ESP при выгрузке
------------------------------------------------------------
getgenv().TridentLibrary:OnUnload(function()
    cleanupLabels(corpseLabels)
    cleanupLabels(droppedLabels)
    cleanupLabels(atvLabels)
    cleanupLabels(oreLabels)
    cleanupLabels(copterLabels)
    cleanupLabels(carLabels)
end)

------------------------------------------------------------
-- END visual.lua (FULL)
------------------------------------------------------------
end
