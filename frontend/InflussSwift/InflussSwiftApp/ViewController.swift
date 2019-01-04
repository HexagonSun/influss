import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var messageLabel: UILabel!
    @IBOutlet weak var statusLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let adapter = IOsViewLabelAdapter(controller: self)
        let handler = ViewHandler(viewLabels: adapter)
        appDelegate.viewHandler = handler
    }

    var appDelegate: AppDelegate {
        return UIApplication.shared.delegate as! AppDelegate
    }

}

class IOsViewLabelAdapter: ViewLabels {
    
    let messageControl: UILabel
    let statusControl: UILabel
    
    init(controller: ViewController) {
        messageControl = controller.messageLabel
        statusControl = controller.statusLabel
    }
    
    func setMessage(_ text: String) {
        messageControl.text = text
    }
    
    func setStatus(_ text: String) {
        statusControl.text = text
    }
    
}
