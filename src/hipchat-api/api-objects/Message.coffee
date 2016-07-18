ApiObject = require('./ApiObject')
Colors = require('./Colors')
BasicCard = require('./BasicCard')

module.exports = class Message extends ApiObject

    constructor : (body, format) ->
        @_state = {
            color : Colors.default
            notify : false
            basic : {
                body : ""
                format : "text"
            }
            card : null
        }

        @setMessage(body, format)

    setMessage : (body, format = "text") ->
        @_validateTextFormat(format)

        if body.length > 10000
            console.warn("Message bodies are limited to 10,000 characters, automatically truncating")
            body = body.substr(0, 10000)

        @_state.basic.body = body
        @_state.basic.format = format

    setColor : (color = Colors.default) ->
        unless Colors[color]?
            color = Colors.default

        @_state.color = color

    setNotify : (notify = false) ->
        @_state.notify = notify

    setCard : (card) ->
        if card? and not (card instanceof BasicCard)
            throw new Error("Card passed must be a Card API Object")

        @_state.card = card

    toApiObject : ->
        obj = {
            color : @_state.color
            message : @_state.basic.body
            message_format : @_state.basic.format
            notify : @_state.notify
        }

        if @_state.card?
            obj.card = @_state.card.toApiObject()

        console.log(obj)
        return obj
