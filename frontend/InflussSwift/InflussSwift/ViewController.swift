import Cocoa

class ViewController: NSViewController {
    
    @IBOutlet weak var messageLabel: NSTextFieldCell!
    @IBOutlet weak var bottomLabel: NSTextFieldCell!

    var handler: ViewHandler!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let adapter = MacOsViewLabelAdapter(controller: self)
        handler = ViewHandler(viewLabels: adapter)
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
