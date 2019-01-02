import Foundation

class InflussClient {
    let messageService: MessageService
    let messages: [Message] = []
    let fetchDelay: TimeInterval = 5

    var looper: Looper!

    init() {
        messageService = MessageService()
        looper = Looper(self.fetchDelay, self)
    }

    func processTick() {
        print("processing tick")
        messageService.getMessages(withCompletion: processMessages)
    }
    
    func processMessages(messages: [Message]?) {
        guard let messages = messages else {
            // no messages available
            return
        }
        
        // TODO: acutally update messages
        print("Received messages from backend:")
        for msg in messages {
            print("\t*** \(msg)")
        }
    }
}

extension InflussClient: LooperDelegate {
    func apply() {
        self.processTick()
    }
}
