import Foundation

class MessageService {
    // TODO: get apiKey from .. somewhere? settings? keychain? env-var?
    let apiEndpoint = ""
    let apiKey = ""

    func getMessages(withCompletion completion: @escaping ([Message]?) -> Void) {
        let url:URL = URL(string: "\(apiEndpoint)/messages")!

        let configuration = URLSessionConfiguration.ephemeral
        configuration.httpAdditionalHeaders = [
            "Accept": "application/json",
            "X-INFLUSS-API": apiKey,
        ] as [AnyHashable:Any]
        
        let session = URLSession(configuration: configuration, delegate: nil, delegateQueue: OperationQueue.main)
        let task = session.dataTask(with: url, completionHandler: { [weak self] (data: Data?, response: URLResponse?, error: Error?) -> Void in
            
            guard let data = data else {
                print("Failed to fetch messages from backend")
                completion(nil)
                return
            }

            self?.createMessage(json: data, completion: completion)
        })
        task.resume()
    }
    
    private func createMessage(json: Data, completion: @escaping ([Message]?) -> Void) {
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        decoder.dateDecodingStrategy = .formatted(DateFormatter.iso8601Full)
        
        do {
            let messages = try decoder.decode([Message].self, from: json)
            return completion(messages)
        } catch let err {
            print("Err", err)
        }
        return completion(nil)
    }
    
}

// add support for ISO-8601 with fractional seconds
extension DateFormatter {
    static let iso8601Full: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZZZZZ"
        formatter.calendar = Calendar(identifier: .iso8601)
        formatter.timeZone = TimeZone(secondsFromGMT: 0)
        formatter.locale = Locale(identifier: "en_US_POSIX")
        return formatter
    }()
}

