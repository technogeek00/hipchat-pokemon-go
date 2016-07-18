database = require('../database')

apiObject = (infoRow) ->
    return {
        id : infoRow.pokemon_id
        name : infoRow.name
        description : infoRow.description
        image : infoRow.image
        types : [
            infoRow.type1
            infoRow.type2
        ]
    }

module.exports = Pokedex = {
    find : (identifier, cb) ->
        database.query("SELECT * FROM `pokedex` WHERE `pokemon_id` = ? OR `name` LIKE ? LIMIT 1", [identifier, identifier], (err, rows) ->
            return cb(err) if err?

            if rows.length is 0
                return cb("Pokemon not found")

            cb(null, apiObject(rows[0]))
        )

    all : (cb) ->
        database.query("SELECT * FROM `pokedex`", (err, rows) ->
            return cb(err) if err?

            pokemon = (apiObject(row) for row in rows)
            cb(null, pokemon)
        )
}