import Foundation

class MessageService {

    var apiEndpoint = ""
    var apiKey = ""

    init() {
        self.setupPreferencesListener()
    }

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

extension MessageService {
    func setupPreferencesListener() {
        NotificationCenter.default.addObserver(forName: .influssPreferencesChanged, object: nil, queue: nil) {
            (notification) in self.updateFromPreferences(notification)
        }
    }

    func updateFromPreferences(_ notification: Notification) {
        guard notification.object is Preferences else {
            return
        }
        let preferences: Preferences = notification.object as! Preferences
        
        self.apiEndpoint = preferences.apiEndpoint
        self.apiKey = preferences.apiKey
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

