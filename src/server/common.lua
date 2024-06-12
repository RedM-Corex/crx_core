-- [[ CRX Framework Core ]] --
CRX = {}
CRX.Version = (GetResourceMetadata(GetCurrentResourceName(), "version", 0) or "1.0.0")

exports('getSharedObject', function()
    return CRX
end)

-- [[ Local Core ]] --
Core = {}
Core.Players = {}
Core.PlayersByIdentifier = {}
