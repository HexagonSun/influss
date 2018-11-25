import { Looper } from './looper';
import { Message } from './message.model';
import { MessageService } from './message.service';
import { Renderer } from './renderer';

export class InflussClient {

    private readonly document: Document;
    private readonly console: Console;

    private readonly messageService: MessageService;
    private readonly renderer: Renderer;

    private readonly fetchInterval: number = 5000;
    private looper: Looper;

    public constructor(document: Document,
                       console: Console) {
        this.document = document;
        this.console = console;

        this.messageService = new MessageService();
        this.renderer = new Renderer(document);
    }

    public init(): void {
        this.console.log('Initializing InflussClient');
        this.looper = new Looper(this.fetchInterval, (): void => {
            this.processMessages();
        });
    }

    private processMessages(): void {
        this.messageService.getMessages()
            .then((data: Array<Message>) => {
                this.updateMessages(data);
            })
            .catch((err: Error) => {
                console.log('Error fetching messages');
            });
    }

    private updateMessages(messages: Array<Message>): void {
        this.renderer.updateMessages(messages);
    }

}
