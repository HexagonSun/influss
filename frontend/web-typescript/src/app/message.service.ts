import { Message } from './message.model';
import { MessageHttpService } from './messageHttp.service';

export class MessageService {

    private readonly messageHttpService: MessageHttpService;

    public constructor() {
        this.messageHttpService = new MessageHttpService();
    }

    public getMessages(): void {
        let messages: Array<Message>;
        this.messageHttpService.getMessages()
            .then((data: Array<Message>) => messages = [...data])
            .catch((err: Error) => {
                console.log('Error fetching messages');
            });
    }

}
