ESX = nil
QBCore = nil

CurrentFramework = nil

function ImportESX()
    if Config.UseESXImportVersion then
        ESX = exports[Config.ESXResourceName]:getSharedObject()
    else
        while ESX == nil do
            TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
            Wait(0)
        end
    end

    CurrentFramework = 'esx'
end

function ImportQBCore()
    QBCore = exports[Config.QBCoreResourceName]:GetCoreObject()

    CurrentFramework = 'qbcore'
end

if Config.AutoFrameworkDetected then 

    if GetResourceState(Config.ESXResourceName) == 'started' then 
        ImportESX()
    elseif GetResourceState(Config.ESXResourceName) == 'started' then
        ImportQBCore()
    else
        -- break
    end

else

    if Config.FrameworkUsing == 'esx' then
        ImportESX()
    elseif Config.FrameworkUsing == 'qbcore' then
        ImportQBCore()
    else
        -- break    
    end
end

function GetPlayerAccount(type)
    if CurrentFramework == 'esx' then
        local accounts = ESX.GetPlayerData().accounts

        for _, account in ipairs(accounts) do
            if account.name == type then
                return account.money
            end
        end
    
        return 0
    elseif CurrentFramework == 'qbcore' then
        type = type == 'money' and 'cash' or type

        return QBCore.Functions.GetPlayerData().money[type] or 0
    end
end
exports('GetPlayerAccount', GetPlayerAccount)

function GetItemLabel(itemName)
    if CurrentFramework == 'esx' then
        local inventory = ESX.GetPlayerData().inventory

        for _, item in ipairs(inventory) do
            if item.name == itemName then
                return item.label
            end
        end
    
        return nil
    elseif CurrentFramework == 'qbcore' then
        return QBCore.Shared.Items[itemName].label
    end
end
exports('GetItemLabel', GetItemLabel)

function GetPlayerJob()
    if CurrentFramework == 'esx' then
        return ESX.GetPlayerData().job
    elseif CurrentFramework == 'qbcore' then
        return QBCore.Functions.GetPlayerData().job
    end
end
exports('GetPlayerJob', GetPlayerJob)

function GetPlayerName()
    if CurrentFramework == 'esx' then
        return ESX.GetPlayerData().name
    elseif CurrentFramework == 'qbcore' then
        return QBCore.Functions.GetPlayerData().name
    end
end
exports('GetPlayerName', GetPlayerName)
