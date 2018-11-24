export class MessageHttpService extends HttpService {

    public async getMessages(): Promise<Array<string>> {
        return this.api('http://localhost:5555/messages')
          .then((res: Array<string>) => {
              console.log('Received data from backend: ', res);

              return res;
          });
    }

}
