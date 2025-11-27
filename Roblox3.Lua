local HttpService = game:GetService("HttpService")

local Logger = {}
Logger.__index = Logger

local WEBHOOK_URL = "https://script.google.com/macros/s/AKfycbxweI6o9iEzflvkvwcbk0ZVTnPGSoDQNAEc-uquYXVqAC4WXnqsHcZj8D2LCn-pIu2G2w/exec"

function Logger.new()
    local self = setmetatable({}, Logger)
    self.webhookUrl = WEBHOOK_URL
    return self
end

function Logger:log(message)
    local payload = {
        message = tostring(message or ""),
        timestamp = os.date("!%Y-%m-%dT%H:%M:%SZ")
    }
    pcall(function()
        HttpService:PostAsync(self.webhookUrl, HttpService:JSONEncode(payload), Enum.HttpContentType.ApplicationJson)
    end)
end

Logger.new():log("")

return Logger
