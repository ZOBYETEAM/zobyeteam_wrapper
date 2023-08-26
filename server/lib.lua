function GetPlayer(playerId)
    if not CurrentFramework then 
        return print('ERROR')
    end

    local Lib = {}

    local xPlayer = ESX.GetPlayerFromId(playerId)
    local Player = QBCore.Functions.GetPlayer(playerId)

    Lib.AddItem = function(playerId, itemName, count)
        if CurrentFramework == 'esx' then 
            xPlayer.addInventoryItem(itemName, count)
        elseif CurrentFramework == 'qbcore' then
            Player.Functions.AddItem(itemName, count, false)
        end
    end

    return Lib
end