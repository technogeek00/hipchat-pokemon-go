database = require('../database')

generateUser = (rowData) ->
    return {
        id : rowData.user_id
        name : rowData.name
        mention : rowData.mention
        team : rowData.team
        home : rowData.home
    }

module.exports = Trainers = {
    get : (userid, cb) ->
        database.query("SELECT * FROM `trainers` WHERE user_id = ?", [userid], (err, rows) ->
            return cb(err) if err?
            if rows.length is 0
                return cb()

            cb(null, generateUser(rows[0]))
        )

    add : (userid, name, mention, home, cb) ->
        Trainers.get(userid, (err, info) ->
            return cb(err) if err?
            # if user already created return it
            if info?
                return cb(null, info)

            # otherwise create the user
            database.query("INSERT INTO `trainers` (user_id, name, mention, team, home) VALUES (?, ?, ?, ?, ?)", [userid, name, mention, 'none', home], (err) ->
                return cb(err) if err?
                cb(null, generateUser({
                    user_id : userid
                    name : name
                    mention : mention
                    team : 'none'
                    home : home
                }))
            )
        )
}