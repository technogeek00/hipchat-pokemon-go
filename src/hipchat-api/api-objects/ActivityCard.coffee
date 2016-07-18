Icon = require('./Icon')
BasicCard = require('./BasicCard')

module.exports = class ActivityCard extends BasicCard
    constructor: (title, activity) ->
        super("application", title)

        @_state.activity = {
            body : activity
            icon : null
        }

    setActivityIcon: (icon) ->
        if icon? and not (icon instanceof Icon)
            throw new Error("Icon must be an Icon API Object")

        @_state.activity.icon = icon

    toApiObject: ->
        obj = super()
        obj.activity = {
            html : @_state.activity.body
        }

        if @_state.activity.icon?
            obj.activity.icon = @_state.activity.icon.toApiObject()
        else if @_state.icon?
            obj.activity.icon = @_state.icon.toApiObject()

        return obj