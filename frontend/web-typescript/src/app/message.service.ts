import { Message } from './message.model';
import { MessageHttpService } from './messageHttp.service';

export class MessageService {

    private readonly messageHttpService: MessageHttpService;

    public constructor() {
        this.messageHttpService = new MessageHttpService();
    }

    public async getMessages(): Promise<Array<Message>> {
        return this.messageHttpService.getMessages();
    }

}
