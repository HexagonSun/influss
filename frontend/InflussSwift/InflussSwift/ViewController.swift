import Cocoa

class ViewController: NSViewController {

    @IBOutlet weak var messageLabel: NSTextField!
    @IBOutlet weak var bottomLabel: NSTextFieldCell!
    
    let updateDelay: TimeInterval = 4
    
    var client : InflussClient? = nil
    var messageUpdater: Looper!
    var messageIndex: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        messageLabel.stringValue = "↻"
        updateFooter()
        
        // starting client
        client = InflussClient()
        messageUpdater = Looper(self.updateDelay, self)
    }

}

extension ViewController {
    
    func updateMessage() {
        let messageLength = client?.messages.count ?? 0
        if (messageLength == 0) {
            // nothing to do
            return
        }
        messageLabel.stringValue = client?.messages[messageIndex].text ?? "…"
    }
    
    func updateFooter() {
        let messageLength = client?.messages.count ?? 0
        let idx = messageLength == 0 ? "–" : "\(self.messageIndex + 1)"
        bottomLabel.stringValue = "\(idx) / \(messageLength)"
    }
    
    func getNextIndex() -> Int {
        let messageLength = client?.messages.count ?? 0
        if (messageLength == 0) {
            return 0
        }
        return (self.messageIndex + 1) % messageLength
    }
}
    
extension ViewController: LooperDelegate {
    func apply() {
        updateMessage()
        updateFooter()
        
        messageIndex = getNextIndex()
    }
}
