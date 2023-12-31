ESX = nil
QBCore = nil

CurrentFramework = nil

function ImportESX()
    if Config.UseESXImportVersion then
        ESX = exports[Config.ESXResourceName]:getSharedObject()
    else
        TriggerEvent(Config.ESXEvents['getSharedObject'], function(obj) ESX = obj end)
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