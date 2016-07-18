hipchatApi = require('../hipchat-api')

CommandSets = [
    {
        name : "Team Commands"
        prefix : "team"
        commands : [
            {
                command : "<team> list"
                description : "List all the members of the named team"
            }
            {
                command : "<team> join"
                description : "Join the named team. (This will cause you to leave any previously joined teams)"
            }
        ]
        references : [
            {
                name : "<team>"
                description : "Either Instinct, Mystic, or Valor"
            }
        ]
    }
    {
        name : "Encounter Commands"
        prefix : "encounter"
        commands : [
            {
                command : "<pokemon-id> <location>"
                description : "Note that a pokemon was encountered, triggers room messages based on rarity. Location is optional."
            }
        ]
    }
    {
        name : "Pokedex Commands"
        prefix : "pokedex"
        commands : [
            {
                command : "show <pokemon-id>"
                description : "Shows the known information about the named Pokémon"
            }
            {
                command : "set-common <pokemon-id>"
                description : "Sets the named Pokémon as common so that encounters of it do not cause room messages"
            }
            {
                command : "set-rare <pokemon-id>"
                description : "Sets the named Pokémon as rare so that encounters of it do cause room messages"
            }
        ]
        references : [
            {
                name : "<pokemon-id>"
                description : "Either the name or Pokédex number of a Pokémon"
            }
        ]
    }
]

encodeTags = (str) ->
    return str
            .replace("<", "&lt;")
            .replace(">", "&gt;")

module.exports = (room, vanity) ->
    text = ""
    references = ""
    for commandSet in CommandSets
        text += "<b>#{commandSet.name}</b><br/>\n"
        for command in commandSet.commands
            text += "<code>#{vanity} #{commandSet.prefix} #{encodeTags(command.command)}</code> - #{command.description}<br/>\n"

        if commandSet.references?
            for reference in commandSet.references
                references += "<code>#{encodeTags(reference.name)}</code> - #{reference.description}<br/>\n"

        text += "<br/>\n"

    text += "<b>References</b><br/>\n#{references}"

    message = new hipchatApi.messages.Message(text, "html")
    hipchatApi.rooms.notification(room.id, message)
