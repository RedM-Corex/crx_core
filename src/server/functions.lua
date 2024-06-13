---------------------------------------------------------
-- [[ Player ]] --
---------------------------------------------------------

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

---------------------------------------------------------
-- [[ Jobs ]] --
---------------------------------------------------------

-- [[ refresh jobs ]] --
CRX.RefreshJobs = function()
    local Jobs = {}
    local jobs = MySQL.Sync.fetchAll("SELECT * FROM `jobs`")

    for _, v in ipairs(jobs) do
        Jobs[v.name] = v
        Jobs[v.name].grades = {}
    end

    local grades = MySQL.Sync.fetchAll("SELECT * FROM `job_grades`")

    for _, v in ipairs(grades) do
        Jobs[v.job_name].grades[v.grade] = v
    end

    for k, v in pairs(Jobs) do
        if next(v.grades) == nil then
            Jobs[k] = nil
            CRX.Debug.Warn(("Job %s has no grades."):format(k))
        end
    end

    if next(Jobs) == nil or Jobs["unemployed"] == nil then
        Jobs["unemployed"] = { label = "Unemployed", grades = { ["0"] = { grade = 0, label = "Unemployed", salary = 200, skin_male = {}, skin_female = {} } } }
        CRX.Debug.Warn("Not Jobs found or no unemployed job!")
    end

    CRX.Debug.Info(("Loaded %s jobs."):format(#jobs))

    CRX.Jobs = Jobs
end


-- [[ GetJob ]] --
---@param name string
---@return table | boolean
CRX.GetJob = function(name)
    return (CRX.Jobs[name] or false)
end

-- [[ DoesJobExist ]] --
---@param name string
---@return boolean
CRX.DoesJobExist = function(name)
    return (CRX.Jobs[name] ~= nil)
end

---------------------------------------------------------
-- [[ Misc ]] --
---------------------------------------------------------
CRX.Commands = {}
CRX.CreateCommand = function(commandName, options)
    if CRX.Commands[commandName] then
        CRX.Debug.Warn(("Command %s already exists."):format(commandName))
        return
    end

    if not commandName then
        CRX.Debug.Error("Command name is required.")
        return
    end

    if not options or type(options) ~= "table" then
        CRX.Debug.Error(("Options for command %s are required."):format((type(commandName) == table and commandName[1] or commandName)))
        return
    end

    CreateCommand(commandName, options)
end


---------------------------------------------------------
-- [[ Log ]] --
---------------------------------------------------------
CRX.Log = {}