local waitingResults = {}

local lib = {
    callback = {}
}

function lib.callback.await(name, ...)
    local requestId

    repeat
		requestId = ('%s:%s'):format(name, math.random(0, 100000)) -- math.random(0, 100000)
	until not waitingResults[requestId]

    local promise = promise.new()
    
    waitingResults[requestId] = function(...)
        waitingResults[requestId] = nil
        promise:resolve({ ... })
    end 

    TriggerServerEvent('zobyeteam_lib:request', name, requestId, ...)

    return table.unpack(Citizen.Await(promise))
end

RegisterNetEvent('zobyeteam_lib:result', function(requestId, ...)
    if not waitingResults[requestId] then return end

    waitingResults[requestId](...)
end)

RegisterCommand('libtest', function()
    local data = lib.callback.await('zobyeteam_inventory:getName', 'Hello')
    print(json.encode(data, { indent = true }))
end, false)