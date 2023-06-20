# RoHook

`RoHook` is a Lua module that allows you to send messages to multiple types of webhooks using the Roblox game engine.

## Usage

To use the module, you need to require it in your script and then call the `Post` function with the appropriate arguments.

```lua
local RoHook = require(path.to.RoHook)

RoHook:Post(WebhookType, Content, Title, Url, Description, Image, Field, Color)
```

- `WebhookType` (string): The type of webhook to send the message to. Supported types are `"Notifiers"`, `"Alerts"`, and `"Logs"`. Custom types of your own choosing can be added check `Capabilities` section.
- `Content` (string): The content of the message to send.
- `Title` (string) [optional]: The title of the embed.
- `Url` (string) [optional]: The URL of the embed.
- `Description` (string) [optional]: The description of the embed.
- `Image` (string) [optional]: The URL of an image to include in the embed.
- `Field` (table) [optional]: A table containing fields to include in the embed. Each field should be a table with `name`, `value`, and `inline` keys.
- `Color` (number) [optional]: The color of the embed in decimal format.

### Sending a Normal Message

To send a normal message to a webhook, you only need to provide the `WebhookType` and `Content` arguments when calling the `Post` function. For example:

```lua
RoHook:Post("Notifiers", "This is a normal message")
```

This will send a normal message with the content `"This is a normal message"` to the `"Notifiers"` webhook.

### Sending an Embed Message

To send an embed message to a webhook, you need to provide additional arguments such as `Title`, `Url`, `Description`, `Image`, and/or `Color` when calling the `Post` function. For example:

```lua
RoHook:Post("Notifiers", "", "Embed Title", "https://example.com", "Embed description", "https://i.imgur.com/abcde.png", nil, 0x00FF00)
```

This will send an embed message with the specified title, URL, description, image, and color to the `"Notifiers"` webhook.

### Sending an Embed Message with Fields

To send an embed message with fields to a webhook, you need to provide additional arguments such as `Title`, `Url`, `Description`, `Image`, and/or `Color`, as well as a table containing fields when calling the `Post` function. For example:

```lua
local Fields = {
	{
		name = "Field 1",
		value = "Value 1",
		inline = true
	},
	{
		name = "Field 2",
		value = "Value 2",
		inline = true
	}
}
RoHook:Post("Notifiers", "", "Embed Title", "https://example.com", "Embed description", "https://i.imgur.com/abcde.png", Fields, 0x00FF00)
```

This will send an embed message with the specified title, URL, description, image, color, and fields to the `"Notifiers"` webhook.

### Sending Both a Normal and Embed Message

To send both a normal and an embed message in a single post request, you need to provide both the `Content` argument and at least one of the optional arguments (`Title`, `Url`, `Description`, `Image`, and/or `Color`) when calling the `Post` function. For example:

```lua
RoHook:Post("Notifiers", "This is a normal message", "Embed Title", "https://example.com", "Embed description", "https://i.imgur.com/abcde.png", nil, 0x00FF00)
```

This will send both a normal message with the content `"This is a normal message"` and an embed message with the specified title, URL, description, image, and color to the `"Notifiers"` webhook.

## Capabilities

With the `RoHook` module, you can:

- Send normal messages or embed messages to multiple types of webhooks (`"Notifiers"`, `"Alerts"`, and `"Logs"`).
- Customize the content, title, URL, description, image, color and fields of embed messages.
- Easily add support for additional webhook types by modifying the `RoHook.EndPoints` and `RoHook.Webhooks` tables.
