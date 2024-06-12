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
    CRX.Debug.Info("Database connected")
    
    local items = MySQL.Sync.fetchAll("SELECT * FROM `players`")
    for _, v in ipairs(items) do
        CRX.Items[v.name] = {label = v.label, weight = v.weight, canRemove = v.canRemove}
    end

    CRX.Debug.Info(("Loaded %s items."):format(#items))

end)