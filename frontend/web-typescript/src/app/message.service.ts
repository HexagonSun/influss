import { MessageHttpService } from './messageHttp.service';

export class MessageService {

    private readonly messageHttpService: MessageHttpService;

    public constructor() {
        this.messageHttpService = new MessageHttpService();
    }

    public getMessages(): void {
        let messages: Array<string>;
        this.messageHttpService.getMessages()
            .then((data: Array<string>) => messages = [...data])
            .catch((err: Error) => {
                console.log('Error fetching messages');
            });
    }

}
