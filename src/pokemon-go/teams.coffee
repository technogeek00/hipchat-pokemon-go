database = require('../database')

StaticTeams = {
    mystic : {
        name : "Mystic"
        leader : "Blanche"
        color : "blue"
        mascot : "Articuno"
    }
    valor : {
        name : "Valor"
        leader : "Candela"
        color : "red"
        mascot : "Moltres"
    }
    instinct : {
        name : "Instinct"
        leader : "Spark"
        color : "yellow"
        mascot : "Zapados"
    }
}

module.exports = Teams = {
    get : (name, cb) ->
        name = name.toLowerCase()
        unless StaticTeams[name]?
            return cb("Invalid team name")
        return cb(null, StaticTeams[name])

    getMembers : (name, cb) ->
        Teams.get(name, (err, info) ->
            return cb(err) if err?
            database.query("SELECT name, mention FROM `alliances` WHERE `team` = ?", [info.name], (err, rows) ->
                return cb(err) if err?
                members = ({
                    name : row.name,
                    mention : row.mention
                } for row in rows)
                cb(null, info, members)
            )
        )

    join : (name, author, cb) ->
        Teams.get(name, (err, info) ->
            return cb(err) if err?
            database.query("DELETE FROM `alliances` WHERE user_id = ?", [author.id], (err, rows) ->
                return cb(err) if err?
                database.query("INSERT INTO `alliances` (user_id, team, name, mention) VALUES (?, ?, ?, ?)", [author.id, info.name, author.name, author.mention_name], (err, rows) ->
                    return cb(err) if err?
                    cb(null, info)
                )
            )
        )
}