service = require('./service')
Colors = require('./api-objects/Colors')
Message = require('./api-objects/Message')

pathPrefix = "/room"
nativeId = 0
module.exports = {
    notification : (roomId, message, cb) ->
        unless Colors[color]?
            color = Colors.default

        unless message instanceof Message
            throw "Given message must be of type message"

        service.post("#{pathPrefix}/#{roomId}/notification", roomId, message.toApiObject(), cb)
}