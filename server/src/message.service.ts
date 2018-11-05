import {Request, Response} from "express";

export class MessageService {

    constructor() {

    }

    public listMessages(date: Date): Array<Message> {
        // TODO: query DB
        return [];
    }

    public addMessage(text: string, validFrom: Date, invalidFrom: Date, author: string): boolean {
        // TODO: persist in DB
        return false;
    }

    public deleteMessage(id: string): boolean {
        // TODO: persist in DB
        return false;
    }

    private fetch(id: string): Message {
        // TODO: fetch from DB
        return undefined;
    }

    private update(id: string): Message {
        // TODO: fetch from DB
        return undefined;
    }

}
