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
