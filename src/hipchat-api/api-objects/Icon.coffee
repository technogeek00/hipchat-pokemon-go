ApiObject = require('./ApiObject')

module.exports = class Icon extends ApiObject
    constructor : (basicUrl, retinaUrl) ->
        @_state = {
            basic : basicUrl
            retina : retinaUrl
        }

    setBasicUrl : (url) ->
        @_state.basic = url

    setRetinaUrl : (url) ->
        @_state.retina = url

    toApiObject : ->
        if @_state.retina?
            return {
                url : @_state.basic
                "url@2x" : @_state.retina
            }

        return @_state.basic
