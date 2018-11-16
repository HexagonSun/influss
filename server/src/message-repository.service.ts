import {Pool} from 'pg';
import {Message} from "./message.model";

export class MessageRepository {

    private pool:Pool = new Pool({
      user: process.env.INFLUSS_COMMON_DB_USER,
      host: 'localhost',
      database: process.env.INFLUSS_COMMON_DB_SCHEMA_NAME,
      password: process.env.INFLUSS_COMMON_DB_PASSWORD,
      port: process.env.INFLUSS_COMMON_DB_PORT,
    });

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
