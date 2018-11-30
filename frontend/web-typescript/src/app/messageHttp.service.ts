import { Message } from './message.model';

export class MessageHttpService extends HttpService {

    public async getMessages(): Promise<Array<Message>> {
        return this.api('/messages')
          .then((res: Array<Message>) => {
              console.log('Received data from backend: ', res);

              return res;
          });
    }

}
