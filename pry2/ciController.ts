import { changeitData } from "./changeitdata";


export class changeitController{
    private static instance: changeitData;
    public constructor(){
        
    }
    public getInstance() : changeitData{
        if(changeitController.instance==null){
            changeitController.instance = new changeitData()
            return changeitController.instance
        }
        return changeitController.instance

    }
   


}
