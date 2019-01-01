import Cocoa

class ViewController: NSViewController {

    @IBOutlet weak var messageLabel: NSTextField!
    @IBOutlet weak var bottomLabel: NSTextFieldCell!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        messageLabel.stringValue = "my message"
        bottomLabel.stringValue = "my label"
    }
    
    override var representedObject: Any? {
        didSet {
        // Update the view, if already loaded.
        }
    }


}

