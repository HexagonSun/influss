import { MessageService } from './message.service';

export class InflussClient {

    private readonly document: Document;
    private readonly console: Console;

    private messageService: MessageService;

    public constructor(document: Document,
                       console: Console) {
        this.document = document;
        this.console = console;
    }

    public init(): void {
        this.console.log('Initializing InflussClient');

        this.messageService = new MessageService();
        this.messageService.getMessages();
    }

}
