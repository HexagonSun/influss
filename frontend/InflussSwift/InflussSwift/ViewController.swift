import Cocoa

class ViewController: NSViewController {
    
    @IBOutlet weak var messageLabel: NSTextFieldCell!
    @IBOutlet weak var bottomLabel: NSTextFieldCell!

    var handler: ViewHandler!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        handler = ViewHandler(messageControl: messageLabel, footerControl: bottomLabel)
    }

}
