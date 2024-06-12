

RegisterNetEvent("crx-core:sv:playerJoined", function()
    local src = source

    if not Core.Players[src] then
        onPlayerJoined(src)
    end
end)


function onPlayerJoined(source)


end