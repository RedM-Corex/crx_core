Config = {}


-- [[ Economy ]] --



-- [[ Admins ]] --
Config.Groups = {
    -- ["user"] = true, -- Example ( Default )
    ["admin"] = true, -- Example ( Admin )
    ["mod"] = true, -- Example ( Moderator )
}

-- [[ Misc ]] --
Config.HideOnlyDEADEYE = true
Config.HidePlayersCore = true
Config.HideHorseCores = true
Config.HideMiniMap = true

Config.RequireIdentifiers = {
    "license", -- Required
    "steam",   -- Recommended 
    "discord", -- Recommended 
    -- "xbl",
    -- "live",
}