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