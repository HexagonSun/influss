import { Looper } from './looper';
import { Message } from './message.model';

export class Renderer {

    private readonly message: Node;
    private readonly footer: Node;

    private readonly delay: number = 2000;
    private readonly looper: Looper;

    private messages: Array<Message>;

    public constructor(document: Document) {
        this.message = document.getElementById('content');
        this.footer = document.getElementById('footer');

        this.messages = [];
    }

}
