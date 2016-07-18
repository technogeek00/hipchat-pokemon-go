hipchatApi = require('../hipchat-api')
pokemonGo = require('../pokemon-go')

helpers = require('./helpers')

showPokemon = (room, identifier) ->
    pokemonGo.pokedex.find(identifier, (err, pokemon) ->
        return helpers.notifyInvalidPokemon(room, identifier) if err?

        type = pokemon.types[0]
        if pokemon.types[1]?.length > 0
            type += "/#{pokemon.types[1]}"
        text = "<b>##{pokemon.id} #{pokemon.name}</b> is a #{type} type Pokémon"

        card = helpers.createPokemonCard(pokemon, text)

        message = new hipchatApi.messages.Message(text, "html")
        message.setCard(card)
        message.setColor(hipchatApi.messages.Colors.purple)

        hipchatApi.rooms.notification(room.id, message)
    )

updateRarity = (room, identifier, isRare) ->
    pokemonGo.encounters.setNotify(identifier, room.id, isRare, (err, result) ->
        return helpers.notifyInvalidPokemon(room, identifier) if err?

        pokemon = result.pokemon
        rarity = if isRare then "rare" else "common"
        text = "<b>#{pokemon.name}</b> is now considered <b>#{rarity}</b> within this room"

        card = helpers.createPokemonCard(pokemon, text)
        card.addAttribute(new hipchatApi.messages.Attribute("Room Rarity", "#{rarity}", hipchatApi.messages.Attribute.Styles.current))

        message = new hipchatApi.messages.Message(text, "html")
        message.setCard(card)
        message.setColor(hipchatApi.messages.Colors.purple)

        hipchatApi.rooms.notification(room.id, message)
    )

module.exports = (room, command, identifier) ->
    switch command
        when "show"
            showPokemon(room, identifier)

        when "set-common", "set-rare"
            updateRarity(room, identifier, command is "set-rare")
