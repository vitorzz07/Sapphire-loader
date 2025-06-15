local HttpService = game:GetService("HttpService")

local key = getgenv().Key or "nil"
local discordId = getgenv().id or "nil"

local success, response = pcall(function()
    return game:HttpGet("https://sapphireweb.vercel.app/licenses")
end)

if not success then
    game.Players.LocalPlayer:Kick("❌ Failed to verify license server is offline.")
    return
end

local data = HttpService:JSONDecode(response)

if data[key] and data[key].redeemed and data[key].discordId == discordId then
    print("[✅] Key Validated!")
else
    game.Players.LocalPlayer:Kick("❌ Invalid or Unredeemed Key. Join Discord to get a valid key.")
    return
end

loadstring(game:HttpGet("https://raw.githubusercontent.com/vitorzz07/sapphire-hub/refs/heads/main/Auth.lua"))()
