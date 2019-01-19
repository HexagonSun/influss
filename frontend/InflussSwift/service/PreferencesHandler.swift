import Foundation

class PreferencesHandler {
    
    var preferences = Preferences()

    func publish() {
        publish(preferences: self.preferences)
    }

    func publish(preferences: Preferences) {
        NotificationCenter.default.post(name: .influssPreferencesChanged, object: preferences)
    }

}

extension Notification.Name {
    static let influssPreferencesChanged = Notification.Name("influssPreferencesChanged")
}
