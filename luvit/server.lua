local weblit = require('weblit')
local fs = require('fs')
local path = require('path')

-- Improved Bits function
local function Bits(num)
    -- Handle 0 as a special case
    if num == 0 then return "0" end

    -- Ensure num is a positive integer
    num = math.floor(math.abs(num))

    local t = {}
    while num > 0 do
        local rest = num % 2
        table.insert(t, 1, rest)
        num = (num - rest) / 2
    end
    return table.concat(t)
end

weblit.app
    .bind({ host = "127.0.0.1", port = 1337 })
    .use(weblit.logger)
    .use(weblit.autoHeaders)

-- Static file serving middleware
    .use(function(req, res, go)
        -- Only handle GET requests for static files
        if req.method ~= "GET" then return go() end

        -- Define the public directory path
        local publicDir = path.join(process.cwd(), "public")

        -- Construct the file path
        local filePath = path.join(publicDir,
            req.path == "/" and "index.html" or req.path)

        -- Check if file exists
        local success, err = pcall(function()
            local stat = fs.statSync(filePath)

            -- Read and serve the file
            local content = fs.readFileSync(filePath)

            -- Determine content type
            local ext = path.extname(filePath)
            local contentTypes = {
                [".html"] = "text/html",
                [".css"] = "text/css",
                [".js"] = "application/javascript"
            }

            res.body = content
            res.code = 200
            res.headers["Content-Type"] = contentTypes[ext] or "text/plain"
        end)

        -- If file not found, pass to next middleware
        if not success then return go() end
    end)

-- Conversion route for HTMX
    .route({ method = "POST", path = "/convert" }, function(req, res)
        -- Parse the form data
        local body = req.body
        local number = tonumber(body:match("number=([^&]+)"))

        if not number then
            res.body = "Invalid input"
            res.code = 400
        else
            -- Convert to binary and prepare response
            local binary = Bits(number)
            res.body = string.format("Binary: %s", binary)
            res.code = 200
        end

        res.headers["Content-Type"] = "text/plain"
    end)

    .start()

print("Server running on http://127.0.0.1:1337")
