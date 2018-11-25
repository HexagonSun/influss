import { Looper } from './looper';
import { Message } from './message.model';

export class Renderer {

    private readonly document: Document;
    private readonly message: HTMLElement;
    private readonly footer: HTMLElement;

    private readonly delay: number = 2000;
    private readonly looper: Looper;

    private messages: Array<Message>;

    public constructor(document: Document) {
        this.document = document;
        this.message = document.getElementById('content');
        this.footer = document.getElementById('footer');

        this.messages = [];
        this.looper = new Looper(this.delay, (): void => {
            this.processTick();
        });
    }

    private processTick(): void {
        console.log('process Tick');
        this.messages = [];

        this.updateFooter();
    }

    private updateFooter(): void {
        const oldTotal: Element = this.footer.children[0];

        const total: HTMLElement = this.document.createElement('div');
        total.className = 'total';
        total.innerHTML = `? / ${this.messages.length}`;

        this.footer.replaceChild(total, oldTotal);
    }

}
