import { Looper } from './looper';
import { Message } from './message.model';

export class Renderer {

    private readonly document: Document;
    private readonly message: HTMLElement;
    private readonly footer: HTMLElement;

    private readonly delay: number = 2000;
    private readonly looper: Looper;

    private messages: Array<Message>;
    private index: number = 0;

    public constructor(document: Document) {
        this.document = document;
        this.message = document.getElementById('content');
        this.footer = document.getElementById('footer');

        this.messages = [];
        this.looper = new Looper(this.delay, (): void => {
            this.processTick();
        });
    }

    public updateMessages(messages: Array<Message>): void {
        this.messages = [...messages];
    }

    private processTick(): void {
        console.log('process Tick');
        this.updateMessage();
        this.updateFooter();

        this.index = this.getNextIndex();
    }

    private updateMessage(): void {
        if (this.messages.length === 0) {
            // Nothing to do;
            return;
        }

        const messageText: string = this.messages[this.index].text;
        const oldMessage: Element = this.message.children[0];

        const message: HTMLElement = this.document.createElement('div');
        message.className = 'message';
        message.innerHTML = messageText;

        this.message.replaceChild(message, oldMessage);
    }

    private updateFooter(): void {
        const oldTotal: Element = this.footer.children[0];

        const total: HTMLElement = this.document.createElement('div');
        total.className = 'total';
        const index: string = this.messages.length === 0 ? '–' : `${this.index + 1}`;
        total.innerHTML = `${index} / ${this.messages.length}`;

        this.footer.replaceChild(total, oldTotal);
    }

    private getNextIndex(): number {
        if (this.messages.length === 0) {
            return 0;
        }

        return (this.index + 1) % this.messages.length;
    }
}
