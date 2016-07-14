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

    setRarity : (identifier, home, isCommon, cb) ->
        Pokedex.find(identifier, (err, info) ->
            return cb(err) if err?
            database.query("SELECT * FROM `encounter_notification` WHERE pokemon_id = ? AND room_id = ?", [info.id, home], (err, rows) ->
                return cb(err) if err?

                lastCallback = (err, rows) ->
                    return cb(err) if err?
                    info.isCommon = isCommon
                    cb(null, info)

                if rows.length > 0
                    database.query("UPDATE `encounter_notification` SET notify = ? WHERE pokemon_id = ? AND room_id = ?", [isCommon, info.id, home], lastCallback)
                else
                    database.query("INSERT INTO `encounter_notification` (pokemon_id, room_id, notify) VALUES (?, ?, ?)", [info.id, home, isCommon], lastCallback)
            )
        )

    encounter : (identifier, home, location, cb) ->
        Pokedex.find(identifier, (err, info) ->
            return cb(err) if err?
            database.query("INSERT INTO `encounters` (sighting_id, pokemon_id, room_id, time, location) VALUES (NULL, ?, ?, NULL, ?)", [info.id, home, location], (err) ->
                return cb(err) if err?
                cb(null, info)
            )
        )
}