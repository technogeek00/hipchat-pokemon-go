database = require('../database')

apiObject = (infoRow) ->
    return {
        id : infoRow.pokemon_id
        name : infoRow.name
        image : infoRow.image
        types : [
            infoRow.type1
            infoRow.type2
        ]
        isCommon : infoRow.common is 1
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

    setRarity : (identifier, isCommon, cb) ->
        Pokedex.find(identifier, (err, info) ->
            return cb(err) if err?
            database.query("UPDATE `pokedex` SET `common` = ? WHERE `pokemon_id` = ?", [isCommon, info.id], (err) ->
                return cb(err) if err?
                info.isCommon = isCommon
                cb(null, info)
            )
        )

    encounter : (identifier, cb) ->
        Pokedex.find(identifier, (err, info) ->
            return cb(err) if err?
            database.query("INSERT INTO `encounters` (sighting_id, pokemon_id, time) VALUES (NULL, ?, NULL)", [info.id], (err) ->
                return cb(err) if err?
                cb(null, info)
            )
        )
}