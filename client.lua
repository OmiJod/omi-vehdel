CreateThread(function()
    for k, v in pairs(Config.Zones) do
        local sphere = lib.zones.sphere({
            coords = v.coords,
            radius = v.radius,
            debug = v.debug,
        })
    end
end)

CreateThread(function()
    while true do
        Wait(1000)
        for k, v in pairs(Config.Zones) do
            local vehicles = lib.getNearbyVehicles(v.coords, v.radius)
            
            for _, vehicleData in ipairs(vehicles) do
                local vehicle = vehicleData.vehicle
                local plate = GetVehicleNumberPlateText(vehicle)
                plate = plate:gsub("^%s*(.-)%s*$", "%1")
                local isNotOwned = lib.callback.await('checkVehicleOwnership', false, plate)
                if isNotOwned then
                    SetEntityAsMissionEntity(vehicle, true, true)
                    DeleteVehicle(vehicle)
                end
            end
        end
    end
end)
