database = require('../database')
Pokedex = require('./pokedex')

module.exports = Encounters = {
    saw : (identifier, home, location, cb) ->
        Pokedex.find(identifier, (err, pokemon) ->
            return cb(err) if err?
            database.query("INSERT INTO `encounters` (sighting_id, pokemon_id, room_id, time, location) VALUES (NULL, ?, ?, NULL, ?)", [pokemon.id, home, location], (err) ->
                return cb(err) if err?
                Encounters.shouldNotify(pokemon.id, home, cb)
            )
        )

    setNotify : (identifier, home, shouldNotify, cb) ->
        Pokedex.find(identifier, (err, pokemon) ->
            return cb(err) if err?
            database.query("SELECT notify FROM `encounter_notification` WHERE pokemon_id = ? AND room_id = ?", [pokemon.id, home], (err, rows) ->
                return cb(err) if err?

                query = ""
                data = null

                if rows.length > 0
                    query = "UPDATE `encounter_notification` SET notify = ? WHERE pokemon_id = ? AND room_id = ?"
                    data = [shouldNotify, pokemon.id, home]
                else
                    query = "INSERT INTO `encounter_notification` (pokemon_id, room_id, notify) VALUES (?, ?, ?)"
                    data = [pokemon.id, home, shouldNotify]

                database.query(query, data, (err, rows) ->
                    return cb(err) if err?

                    cb(null, {
                        pokemon : pokemon,
                        notify : shouldNotify
                    })
                )
            )
        )


    shouldNotify : (identifier, home, cb) ->
        Pokedex.find(identifier, (err, pokemon) ->
            return cb(err) if err?
            database.query("SELECT notify FROM `encounter_notification` WHERE pokemon_id = ? and room_id = ?", [pokemon.id, home], (err, rows) ->
                return cb(err) if err?
                cb(null, {
                    pokemon : pokemon,
                    notify : (rows[0]?.notify ? 1) is 1
                })
            )
        )
}