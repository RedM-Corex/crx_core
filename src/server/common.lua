-- [[ CRX Framework Core ]] --
CRX = {}
CRX.Version = (GetResourceMetadata(GetCurrentResourceName(), "version", 0) or "1.0.0")
CRX.Items = {}

exports('getSharedObject', function()
    return CRX
end)

-- [[ Local Core ]] --
Core = {}
Core.Players = {}
Core.PlayersByIdentifier = {}
Core.DatabaseConnected = false

MySQL.ready(function()
    Core.DatabaseConnected = true
    CRX.Debug.Info("Database connected successfully.")
end)