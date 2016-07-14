mysql = require('mysql')
config = require('../config.json').mysql
return
connectionPool = mysql.createPool({
    connectionLimit : 10,
    host : config.host,
    user : config.user,
    password : config.password,
    database : config.database
})

module.exports = connectionPool