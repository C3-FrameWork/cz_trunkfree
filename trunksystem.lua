local trunkCoords = {
    { x = 0, y = 0, z = 0},
}

function IsNearTrunk(playerPed)
    local playerCoords = GetEntityCoords(playerPed, false)
    for _, coords in pairs(trunkCoords) do
        local distance = GetDistanceBetweenCoords(playerCoords, coords.x, coords.y, coords.z, true)
        if distance <= 1.5 then
            return true
        end
    end
    return false
end

RegisterNetEvent('cz_trunkfree:odpri')
AddEventHandler('cz_trunkfree:odpri', function()
    local playerPed = PlayerPedId()
    if IsPedInAnyVehicle(playerPed, false) then
        local vehicle = GetVehiclePedIsIn(playerPed, false)
        if DoesEntityExist(vehicle) then
            if IsNearTrunk(playerPed) then
                SetVehicleDoorOpen(vehicle, 5, false, false)
                TriggerEvent('chat:addMessage', { args = {'^1Prtljaznik je odprt!'}})
            else
                TriggerEvent('chat:addMessages', { args = {'^1Vi niste v bližini Prtljaznika!'}})
            end
        end
             else
               TriggerEvent('chat:addMessages', { args = {'^1Vi niste v vozilu!'}})
             end
            end)

            RegisterNetEvent('cz_trunkfree:zapri')
            AddEventHandler('cz_trunkfree:zapri', function()
                local playerPed = PlayerPedID()
                    if IsPedInAnyVehicle(playerPed, false) then
                local vehicle = GetVehiclePedIsIn(playerPed, false)
                    if DoesEntityExist(vehicle) then
                     if IsNearTrunk(playerPed) then
                    SetVehicleDoorOpen(vehicle, 5, false, false)
                    TriggerEvent('chat:addMessage', { args = {'^1Prtljaznik je zaprt!'}})
                    TriggerEvent('chat:addMessage', { args = {'^1Vi niste v vozilu!'}})
                     end
                    end)
                    