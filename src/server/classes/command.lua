function CreateCommand(commandName, options)
    if not commandName then
        CRX.Debug.Error("Command name is required.")
    end
    if not options or type(options) ~= table then
        CRX.Debug.Error(("Options for command %s are required."):format(commandName))
    end
    if type(commandName) == "table" then
        for _, name in pairs(commandName) do
            CreateCommand(name, options)
        end
        return
    end

    local self = {}

    self.name = commandName

    if options.description then
        self.description = (options.description or "No description.")
    end

    if options.permission then
        self.permission = (options.permission or "user")
    end

    if options.arguments then
        self.arguments = (options.arguments or {})
    end

    if options.callback then
        self.callback = (options.callback or function(source, args, rawcommand) end)
    end

    if options.consoleOnly then
        self.consoleOnly = (options.consoleOnly or false)
    end


    RegisterCommand(commandName, function(source, args, rawcommand)
        if self.consoleOnly and source ~= 0 then
            return
        end

        if source == 0 then
            self.callback(source, args, rawcommand)
            return
        end

        local player = CRX.GetPlayerById(source)
        if not player then
            return
        end

        

    
    
    end, false)

end