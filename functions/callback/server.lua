local callbackNames = {}

ZBT.Callback = {}

function ZBT.Callback.Register(name, cb)
    callbackNames[name] = cb
end
exports('CallbackRegister', ZBT.Callback.Register)

RegisterNetEvent('zobyeteam_lib:request', function(name, requestId, ...)
    local playerId = source

    if not callbackNames[name] then return end
    
    TriggerClientEvent('zobyeteam_lib:result', playerId, requestId, callbackNames[name](playerId, ...))
end)

--[[

    ZBT.Callback.Register(name, function(params...)
        return ...
    end)

]]