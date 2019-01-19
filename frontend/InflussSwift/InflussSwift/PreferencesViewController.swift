import Cocoa

class PreferencesViewController: NSViewController {
    
    var prefs = Preferences()
    
    @IBOutlet weak var apiEndpointInput: NSTextField!
    @IBOutlet weak var apiKeyInput: NSTextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        showExistingPreferences()
    }
    
    @IBAction func onCancel(_ sender: Any) {
        view.window?.close()
    }
    
    @IBAction func onOK(_ sender: Any) {
        savePreferences()
        view.window?.close()
    }
    
    func showExistingPreferences() {
        let apiEndpoint = prefs.apiEndpoint
        let apiKey = prefs.apiKey
        
        apiEndpointInput.stringValue = apiEndpoint
        apiKeyInput.stringValue = apiKey
    }
    
    func savePreferences() {
        prefs.apiEndpoint = apiEndpointInput.stringValue
        prefs.apiKey = apiKeyInput.stringValue
    }
    
}
