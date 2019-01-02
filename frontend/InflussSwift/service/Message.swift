import Foundation

struct Message : Codable {
    // be sure to decode with "convertFromSnakeCase"
    let id: Int
    let text: String
    let validFrom: Date
    let invalidFrom: Date
    let author: String
    let createdAt: Date
    let modifiedAt: Date
    let deleted: String
    
    func isDeleted() -> Bool {
        return "0" == deleted
    }

}
