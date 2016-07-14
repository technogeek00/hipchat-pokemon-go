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
            database.query("SELECT name, mention, home FROM `trainers` WHERE `team` = ?", [info.name], (err, rows) ->
                return cb(err) if err?
                members = ({
                    name : row.name,
                    mention : row.mention,
                    home : row.home
                } for row in rows)
                cb(null, info, members)
            )
        )

    join : (name, trainer, cb) ->
        Teams.get(name, (err, info) ->
            return cb(err) if err?
            database.query("UPDATE trainers SET team = ? WHERE user_id = ?", [name, trainer.id], (err, rows) ->
                return cb(err) if err?
                cb(null, info)
            )
        )
}