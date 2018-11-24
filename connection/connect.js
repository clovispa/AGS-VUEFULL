var sql = require("mssql");
var connect = function()
{
    var conn = new sql.ConnectionPool({
        user: 'sa',
        password: 'Archivo3',
        server: 'DESKTOP-AM47U5G',
        database: 'AGS'
    });
 
    return conn;
};

module.exports = connect;