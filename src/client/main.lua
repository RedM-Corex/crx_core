-- [[ Join Handler ]] --
CreateThread(function()
    while not NetworkIsPlayerActive(PlayerId()) do
        Wait(100)
    end

    exports.spawnmanager:setAutoSpawn(false)
    DoScreenFadeOut(0)
    Wait(500)
    TriggerServerEvent("crx-core:sv:playerJoined")
    
    DoScreenFadeIn(0) -- Tijdelijk
end)

-- [[ Misc Functions ]] --
CreateThread(function()
    if Config.HideOnlyDEADEYE then
        Citizen.InvokeNative(0xC116E6DF68DCE667, 2, 2) -- _HIDE_HUD_COMPONENT
        Citizen.InvokeNative(0xC116E6DF68DCE667, 3, 2) -- _HIDE_HUD_COMPONENT
    end

    local playerCores = {
        playerhealth = 0,
        playerhealthcore = 1,
        playerdeadeye = 3,
        playerdeadeyecore = 2,
        playerstamina = 4,
        playerstaminacore = 5,
    }
    if Config.HidePlayersCore then
        for _, value in pairs(playerCores) do
            Citizen.InvokeNative(0xC116E6DF68DCE667, value, 2) -- _HIDE_HUD_COMPONENT
        end
    end

    local horsecores = {
        horsehealth = 6,
        horsehealthcore = 7,
        horsedeadeye = 9,
        horsedeadeyecore = 8,
        horsestamina = 10,
        horsestaminacore = 11,
    }
    if Config.HideHorseCores then
        for _, value in pairs(horsecores) do
            Citizen.InvokeNative(0xC116E6DF68DCE667, value, 2) -- _HIDE_HUD_COMPONENT
        end
    end
    
    if Config.HideMiniMap then
        DisplayRadar(false)
    end

    ---@diagnostic disable-next-line: undefined-global
    DatabindingAddDataBoolFromPath('', 'bPauseMenuPhotoModeVisible', false)
    ---@diagnostic disable-next-line: undefined-global
    DatabindingAddDataBoolFromPath('', 'bEnablePauseMenuPhotoMode', false)

    local Events = {
        `EVENT_CHALLENGE_GOAL_COMPLETE`,
        `EVENT_CHALLENGE_REWARD`,
        `EVENT_DAILY_CHALLENGE_STREAK_COMPLETED`
    }

    while true do
        Wait(0)
        local event = GetNumberOfEvents(0)

        if event > 0 then
            for i = 0, event - 1 do
                local eventAtIndex = GetEventAtIndex(0, i)
                for _, value in pairs(Events) do
                    if eventAtIndex == value then
                        Citizen.InvokeNative(0x6035E8FBCA32AC5E) -- _UI_FEED_CLEAR_ALL_CHANNELS
                    end
                end
            end
        end

        if Config.disableAutoAIM then
            Citizen.InvokeNative(0xD66A941F401E7302, 3) -- SET_PLAYER_TARGETING_MODE
            Citizen.InvokeNative(0x19B4F71703902238, 3) -- _SET_PLAYER_IN_VEHICLE_TARGETING_MODE
        end
    end
end)