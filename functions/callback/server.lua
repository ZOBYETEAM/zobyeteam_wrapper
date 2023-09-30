local callbackNames = {}

ZBT.Callback = {}

function ZBT.Callback.Register(name, cb)
    callbackNames[name] = cb
end

RegisterNetEvent('zobyeteam_lib:request', function(name, requestId, ...)
    local playerId = source

    if not callbackNames[name] then return end
    
    TriggerClientEvent('zobyeteam_lib:result', playerId, requestId, callbackNames[name](playerId, ...))
end)

-- Mockup Register Callback
ZBT.Callback.Register('zobyeteam_inventory:getName', function(playerId, message)
    return { playerId = playerId, name = 'Takzobye', message = message }
end)
exports('CallbackRegister', ZBT.Callback.Register)

--[[

    ZBT.Callback.Register(name, function(params...)
        return ...
    end)

]]