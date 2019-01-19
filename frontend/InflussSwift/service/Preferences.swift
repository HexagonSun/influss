import Foundation

struct Preferences {
    
    private let userDefaultsApiEndpoint: String = "apiEndpoint"
    private let userDefaultsApiKey: String = "apiKey"
    
    var apiEndpoint: String {
        get {
            return UserDefaults.standard.string(forKey: userDefaultsApiEndpoint) ?? ""
        }
        set {
            UserDefaults.standard.set(newValue, forKey: userDefaultsApiEndpoint)
        }
    }
    
    var apiKey: String {
        get {
            return UserDefaults.standard.string(forKey: userDefaultsApiKey) ?? ""
        }
        set {
            UserDefaults.standard.set(newValue, forKey: userDefaultsApiKey)
        }
    }

}
