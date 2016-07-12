service = require('./service')
colors = require('./colors')

pathPrefix = "/room"
nativeId = 0
module.exports = {
    notification : (roomId, message, color = colors.default, type = "text") ->
        unless colors[color]?
            color = colors.default

        service.post("#{pathPrefix}/#{roomId}/notification", {
            message_format : type,
            color : color,
            message : message
        })
}