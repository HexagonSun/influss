import {Message} from "./message.model";

export class MessageRepository {

    constructor() {

    }

    public fetchAll(date: Date): Promise<Array<Message>> {
        // TODO: fetch from DB
        return Promise.resolve([]);
    }

    public fetch(id: number): Promise<Message> {
        // TODO: fetch from DB
        return Promise.resolve(undefined);
    }

    public update(id: number): Promise<Message> {
        // TODO: update in DB
        return Promise.resolve(undefined);
    }

    public delete(id: number): Promise<boolean> {
        // TODO: delete in DB
        return Promise.resolve(false);
    }

    public add(msg: Message): Promise<Message> {
        // TODO: create in DB
        return Promise.resolve(msg);
    }

}
