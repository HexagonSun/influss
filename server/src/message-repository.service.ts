import {Pool} from 'pg';
import {Message} from "./message.model";

export class MessageRepository {
    private pool:Pool = new Pool({
      host: process.env.INFLUSS_DB_HOST,
      port: process.env.INFLUSS_DB_PORT,
      database: process.env.INFLUSS_DB_DATABASE,
      user: process.env.INFLUSS_DB_USER,
      password: process.env.INFLUSS_DB_PASSWORD,
    });

    constructor() {
    }

    public fetchAll(date: Date): Promise<Array<Message>> {
        const query = {
          text: 'SELECT * FROM MESSAGE WHERE valid_from <= ($1) and invalid_from > ($1)',
          values: [ date ],
        }

        return this.pool.query(query)
          .then(res => Promise.resolve(this.convertRows(res.rows)))
          .catch(e => console.error(e.stack));
    }

    public fetch(id: number): Promise<Message> {
        const query = {
          text: 'SELECT * FROM MESSAGE WHERE id = ($1)',
          values: [ id ],
        }

        return this.pool.query(query)
          .then(res => Promise.resolve(this.convertRows(res.rows)))
          .catch(e => console.error(e.stack));
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

    private handleResult(error, result): Array<Message> | undefined {
      if(error) {
         console.log(error);
         return undefined;
      }
      return this.convertRows(result.rows);
    }

    private convertRows(rows: Array<any>): Array<Message> {
      const data = [];
      for (let row of rows) {
        data.push(this.convertToMessage(row));
      }
      return data;
    }

    private convertToMessage(row: any): Message {
      return <Message>row;
    }

}
