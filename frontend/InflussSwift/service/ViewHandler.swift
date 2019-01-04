//import Foundation
import Cocoa

protocol ViewLabels {
    func setMessage(_ text: String)
    func setStatus(_ text: String)
}

class ViewHandler {
    let viewLabels: ViewLabels
    let updateDelay: TimeInterval = 4
    
    var client : InflussClient? = nil
    var messageUpdater: Looper!
    var messageIndex: Int = 0
    
    init(viewLabels: ViewLabels) {
        self.viewLabels = viewLabels

        client = InflussClient()
        initLabels()
        messageUpdater = Looper(self.updateDelay, self)
    }
    
    func initLabels() {
        viewLabels.setMessage("↻")
        updateFooter()
    }
    
    func updateMessage() {
        let messageLength = client?.messages.count ?? 0
        if (messageLength == 0) {
            // nothing to do
            return
        }
        viewLabels.setMessage(client?.messages[messageIndex].text ?? "…")
    }
    
    func updateFooter() {
        let messageLength = client?.messages.count ?? 0
        let idx = messageLength == 0 ? "–" : "\(self.messageIndex + 1)"
        viewLabels.setStatus("\(idx) / \(messageLength)")
    }
    
    func getNextIndex() -> Int {
        let messageLength = client?.messages.count ?? 0
        if (messageLength == 0) {
            return 0
        }
        return (self.messageIndex + 1) % messageLength
    }

}

extension ViewHandler: LooperDelegate {
    func apply() {
        updateMessage()
        updateFooter()
        
        messageIndex = getNextIndex()
    }
}
