function GetPlayer(playerId)
    if not CurrentFramework then 
        return print('ERROR FRAMEWORK')
    end

    if not playerId then
        return print('ERROR Player Id')
    end

    local Lib = {}

    local xPlayer = ESX.GetPlayerFromId(playerId)
    local Player = QBCore.Functions.GetPlayer(playerId)

    Lib.AddItem = function(itemName, amount)
        if CurrentFramework == 'esx' then 
            xPlayer.addInventoryItem(itemName, amount)
        elseif CurrentFramework == 'qbcore' then
            Player.Functions.AddItem(itemName, amount, false)
        end
    end

    Lib.RemoveItem = function(itemName, amount)
        if CurrentFramework == 'esx' then 
            xPlayer.removeInventoryItem(itemName, amount)
        elseif CurrentFramework == 'qbcore' then
            Player.Functions.RemoveItem(itemName, amount, false)
        end
    end

    Lib.AddMoney = function(type, amount)
        if CurrentFramework == 'esx' then
            if Config.UseESXImportVersion then 
                xPlayer.addAccountMoney(type, money)
            else
                if type == 'cash' or type == 'money' then 
                    xPlayer.addMoney(amount)
                elseif type == 'bank' then
                    xPlayer.addAccountMoney('bank', amount)
                end
            end            
        elseif CurrentFramework == 'qbcore' then
            if type == 'cash' or type == 'money' then
                Player.Functions.AddMoney('cash', amount)
            elseif type == 'bank' then
                Player.Functions.AddMoney('bank', amount)
            end
        end
    end

    Lib.RemoveMoney = function(type, amount)
        if CurrentFramework == 'esx' then 
            if Config.UseESXImportVersion then 
                xPlayer.removeAccountMoney(type, amount)
            else
                if type == 'cash' or type == 'money' then 
                    xPlayer.removeMoney(amount)
                elseif type == 'bank' then
                    xPlayer.removeAccountMoney('bank', amount)
                end
            end            
        elseif CurrentFramework == 'qbcore' then
            if type == 'cash' or type == 'money' then
                Player.Functions.RemoveMoney('cash', amount)
            elseif type == 'bank' then
                Player.Functions.RemoveMoney('bank', amount)
            end
        end
    end

    Lib.GetAccount = function(type)
        if CurrentFramework == 'esx' then 
            return xPlayer.getAccount(type).money
        elseif CurrentFramework == 'qbcore' then
            type = type == 'money' and 'cash' or type

            return Player.PlayerData.money[type]
        end
    end

    Lib.GetJob = function(type)
        if CurrentFramework == 'esx' then 
            return xPlayer.getJob()
        elseif CurrentFramework == 'qbcore' then
            return Player.PlayerData.job
        end
    end

    

    return Lib
end
exports('GetPlayer', GetPlayer)

function RegisterUsableItem(itemName, cb)
    if CurrentFramework == 'esx' then
        ESX.RegisterUsableItem(itemName, cb)
    elseif CurrentFramework == 'qbcore' then
        QBCore.Functions.CreateUseableItem(itemName, cb)
    end
end
exports('RegisterUsableItem', RegisterUsableItem)