local function read_file(filename)
    local file = io.open(filename, "r")
    if not file then
        return nil
    end
    local content = file:read("*a")
    file:close()
    return content
end

local function get_word_definition(data, word)
    local entries = data["data"]
    if entries then
        local entry = entries[word]
        if entry and entry["def"] and entry["def"]["en"] then
            return entry["def"]["en"]
        end
    end
    return nil
end

local function parse_json(data)
    local success, result = pcall(function() return load("return " .. data)() end)
    return success and result or nil
end

local function main()
    local filename = "data.txt"
    local data = read_file(filename)
    if not data then
        print("Error: Unable to read data from the file.")
        return
    end

    data = parse_json(data)
    if not data then
        print("Error: Invalid JSON data.")
        return
    end

    local word = "kepeken" -- Replace with the word you want to look up
    local definition = get_word_definition(data, word)
    if definition then
        print(string.format("The English definition of '%s' is: %s", word, definition))
    else
        print(string.format("No English definition found for '%s'.", word))
    end
end

main()

