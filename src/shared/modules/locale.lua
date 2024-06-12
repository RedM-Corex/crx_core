Locales = {}

local locale = GetConvar("crx_locale", "en")

---@param resource string
local function loadResourceLocal(resource)
    local localeFile = LoadResourceFile(resource, "locales/" .. locale .. ".json")
    if not localeFile then
        localeFile = LoadResourceFile(resource, "locales/en.json")
    end

    return(json.decode(localeFile) or {})
end

---@param str string
---@param ... any
---@return string
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
CRX.Locale = CRX.Translate
-- You can now use CRX.Translate("key") or CRX.Locale("key") to get the translation of the key.
-- Example:
--     print(CRX.Translate("hello")) -- Will print the translation of "hello" in the locale file.
--     print(CRX.Locale("hello")) -- Will print the translation of "hello" in the locale file.

-- Example Using Placeholders:
--     print(CRX.Translate("welcome", "John")) -- Replace %s in the translation with "John".
--     print(CRX.Locale("welcome", "John")) -- Replace %s in the translation with "John".