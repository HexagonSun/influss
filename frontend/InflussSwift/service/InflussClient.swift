import Foundation

class InflussClient {
    let messageService: MessageService
    let fetchDelay: TimeInterval = 5

    var messages: [Message] = []
    var messageFetcher: Looper!

    init() {
        messageService = MessageService()
        messageFetcher = Looper(self.fetchDelay, self)
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
        messageService.getMessages(withCompletion: processMessages)
    }
}

extension InflussClient: Pausable {

    func suspend() {
        messageFetcher.suspend()
    }
    
    func resume() {
        messageFetcher.resume()
    }

}
