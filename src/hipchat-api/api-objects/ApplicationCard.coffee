BasicCard = require('./BasicCard')

module.exports = class ApplicationCard extends BasicCard
    constructor : (title) ->
        super("application", title)