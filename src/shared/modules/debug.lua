CRX.Debug = {}

--- @param message any
CRX.Debug.Info = function(message)
    local resource = GetInvokingResource()
    if resource then
        print("^1[".. resource .."] [INFO] ^7: " .. message)
    else
        print("^1[CRX] [INFO] ^7: " .. message)
    end
end

--- @param message any
CRX.Debug.Warn = function(message)
    local resource = GetInvokingResource()
    if resource then
        print("^1[".. resource .."] [WARN] ^7: " .. message)
    else
        print("^1[CRX] [WARN] ^7: " .. message)
    end
end

--- @param message any
CRX.Debug.Error = function(message)
    local resource = GetInvokingResource()
    if resource then
        print("^1[".. resource .."] [ERROR] ^7: " .. message)
    else
        print("^1[CRX] [ERROR] ^7: " .. message)
    end
end

CRX.Debug.info = CRX.Debug.Info
CRX.Debug.warn = CRX.Debug.Warn
CRX.Debug.error = CRX.Debug.Error