hipchatApi = require('../hipchat-api')
pokemonGo  = require('../pokemon-go')

helpers = require('./helpers')

invalidTeam = (room, teamName) ->
    helpers.sendErrorMessage(room, "Sorry <b>#{teamName}</b> is not a valid team")

listTeamMembers = (room, teamName) ->
    membersResolved = (err, team, members) ->
        return invalidTeam(room, teamName) if err?
        members = ("<li>#{member.name}</li>" for member in members).join("\n")

        text = "<b>Team #{team.name} Members</b>\n<ul>#{members}</ul>"

        message = new hipchatApi.messages.Message(text, "html")
        message.setColor(hipchatApi.messages.Colors.purple)

        hipchatApi.rooms.notification(room.id, message)

    pokemonGo.teams.getMembers(teamName, membersResolved)

joinTeam = (author, room, teamName) ->
    trainerResolved = (err, trainer) ->
        pokemonGo.teams.join(teamName, trainer, teamJoined)

    teamJoined = (err, result) ->
        return invalidTeam(room, teamName) if err?

        team = result.team
        trainer = result.trainer

        message = new hipchatApi.messages.Message("Welcome <b>#{trainer.name}</b> to Team #{team.name}!", "html")
        message.setColor(hipchatApi.messages.Colors.green)

        hipchatApi.rooms.notification(room.id, message)

    pokemonGo.trainers.add(author.id, author.name, author.mention_name, room.id, trainerResolved)

module.exports = (author, room, command, teamName) ->
    switch command
        when "list"
            listTeamMembers(room, teamName)

        when "join"
            joinTeam(author, room, teamName)
