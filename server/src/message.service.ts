import {Request, Response} from "express";
import {Message} from "./message.model";
import {MessageRepository} from "./message-repository.service";

export class MessageService {

    constructor(private repository: MessageRepository) {

    }

    public listMessages(date: Date): Promise<Array<Message>> {
        return this.repository.fetchAll(date);
    }

    public addMessage(text: string, validFrom: Date, invalidFrom: Date, author: string): Promise<Message> {
        const msg: Message= this.createMessage(text, validFrom, invalidFrom, author)
        return this.repository.add(msg);
    }

    public deleteMessage(id: number): Promise<boolean> {
        return this.repository.delete(id);
    }

    private fetch(id: number): Promise<Message> {
        return this.repository.fetch(id);
    }

    private update(id: number): Promise<Message> {
        return this.repository.update(id);
    }

    private createMessage(text: string, validFrom: Date, invalidFrom: Date, author: string): Message {
        return <Message> {
            text: text,
            validFrom: validFrom,
            invalidFrom: invalidFrom,
            author: author,
        }
    }

}
