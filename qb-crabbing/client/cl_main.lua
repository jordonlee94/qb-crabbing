QBCore = exports['qb-core']:GetCoreObject()

local cancrabh = false
local iscrabbing = false
local crabbingrod

--- Method to perform crabbing animation
--- @return nil
local crabAnimation = function()
    -- Remove crabbing Bait
    TriggerServerEvent('qb-crabbing:server:RemoveBait')

    -- Throw Bait Animation
    local ped = PlayerPedId()
    RequestAnimDict('mini@tennis')
    while not HasAnimDictLoaded('mini@tennis') do Wait(0) end
    TaskPlayAnim(ped, 'mini@tennis', 'forehand_ts_md_far', 1.0, -1.0, 1.0, 48, 0, 0, 0, 0)
    while IsEntityPlayingAnim(ped, 'mini@tennis', 'forehand_ts_md_far', 3) do Wait(0) end

    -- crab Animation
    RequestAnimDict('amb@world_human_stand_fishing@idle_a')
    while not HasAnimDictLoaded('amb@world_human_stand_fishing@idle_a') do Wait(0) end
    TaskPlayAnim(ped, 'amb@world_human_stand_fishing@idle_a', 'idle_c', 1.0, -1.0, 1.0, 10, 0, 0, 0, 0)
    Wait(math.random(Shared.CastTimeMin, Shared.CastTimeMax) * 1000)
    
    -- Minigame
    exports['ps-ui']:Circle(function(success)
        if success then
            TriggerServerEvent('hud:server:RelieveStress', 2)
            TriggerServerEvent('qb-crabbing:server:Receivecrab')
        else
            QBCore.Functions.Notify('The crab got away!', 'error', 2500)
            TriggerServerEvent('hud:server:RelieveStress', 1)
        end
    end, math.random(Shared.MinigameCirclesMin, Shared.MinigameCirclesMax), Shared.MinigameTime)

    -- Finishing up
    ClearPedTasks(ped)
    DeleteObject(crabbingrod)
    iscrabbing = false
end

--- Method to create a crabbing rod prop and return the object
--- @return crabbingrod number - Entity number
local startcrabbing = function()
    -- Spam Prevent
    if iscrabbing then return end
    iscrabbing = true

    -- Load crabbing Rod Model
    local crabbingrodHash = `prop_fishing_rod_01`
    if not IsModelValid(crabbingrodHash) then return end
    if not HasModelLoaded(crabbingrodHash) then RequestModel(crabbingrodHash) end
    while not HasModelLoaded do Wait(0) end

    -- Create Object and attach on player ped
    local ped = PlayerPedId()
    local pedCoords = GetEntityCoords(ped)
    local object = CreateObject(crabbingrodHash, pedCoords, true, false, false)
    AttachEntityToEntity(object, ped, GetPedBoneIndex(ped, 18905), 0.1, 0.05, 0, 80.0, 120.0, 160.0, true, true, false, true, 1, true)
    SetModelAsNoLongerNeeded(object)
    crabbingrod = object
    crabAnimation()
end

RegisterNetEvent('qb-crabbing:client:crabbingrod', function()
    -- Check if inside crabbing zone
    if not cancrab then
        QBCore.Functions.Notify('You can\'t crab over here..', 'error', 2500)
        return
    end

    -- Check if player has crabbingbait
    local hasItem = QBCore.Functions.HasItem("crabbingbait")
    if hasItem then
        -- Start crabbing
        startcrabbing()
    else
        QBCore.Functions.Notify('You need both a crabbing rod and bait to start crabbing..', 'error', 2500)
    end
end)

CreateThread(function()
    -- Start with empty array (for ComboZone)
    local zones = {}

    -- Create individual crabbing zones and add them to the array
    for k, v in pairs(Shared.crabbingZones) do
        if v.box then -- BoxZone
            zones[#zones+1] = BoxZone:Create(v.coords, v.length, v.width, {
                name = "crabbingZones"..k,
                minZ = v.minZ,
                maxZ = v.maxZ,
                debugPoly = false
            })
        else -- PolyZone
            zones[#zones+1] = PolyZone:Create(v.points, {
                name = "crabbingZones"..k,
                minZ = v.minZ,
                maxZ = v.maxZ,
                debugGrid = false,
            })
        end
    end

    -- Create ComboZone
    local crabbingCombo = ComboZone:Create(zones, {
        name = "crabbingCombo", 
        debugPoly = false
    })

    -- Enter/Exit crabbing Zone
    crabbingCombo:onPlayerInOut(function(isPointInside, point, zone)
        if isPointInside then
            exports['qb-core']:DrawText('crabbing', 'left')
            cancrab = true
        else
            exports['qb-core']:HideText()
            cancrab = false
        end
    end)
end)