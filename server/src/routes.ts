import {Request, Response} from "express";
import { MessageService } from "./message.service";

export class Routes {

    constructor(private messageService: MessageService) {
    }

    public routes(app): void {
        app.route('/').get((req: Request, res: Response) => this.ok(res));
        app.route('/ping').get((req: Request, res: Response) => this.ok(res));

        app.route('/messages').get((req: Request, res: Response) => this.sendResponse(res, this.listMessages()));
    }

    private listMessages(): Promise<any> {
        return this.messageService.listMessages(new Date());
    }

    private ok(res: Response): void {
        this.sendResponse(res, Promise.resolve({
            message: 'InFluss GET \'/\' OK'
        }));
    }

    private sendResponse(response: Response, promise: Promise<any>): Promise<any> {
        return promise
            .then((data) => response.status(200).send(data))
            .catch((err)=>{
                console.error(err);
                response.status(501).send("error occured");
            });
    }

}
