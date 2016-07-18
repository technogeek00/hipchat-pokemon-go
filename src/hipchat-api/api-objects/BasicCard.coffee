uuid = require('uuid')

ApiObject = require('./ApiObject')
Icon = require('./Icon')
CardAttribute = require('./CardAttribute')

module.exports = class BasicCard extends ApiObject
    constructor : (style, title) ->
        @_state = {
            id : uuid.v4()
            style : style
            title : title
            url : null
            icon : null
            format : "medium"
            description : {
                body : ""
                format : "text"
            }
            attributes : []
        }

    setFormat : (format) ->
        unless format in ["medium", "compact"]
            format = "medium"
        @_state.format = format

    setUrl : (url) ->
        @_state.url = url

    setDescription : (body, format = "text") ->
        @_validateTextFormat(format)

        @_state.description.body = body
        @_state.description.format = format

    setIcon : (icon) ->
        if icon? and not (icon instanceof Icon)
            throw new Error("Icon must be an Icon API Object")

        @_state.icon = icon

    addAttribute : (attribute) ->
        unless attribute instanceof CardAttribute
            throw new Error("Attribute must be a Card Attribute API Object")

        @_state.attributes.push(attribute)

    toApiObject : ->
        obj = {
            style : @_state.style
            format : @_state.format
            id : @_state.id
            title : @_state.title
            description : {
                value : @_state.description.body
                format : @_state.description.format
            }
        }

        if @_state.url?
            obj.url = @_state.url

        if @_state.icon?
            obj.icon = @_state.icon.toApiObject()

        if @_state.attributes.length > 0
            obj.attributes = (attribute.toApiObject() for attribute in @_state.attributes)

        return obj