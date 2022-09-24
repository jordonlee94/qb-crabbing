local moneyType = 'cash'
local priceTable = {
    bluecrab = 50,
    coconutcrab = 120,
    heikegani = 132,
    hermitcrab = 165,
    lobster2 = 193,
    lobster = 220,
    rockcrab = 220,
    kingcrab = 440,
    horseshoecrab = 440,
    horsehaircrab = 450,
    peacrab = 500
}

RegisterNetEvent('qb-crabbing:server:Sellcrab', function(crab, amount)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    if not Player then return end
    if type(crab) ~= 'string' or type(amount) ~= 'number' then return end

    -- Distance Exploit Check
    if #(GetEntityCoords(GetPlayerPed(src)) - Shared.SellLocation.xyz) > 5.0 then
        exports['qb-core']:ExploitBan(src, 'crabbing-sell-crab')
        return
    end

    local item = Player.Functions.GetItemByName(crab)
    if not item then return end
    if not priceTable[crab] then return end
    if item.amount >= amount then
        if exports['qb-inventory']:RemoveItem(Player.PlayerData.source, item.name, amount, false) then
            -- Item Box
            TriggerClientEvent('inventory:client:ItemBox', Player.PlayerData.source, QBCore.Shared.Items[item.name], 'remove', amount)

            -- Wait to sync with animation
            Wait(3500)

            -- Give Cash
            Player.Functions.AddMoney(moneyType, amount * priceTable[item.name])

            -- Log
            TriggerEvent('qb-log:server:CreateLog', 'crabbing', 'Sale crab', 'lightgreen', "**"..Player.PlayerData.name .. " (citizenid: "..Player.PlayerData.citizenid.." | id: "..Player.PlayerData.source..")** received $"..amount * priceTable[item.name].." for selling "..amount.."x "..QBCore.Shared.Items[item.name].label)

            -- Notification
            TriggerClientEvent('QBCore:Notify', Player.PlayerData.source, 'You received $'..amount * priceTable[item.name]..' for selling your '..QBCore.Shared.Items[item.name].label, 'success', 2500)
        end
    end
end)

QBCore.Functions.CreateCallback('qb-crabbing:server:CanSell', function(source, cb, crab, amount)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    if not Player then return end
    if type(crab) ~= 'string' or type(amount) ~= 'number' then return end

    -- Distance Exploit Check
    if #(GetEntityCoords(GetPlayerPed(src)) - Shared.SellLocation.xyz) > 5.0 then
        exports['qb-core']:ExploitBan(src, 'crabbing-can-sell')
        return
    end

    local item = Player.Functions.GetItemByName(crab)
    if not item then return end

    if item.amount >= amount then
        cb(true)
    else
        cb(false)
    end
end)
