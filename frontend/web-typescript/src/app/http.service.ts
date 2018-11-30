// Global variables from index.html
declare var INFLUSS_API_HOST: string;
declare var INFLUSS_API_PORT: string;

class HttpService {

  private readonly DEFAULT_PORT: number = 5555;
  private readonly API_HOST: string = INFLUSS_API_HOST || 'localhost';
  private readonly API_PORT: number = parseInt(INFLUSS_API_PORT, 10) || this.DEFAULT_PORT;

  protected api = async <T extends {}>(path: string): Promise<T> =>
    fetch(this.fromPath(path))
      .then(async (response: Response): Promise<T> => {
        if (!response.ok) {
          throw new Error(response.statusText);
        }

        return response.json();
      })
      .then((data: T) => data)
      .catch((error: Error) => {
        console.error(error);
        throw error;
      })

  private readonly fromPath = (path: string): string => `${this.baseUrl()}${path}`;

  private readonly baseUrl = (): string => `http://${this.API_HOST}:${this.API_PORT}`;

}
