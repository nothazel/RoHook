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
		}
		if Embed then
			Data["embeds"] = {Embed}
		end
		Data = HttpService:JSONEncode(Data)
		HttpService:PostAsync(Webhook, Data)
	end
end

function RoHook:Post(WebhookType, Content, Title, Url, Description, Image, Field, Color)
	local Embed
	if Title or Url or Description or Image or Color or Field then
		Embed = {
			title = Title,
			url = Url,
			description = Description,
			image = {
				url = Image
			},
			fields = Field,
			color = Color or 0xFF0000,
		}
	end
	InitMsg(WebhookType, Content, Embed)
end

return RoHook
