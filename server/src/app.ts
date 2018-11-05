import * as express from "express";
import * as bodyParser from "body-parser";
import { Routes } from "./Routes";
import { MessageService } from "./message.service";

class App {

    public app: express.Application;
    public messageService: MessageService = new MessageService();
    public routes: Routes = new Routes(this.messageService);

    constructor() {
        this.app = express();
        this.config();
        this.routes.routes(this.app);
    }

    private config(): void{
        // support application/json type post data
        this.app.use(bodyParser.json());
        //support application/x-www-form-urlencoded post data
        this.app.use(bodyParser.urlencoded({ extended: false }));
    }

}

export default new App().app;