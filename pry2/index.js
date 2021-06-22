const express = require("express")
var app = express();

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

var changeitController = require('./ciController')


var controller = new changeitController.changeitController()

app.get('/registerHabit', function (req, res) {
    controller.getInstance().registerHabit().then(data =>{
        res.status(200).send("User Page");
        }).catch(function(e) {
        console.log(e);
    })
});

var server = app.listen(5000, function () {
    console.log('Server is running..');
});