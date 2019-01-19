import Cocoa

class PreferencesViewController: NSViewController {
    
    @IBOutlet weak var apiEndpointInput: NSTextField!
    @IBOutlet weak var apiKeyInput: NSTextField!
    
    var appDelegate: AppDelegate {
        return NSApplication.shared.delegate as! AppDelegate
    }
    
    var preferencesHandler: PreferencesHandler {
        return appDelegate.preferencesHandler!
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        showExistingPreferences(handler: self.preferencesHandler)
    }
    
    @IBAction func onCancel(_ sender: Any) {
        view.window?.close()
    }
    
    @IBAction func onOK(_ sender: Any) {
        savePreferences(handler: self.preferencesHandler)
        view.window?.close()
    }
    
    func showExistingPreferences(handler: PreferencesHandler) {
        let apiEndpoint = handler.preferences.apiEndpoint
        let apiKey = handler.preferences.apiKey
        
        apiEndpointInput.stringValue = apiEndpoint
        apiKeyInput.stringValue = apiKey
    }
    
    func savePreferences(handler: PreferencesHandler) {
        handler.preferences.apiEndpoint = apiEndpointInput.stringValue
        handler.preferences.apiKey = apiKeyInput.stringValue
        handler.publish()
    }
    
}
