import * as express from "express";
import * as bodyParser from "body-parser";
import { Routes } from "./Routes";
import {MessageRepository} from "./message-repository.service";
import { MessageService } from "./message.service";

const HEADER_API_KEY_NAME = 'X-INFLUSS-API';

class App {

    public app: express.Application;

    private repository: MessageRepository = new MessageRepository();
    private messageService: MessageService = new MessageService(this.repository);
    private routes: Routes = new Routes(this.messageService);

    constructor() {
        this.app = express();
        this.config();
        this.routes.routes(this.app);
    }

    private config(): void{
        this.apiKeyCheck();
        this.configureCORS();
        // support application/json type post data
        this.app.use(bodyParser.json());
        //support application/x-www-form-urlencoded post data
        this.app.use(bodyParser.urlencoded({ extended: false }));
    }
    private apiKeyCheck(): void {
        if (process.env.INFLUSS_SERVER_API_KEY == undefined) {
            console.log("Warning, INFLUSS_SERVER_API_KEY not defined. Skipping apiKeyCheck");

            return;
        }

        this.app.use(function(req, res, next) {
          if (req.method === 'OPTIONS') {
            // must not check OPTIONS request for api-key
            next();
            return;
          }

          const header = req.get(HEADER_API_KEY_NAME);
          if (header != undefined && header === process.env.INFLUSS_SERVER_API_KEY) {
             next();
          } else {
            res.sendStatus(401);
          }
        });
    }

    private configureCORS(): void {
        this.app.use(function(req, res, next) {
          // allow CORS for localhost development
          res.header("Access-Control-Allow-Origin", "*");
          res.header('Access-Control-Allow-Methods', 'GET,PUT,POST,DELETE');
          res.header("Access-Control-Allow-Headers", `Origin, X-Requested-With, Content-Type, Accept, ${HEADER_API_KEY_NAME}`);
          next();
        });
    }
}

export default new App().app;
