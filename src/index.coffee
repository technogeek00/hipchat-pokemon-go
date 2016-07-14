express = require('express')
bodyParser = require('body-parser')

pokemonGo = require('./pokemon-go')
hipchatApi = require('./hipchat-api')

app = express()
app.use(bodyParser.json())

app.get('/', (req, res) ->
    res.send("Gotta Catch'em All")
)

helpCommand = (room, vanity) ->
    message = [
        "<b>Team Commands</b>"
        "<code>#{vanity} team &lt;team&gt; list</code> - List all the members of the named team"
#        "<code>#{vanity} team &lt;team&gt; rally</code> - Rally the members of the named team"
        "<code>#{vanity} team &lt;team&gt; join</code> - Join the named team. (This will cause you to leave any previously joined teams)"
        ""
        "<b>Encounter Command</b>"
        "<code>#{vanity} encounter &lt;pokemon-id&gt;</code> - Note that a pokemon was encountered, triggers room messages based on rarity"
        ""
        "<b>Pokedex Commands</b>"
        "<code>#{vanity} pokedex show &lt;pokemon-id&gt;</code> - Shows the known information about the named Pokemon"
        "<code>#{vanity} pokedex set-common &lt;pokemon-id&gt;</code> - Sets the named Pokemon as common so that encounters of it do not cause room messages"
        "<code>#{vanity} pokedex set-rare &lt;pokemon-id&gt;</code> - Sets the named Pokemon as rare so that encounters of it do cause room messages"
        ""
        "<b>Enum Reference</b>"
        "<code>&lt;team&gt;</code> - Either instinct, mystic, valor"
        "<code>&lt;pokemon-id&gt;</code> - Either the name or pokedex number of a pokemon"
    ].join('<br>\n')
    hipchatApi.rooms.notification(room.id, message, null, type = "html")

encounterCommand = (author, room, pokemon, location = "") ->
    pokemonGo.pokedex.encounter(pokemon, room.id, location, (err, info) ->
        if err?
            return hipchatApi.rooms.notification(room.id, "Sorry `#{pokemon}` is not a valid pokemon", "red")

        if info.isCommon
            hipchatApi.rooms.notification(room.id, "@#{author.mention_name} encountered a wild #{info.name}, but it is considered common here", "green")
        else
            hipchatApi.rooms.notification(room.id, "@here @#{author.mention_name} encountered a wild #{info.name}", "green")
    )

teamDispatch = (author, room, command, name) ->
    invalidTeam = (err) ->
        hipchatApi.rooms.notification(room.id, "Sorry `#{name}` is not a valid team: #{err}", "red")

    switch command
        when "list"
            pokemonGo.teams.getMembers(name, (err, info, members) ->
                return invalidTeam(err) if err?
                members = ("<li>#{member.name}</li>" for member in members).join("\n")
                hipchatApi.rooms.notification(room.id, "<b>Team #{info.name} Members</b>\n<ul>#{members}</ul>", "purple", "html")
            )
        when "rally"
            pokemonGo.teams.getMembers(name, (err, info, members) ->
                return invalidTeam(err) if err?
                members = ("@#{member.mention}" for member in members when member.home is room.id).join(" ")
                hipchatApi.rooms.notification(room.id, "Team #{info.name} Unite! #{members}", "purple")
            )
        when "join"
            pokemonGo.trainers.add(author.id, author.name, author.mention_name, room.id, (err, trainer) ->
                pokemonGo.teams.join(name, trainer, (err, info) ->
                    return invalidTeam(err) if err?
                    hipchatApi.rooms.notification(room.id, "Welcome #{trainer.name} to Team #{info.name}!", "green")
                )
            )

pokedexCommand = (room, command, identifier, rarityLevel) ->
    invalidIdentifier = ->
        hipchatApi.rooms.notification(room.id, "Sorry `#{identifier}` is not a valid pokemon name", "red")

    switch command
        when "list"
            return
            pokemonGo.pokedex.all((err, pokemon) ->
                if err?
                    return hipchatApi.rooms.notification(room.id, "Unexpected database failure", "red")
                list = pokemon.map((elm) -> return "##{elm.id} #{elm.name}").join("\n")
                hipchatApi.rooms.notification(room.id, "Gotta Catch'em All!\n#{list}", "green")
            )

        when "show"
            pokemonGo.pokedex.find(identifier, (err, info) ->
                return invalidIdentifier(err) if err?
                rarity = if info.isCommon then "common" else "rare"
                type = info.types[0]
                if info.types[1]?
                    type += "/#{info.types[1]}"
                hipchatApi.rooms.notification(room.id, "##{info.id} #{info.name} is a #{rarity} #{type} type Pokémon", "purple")
            )

        when "set-common", "set-rare"
            pokemonGo.pokedex.setRarity(identifier, room.id, command is "set-common", (err, info, isCommon) ->
                return invalidIdentifier(err) if err?
                rarity = if info.isCommon then "common" else "rare"
                hipchatApi.rooms.notification(room.id, "##{info.id} #{info.name} is now considered #{rarity}", "purple")
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
    switch commandSet
        when "team"
            [name, command] = args
            teamDispatch(author, room, command, name)
        when "encounter"
            [name, location...] = args
            location = location.join(' ')
            encounterCommand(author, room, name, location)
        when "pokedex"
            [command, name, rarity] = args
            pokedexCommand(room, command, name, rarity)
        else
            # show command helpers
            helpCommand(room, vanity)

    res.json({
        success : true
    })
)

app.listen(80)
