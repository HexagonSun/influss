import Cocoa

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {

    var viewHandler: ViewHandler? = nil
    var preferencesHandler: PreferencesHandler? = nil

    func applicationDidFinishLaunching(_ aNotification: Notification) {
        self.preferencesHandler = PreferencesHandler()
        self.preferencesHandler!.publish()
    }

}
