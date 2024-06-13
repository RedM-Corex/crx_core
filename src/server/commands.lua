CRX.CreateCommand("test", {
    description = "Test command",
    callback = function(source, args, rawCommand)
        print("Test command executed.")
    end
})