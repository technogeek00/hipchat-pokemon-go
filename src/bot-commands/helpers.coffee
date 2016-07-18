hipchatApi = require('../hipchat-api')
pokemonGo = require('../pokemon-go')

module.exports = Helpers = {
    notifyInvalidPokemon : (room, pokemon) ->
        Helpers.sendErrorMessage(room, "Sorry <b>#{pokemon}</b> is not a valid Pokémon name or Pokédex number")

    sendErrorMessage : (room, error) ->
        message = new hipchatApi.messages.Message(error, "html")
        message.setColor(hipchatApi.messages.Colors.red)
        hipchatApi.rooms.notification(room.id, message)

    createPokemonCard : (pokemon, text) ->
        paddedId = if pokemon.id < 100 then "0#{pokemon.id}" else "#{pokemon.id}"
        
        sprite = new hipchatApi.messages.Icon(pokemon.image)
        picture = new hipchatApi.messages.Icon("http://assets.pokemon.com/assets/cms2/img/pokedex/detail/#{paddedId}.png")
        
        card = new hipchatApi.messages.cards.Activity("#{pokemon.name} ##{paddedId}", text)
        card.setDescription("The real pokemon description will go here")
        card.setIcon(picture)
        card.setActivityIcon(sprite)
        card.setUrl("http://www.pokemon.com/us/pokedex/#{paddedId}")

        type = pokemon.types[0]
        if pokemon.types[1]?.length > 0
            type += "/#{pokemon.types[1]}"

        card.addAttribute(new hipchatApi.messages.Attribute("Type", type, hipchatApi.messages.Attribute.Styles.basic))
        
        return card
}