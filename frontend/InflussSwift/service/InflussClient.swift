import Foundation

class InflussClient {
    let messageService: MessageService
    let fetchDelay: TimeInterval = 5

    var messages: [Message] = []
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
        self.messages = messages.filter { !$0.isDeleted() }
    }
}

extension InflussClient: LooperDelegate {
    func apply() {
        self.processTick()
    }
}
