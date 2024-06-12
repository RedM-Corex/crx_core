Locales = {}

local locale = GetConvar("crx_locale", "en")

local function loadResourceLocal(resource)
    local localeFile = LoadResourceFile(resource, "locales/" .. locale .. ".json")
    if not localeFile then
        localeFile = LoadResourceFile(resource, "locales/en.json")
    end

    return(json.decode(localeFile) or {})
end

function CRX.Translate(str, ...)
    local resource = (GetInvokingResource() or GetCurrentResourceName())

    if not Locales[resource] then
        Locales[resource] = loadResourceLocal(resource)
    end

    local locale = Locales[resource]

    if locale[str] then
        return string.format(locale[str], ...)
    end

    CRX.Debug.Warn("Translation not found for: " .. str)
    return str
end