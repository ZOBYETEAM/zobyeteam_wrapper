Config = {}

Config.ESXResourceName = 'es_extended'
Config.QBCoreResourceName = 'qb-core'

Config.UseESXImport = false
Config.ESXEvents = {
    ['getSharedObject'] = 'esx:getSharedObject',
}

Config.AutoFrameworkDetected = false
Config.FrameworkUsing = 'esx' -- esx or qbcore