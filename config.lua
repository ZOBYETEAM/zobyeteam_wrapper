Config = {}

Config.ESXResourceName = 'es_extended'
Config.QBCoreResourceName = 'qb-core'

Config.UseESXImportVersion = true
Config.ESXEvents = {
    ['getSharedObject'] = 'esx:getSharedObject',
}

Config.AutoFrameworkDetected = false
Config.FrameworkUsing = 'esx' -- esx or qbcore