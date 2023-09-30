local callbackNames = {}

local lib = {
    callback = {}
}
function lib.callback.register(name, cb)
    callbackNames[name] = cb
end

RegisterNetEvent('zobyeteam_lib:request', function(name, requestId, ...)
    local playerId = source

    -- Don't name thos callback name
    if not callbackNames[name] then return end
    
    TriggerClientEvent('zobyeteam_lib:result', playerId, requestId, callbackNames[name](playerId, ...))
end)

-- Mockup Register Callback
lib.callback.register('zobyeteam_inventory:getName', function(playerId, message)
    return { playerId = playerId, name = 'Takzobye', message = message }
end)