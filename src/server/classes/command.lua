function CreateCommand(name, options)
    if not name then
        CRX.Debug.Error("Command name is required.")
    end
    if not options or type(options) ~= table then
        CRX.Debug.Error(("Options for command %s are required."):format(name))
    end

    local self = {}

end