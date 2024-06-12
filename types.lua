--------------------------------------------------------------------------------
-- # Client
--------------------------------------------------------------------------------


--------------------------------------------------------------------------------
-- # Server
--------------------------------------------------------------------------------


-- [[ src/server/main.lua ]] --




-- [[ src/server/functions.lua ]] --
---@class CRX.GetIdentifier
---@field source number
---@return string | boolean

---@class CRX.GetPlayerByIdentifier
---@field identifier string
---@return boolean | table

---@class CRX.GetPlayerById
---@field source number
---@return boolean | table


--------------------------------------------------------------------------------
-- # Shared
--------------------------------------------------------------------------------
-- [[ src/shared/modules/debug.lua ]] ---
---@class CRX.Debug.Info
---@field message string

---@class CRX.Debug.Warn
---@field message string

---@class CRX.Debug.Error
---@field message string

-- [[ src/shared/modules/locale.lua ]] ---