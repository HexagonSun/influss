
export class MessageHttpService {

    public async getMessages(): Promise<Array<string>> {
        return fetch('http://localhost:5555/messages')
          .then((res: Response) => res.json())
          .then((res: Array<string>) => {
              console.log('Received data from backend: ', res);

              return res;
          });
    }

}
