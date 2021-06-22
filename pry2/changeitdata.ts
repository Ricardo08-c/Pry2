//import {Logger} from '../common'
const sql = require('mssql');
var config = {
    user: 'sa',
    password: '1234',
    host: 'localhost', 
    server: 'localhost',
    database: 'changeit',
    "dialectOptions": {
        "instanceName":'MSSQLSERVER'
    },
    pool :{
        max: 3,
        min: 1,
        idleTimeoutMillis: 3000
    },
    port : 1433,
    options :{
        encrypt:true,
        trustServerCertificate: true
    }
    
    

};

export class changeitData{
private static poolConnector : any;
private static globalpool: any;
    public constructor(){
        if(changeitData.poolConnector==null){
            changeitData.poolConnector = new sql.ConnectionPool(config);
            changeitData.globalpool = changeitData.poolConnector.connect();
            console.log('pool')

        }           
    }
    public registerHabit() : Promise<any>{
        return new Promise<any>((resolve,reject) =>{
            changeitData.globalpool.then((pool:any) =>{
                const query = 'exec registerHabit'
                pool.request().query(query).then((data: any)=>{
                    resolve(null)
                }).catch((err: any) =>{
                    console.log(err)
                })
            })
        })

    }
}
const d = new changeitData()
export {d}
