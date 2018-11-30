/* tslint:disable-next-line:no-any */
type WaitResult= (res: any) => number;

export class Looper {

    public constructor(interval: number, callback: () => void) {
        this.loop(interval, callback)
            .catch((err: Error) => {
                console.error('Error running looper', err);
            });
    }

    private readonly loop = async (interval: number, callback: () => void): Promise<void> => {
        while (true) {
            callback();
            await this.wait(interval);
        }
    }

    private readonly wait = async (ms: number): Promise<WaitResult> =>
        /* tslint:disable-next-line:no-any */
        new Promise<WaitResult>((res: any): number => window.setTimeout(res, ms))

}
