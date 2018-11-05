import {Request, Response} from "express";
import { MessageService } from "./message.service";

export class Routes {

    constructor(private messageService: MessageService) {
    }

    public routes(app): void {
        app.route('/').get((req: Request, res: Response) => this.ok(res));
        app.route('/ping').get((req: Request, res: Response) => this.ok(res));

        app.route('/messages').get((req: Request, res: Response) => this.listMessages(res));
    }

    private listMessages(res: Response): void {
        res.status(200).send(this.messageService.listMessages(new Date()));
    }

    private ok(res: Response): void {
        res.status(200).send({
            message: 'InFluss GET \'/\' OK'
        })
    }

}
