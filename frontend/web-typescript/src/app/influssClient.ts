import { MessageService } from './message.service';
import { Renderer } from './renderer';

export class InflussClient {

    private readonly document: Document;
    private readonly console: Console;

    private readonly messageService: MessageService;
    private readonly renderer: Renderer;

    public constructor(document: Document,
                       console: Console) {
        this.document = document;
        this.console = console;

        this.messageService = new MessageService();
        this.renderer = new Renderer(document);
    }

    public init(): void {
        this.console.log('Initializing InflussClient');

        this.messageService.getMessages();
    }

}
