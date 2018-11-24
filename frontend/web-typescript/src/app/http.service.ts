
class HttpService {

  protected api = async <T extends {}>(url: string): Promise<T> =>
    fetch(url)
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

}
