CreateThread(function()
    while not NetworkIsPlayerActive(PlayerId()) do
        Wait(100)
    end

    Wait(500)
    TriggerServerEvent("crx-core:sv:playerJoin")
end)