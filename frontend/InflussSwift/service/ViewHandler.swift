//import Foundation
import Cocoa

class ViewHandler {
    
    let messageControl: NSCell
    let footerControl: NSCell
    let updateDelay: TimeInterval = 4
    
    var client : InflussClient? = nil
    var messageUpdater: Looper!
    var messageIndex: Int = 0
    
    init(messageControl: NSCell, footerControl: NSCell) {
        self.messageControl = messageControl
        self.footerControl = footerControl
        
        // starting client
        client = InflussClient()
        
        // init
        messageControl.stringValue = "↻"
        updateFooter()
        
        messageUpdater = Looper(self.updateDelay, self)
    }
    
    func updateMessage() {
        let messageLength = client?.messages.count ?? 0
        if (messageLength == 0) {
            // nothing to do
            return
        }
        messageControl.stringValue = client?.messages[messageIndex].text ?? "…"
    }
    
    func updateFooter() {
        let messageLength = client?.messages.count ?? 0
        let idx = messageLength == 0 ? "–" : "\(self.messageIndex + 1)"
        footerControl.stringValue = "\(idx) / \(messageLength)"
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
