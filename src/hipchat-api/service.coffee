request = require('request')
config = require('../../config').hipchat

module.exports = {
    post : (path, body, cb) ->
        url = "#{config.endpoint}#{path}?auth_token=#{config.token}"

        request.post(url, {
            json : true,
            body : body
        }, cb)
}