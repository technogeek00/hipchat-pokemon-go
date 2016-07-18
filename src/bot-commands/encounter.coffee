hipchatApi = require('../hipchat-api')
pokemonGo = require('../pokemon-go')

helpers = require('./helpers')

module.exports = (author, room, pokemon, location = "") ->
    resolvedPokemon = (err, result) ->
        if err?
            return helpers.notifyInvalidPokemon(room, identifier)

        pokemon = result.pokemon

        text = "A wild <b>#{pokemon.name}</b> was encountered"
        if location.length > 0
            text += " near #{location}"

        message = new hipchatApi.messages.Message(text, "html")

        card = helpers.createPokemonCard(pokemon, text)
        card.addAttribute(new hipchatApi.messages.Attribute("Spotted By", author.name))

        if location.length > 0
            card.addAttribute(new hipchatApi.messages.Attribute("Location", location, hipchatApi.messages.Attribute.Styles.green))

        message.setCard(card)
        message.setNotify(result.notify)

        hipchatApi.rooms.notification(room.id, message)

    pokemonGo.encounters.saw(pokemon, room.id, location, resolvedPokemon)
