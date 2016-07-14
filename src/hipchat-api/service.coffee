request = require('request')
config = require('../../config').hipchat

module.exports = {
    post : (path, roomId, body, cb) ->
        authToken = config.tokens?[roomId] ? config.token
        url = "#{config.endpoint}#{path}?auth_token=authToken"

        request.post(url, {
            json : true,
            body : body
        }, cb)
}