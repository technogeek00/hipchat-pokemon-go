ApiObject = require('./ApiObject')

styleMappings = {
    basic    : "lozenge" # grey
    moved    : "lozenge-moved" # brown
    complete : "lozenge-complete" # blue
    current  : "lozenge-current" # yellow
    error    : "lozenge-error" # red
    success  : "lozenge-success" # green
}

validateStyle = (style) ->
    return style unless style?

    return styleMappings[style] ? styleMappings.basic

module.exports = class CardAttribute
    @Styles : {
        basic    : "basic"
        moved    : "moved"
        complete : "complete"
        current  : "current"
        error    : "error"
        success  : "success"

        grey     : "basic"
        brown    : "moved"
        blue     : "complete"
        yellow   : "current"
        red      : "error"
        green    : "success"
    }

    constructor : (label, value, style) ->
        @_state = {
            label : label
            value : value
            style : validateStyle(style)
        }

    toApiObject : ->
        obj = {
            label : @_state.label
            value : {
                label : @_state.value
            }
        }

        if @_state.style?
            obj.value.style = @_state.style

        return obj