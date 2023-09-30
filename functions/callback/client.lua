local waitingResults = {}

local function getUniqeRequestId(name)
    local requestId

    repeat
		requestId = ('%s:%s'):format(name, math.random(0, 100000)) -- math.random(0, 100000)
	until not waitingResults[requestId]

    return requestId
end

local function triggerServerCallback(_, name, cb, ...)
    local requestId = getUniqeRequestId(name)

    TriggerServerEvent('zobyeteam_lib:request', name, requestId, ...)

    local promise = not cb and promise.new()

    waitingResults[requestId] = function(...)
        local response = { ... }
        waitingResults[requestId] = nil
        
        if promise then promise:resolve({ ... }) end
        if cb then cb(table.unpack(response)) end
    end 

    if promise then 
        return table.unpack(Citizen.Await(promise))
    end
end

ZBT.Callback = setmetatable({}, {
	__call = triggerServerCallback
})

function ZBT.Callback.Await(name, ...)
    return triggerServerCallback(nil, name, false, ...)
end

RegisterNetEvent('zobyeteam_lib:result', function(requestId, ...)
    if not waitingResults[requestId] then return end

    waitingResults[requestId](...)
end)

--[[

    Callback
    ZBT.Callback(name, function(parms...)
        
    end, args)

    Await
    local response = ZBT.Callback.Await(name, args...)

]]