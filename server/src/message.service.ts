import {Request, Response} from "express";
import {Message} from "./message.model";

export class MessageService {

    constructor() {

    }

    public listMessages(date: Date): Promise<Array<Message>> {
        // TODO: query DB
        return Promise.resolve([]);
    }

    public addMessage(text: string, validFrom: Date, invalidFrom: Date, author: string): Promise<boolean> {
        // TODO: persist in DB
        return Promise.resolve(false);
    }

    public deleteMessage(id: number): Promise<boolean> {
        // TODO: persist in DB
        return Promise.resolve(false);
    }

    private fetch(id: number): Promise<Message> {
        // TODO: fetch from DB
        return Promise.resolve(undefined);
    }

    private update(id: number): Promise<Message> {
        // TODO: fetch from DB
        return Promise.resolve(undefined);
    }

}
