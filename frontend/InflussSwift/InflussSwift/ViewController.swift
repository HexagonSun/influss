import Cocoa

class ViewController: NSViewController {
    
    @IBOutlet weak var messageLabel: NSTextFieldCell!
    @IBOutlet weak var bottomLabel: NSTextFieldCell!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let adapter = MacOsViewLabelAdapter(controller: self)
        let handler = ViewHandler(viewLabels: adapter)
        appDelegate.viewHandler = handler
    }
    var appDelegate:AppDelegate {
        return NSApplication.shared.delegate as! AppDelegate
    }

}

class MacOsViewLabelAdapter: ViewLabels {
    
    let messageControl: NSTextFieldCell
    let statusControl: NSTextFieldCell
    
    init(controller: ViewController) {
        messageControl = controller.messageLabel
        statusControl = controller.bottomLabel
    }

    func setMessage(_ text: String) {
        messageControl.stringValue = text
    }
    
    func setStatus(_ text: String) {
        statusControl.stringValue = text
    }

}
