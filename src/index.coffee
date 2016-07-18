express = require('express')
bodyParser = require('body-parser')

botCommands = require('./bot-commands')

app = express()
app.use(bodyParser.json())

app.get('/', (req, res) ->
    res.send("Gotta Catch'em All")
)

app.post('/api/v1/room-message', (req, res) ->
    hipchatItem = req.body?.item
    unless hipchatItem?
        res.json({
            success : false
        })

    message = hipchatItem.message
    author = message.from
    room = hipchatItem.room

    [vanity, commandSet, args...] = message.message.split(' ')

    # ensure a slash command is what called us and not a random message with our command
    if vanity.indexOf("/") isnt 0
        return

    switch commandSet
        when "team"
            [name, command] = args
            botCommands.team(author, room, command, name)
        when "encounter"
            [name, location...] = args
            location = location.join(' ')
            botCommands.encounter(author, room, name, location)
        when "pokedex"
            [command, name] = args
            botCommands.pokedex(room, command, name)
        else
            # show command helpers
            botCommands.help(room, vanity)

    res.json({
        success : true
    })
)

app.listen(80)
