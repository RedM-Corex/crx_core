local oneSyncState = GetConvar("onesync", "off")

RegisterNetEvent("crx-core:sv:playerJoined", function()
    local src = source

    if not Core.Players[src] then
        OnPlayerJoined(src)
    end
end)

function OnPlayerJoined(source)
    local identifier = CRX.GetIdentifier(source)
    


end




-- [[  ]] --
AddEventHandler("playerConnecting", function(_, _, deferrals)
    deferrals.defer()
    local playerId = source

    if oneSyncState == "off" or oneSyncState == "legacy" then
        deferrals.done("You are not using OneSync, please enable it to play on this server.")
        CRX.Debug.Error("Enable OneSync to play on the server.")
        return
    end

    -- Check if the player already connected
    local identifier = CRX.GetIdentifier(playerId)
    if identifier then
        ---@diagnostic disable-next-line: param-type-mismatch
        if CRX.GetPlayerByIdentifier(identifier) then
            deferrals.done("You are already connected to the server.")
            CRX.Debug.Warn(("Player %s tried to connect but there is already a active player."):format(identifier))
            return
        end
    else
        deferrals.done("Failed to get your identifier.")
        return
    end




    CRX.Debug.Info(("Player %s connected to the server."):format(identifier))
    deferrals.done()
end)