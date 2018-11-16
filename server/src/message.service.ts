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

    public deleteMessage(id: number): boolean {
        // TODO: persist in DB
        return false;
    }

    private fetch(id: number): Message {
        // TODO: fetch from DB
        return undefined;
    }

    private update(id: number): Message {
        // TODO: fetch from DB
        return undefined;
    }

}
