local RoHook  = {}
local HttpService = game:GetService("HttpService")
local BaseURL = "BASE_URL_FOR_WEBHOOK" -- Example: https://discord.com/api/webhooks/1120397879920570552/ (Proxy required due to Discord/Roblox relationship use a ratelimit respecting proxy.)

RoHook.EndPoints = {
	Notifier = "YOUR_NOTIFIER_ENDPOINT_HERE",
	Alert = "YOUR_ALERT_ENDPOINT_HERE",
	Log = "YOUR_LOG_ENDPOINT_HERE",
}

RoHook.Webhooks = {
	Notifiers = BaseURL.. RoHook.EndPoints.Notifier,
	Alerts = BaseURL.. RoHook.EndPoints.Alert,
	Logs = BaseURL.. RoHook.EndPoints.Log,
}

local function InitMsg(WebhookType, Content, Embed)
	local Webhook = RoHook.Webhooks[WebhookType]
	if Webhook then
		local Data = {
			["content"] = Content,
			["embeds"] = {Embed}
		}
		Data = HttpService:JSONEncode(Data)
		HttpService:PostAsync(Webhook, Data)
	end
end

function RoHook:Post(WebhookType, Content, Title, Url, Description, Image, Color)
	local Embed = {
		title = Title or "Title",
		url = Url,
		description = Description or "Description",
		image = {
			url = Image
		},
		color = Color or 0xFF0000,
	}
	InitMsg(WebhookType, Content, Embed)
end

return RoHook
