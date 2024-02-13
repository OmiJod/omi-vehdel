lib.callback.register('checkVehicleOwnership', function(source, plate)
    local plateClean = plate:gsub("^%s*(.-)%s*$", "%1") 
    local tableName = "owned_vehicles"

    if Config.FrameWork == "qb" or Config.FrameWork == "qbx" then
        tableName = "player_vehicles"
    end

    local query = ("SELECT plate FROM %s WHERE plate = @plate"):format(tableName)
    local result = MySQL.Sync.fetchScalar(query, {['@plate'] = plateClean})
    return not result 
end)