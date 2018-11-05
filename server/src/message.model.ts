interface Message {
    readonly id: string,
    readonly text: string,
    readonly validFrom: Date,
    readonly invalidFrom: Date,
    readonly author: string,
    readonly createdAt: Date,
    readonly modifiedAt: Date,
    readonly deleted: boolean,
}
