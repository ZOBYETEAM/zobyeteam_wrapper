Config = {}

Config.ESXResourceName = 'es_extended'
Config.QBCoreResourceName = 'qb-core'

Config.UseESXImportVersion = true
Config.ESXEvents = {
    ['getSharedObject'] = 'esx:getSharedObject',
}

Config.AutoFrameworkDetected = true
Config.FrameworkUsing = 'esx' -- esx or qbcore