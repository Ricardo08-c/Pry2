"use strict";
exports.__esModule = true;
exports.d = exports.changeitData = void 0;
//import {Logger} from '../common'
var sql = require('mssql');
var config = {
    user: 'sa',
    password: '1234',
    host: 'localhost',
    server: 'localhost',
    database: 'changeit',
    "dialectOptions": {
        "instanceName": 'MSSQLSERVER'
    },
    pool: {
        max: 3,
        min: 1,
        idleTimeoutMillis: 3000
    },
    port: 1433,
    options: {
        encrypt: true,
        trustServerCertificate: true
    }
};
var changeitData = /** @class */ (function () {
    function changeitData() {
        if (changeitData.poolConnector == null) {
            changeitData.poolConnector = new sql.ConnectionPool(config);
            changeitData.globalpool = changeitData.poolConnector.connect();
            console.log('pool');
        }
    }
    changeitData.prototype.registerHabit = function () {
        return new Promise(function (resolve, reject) {
            changeitData.globalpool.then(function (pool) {
                var query = 'exec registerHabit';
                pool.request().query(query).then(function (data) {
                    resolve(null);
                })["catch"](function (err) {
                    console.log(err);
                });
            });
        });
    };
    return changeitData;
}());
exports.changeitData = changeitData;
var d = new changeitData();
exports.d = d;
