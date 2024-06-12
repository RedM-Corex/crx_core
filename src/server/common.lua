-- [[ CRX Framework Core ]] --
CRX = {}
CRX.Version = (GetResourceMetadata(GetCurrentResourceName(), "version", 0) or "1.0.0")

exports('CRX', function()
    return CRX
end)

-- [[ Local Core ]] --
Core = {}
Core.Players = {}
Core.PlayersByIdentifier = {}

-- [[ GetIdentifier ]] --
---@param source number 
---@return string | boolean
CRX.GetIdentifier = function(source)
    ---@diagnostic disable-next-line: param-type-mismatch -- source is a number
    local license = GetPlayerIdentifierByType(source, 'license')
    if license then
        license = license:gsub("license:", "")
        return license
    end

    return false
end

-- [[ GetPlayerByIdentifier ]] --
---@param identifier string
---@return boolean | table
CRX.GetPlayerByIdentifier = function(identifier)
    return (Core.PlayersByIdentifier[identifier] or false)
end

-- [[ GetPlayerById ]] --
---@param source number
---@return boolean | table
CRX.GetPlayerById = function(source)
    return (Core.Players[source] or false)
end

-- [[ Debug ]] --
CRX.Debug = {}

--- @param message any
CRX.Debug.Info = function(message)
    print("^1[CRX] [INFO] ^7: " .. message)
end

--- @param message any
CRX.Debug.Warn = function(message)
    print("^3[CRX] [WARN] ^7: " .. message)
end

--- @param message any
CRX.Debug.Error = function(message)
    print("^1[CRX] [ERROR] ^7: "    .. message)
end

CRX.Debug.info = CRX.Debug.Info
CRX.Debug.warn = CRX.Debug.Warn
CRX.Debug.error = CRX.Debug.Error

