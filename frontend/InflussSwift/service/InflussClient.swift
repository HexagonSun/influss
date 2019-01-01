import Foundation

class InflussClient {

    let messages: [Message] = []
    let fetchDelay: TimeInterval = 5

    var looper: Looper!

    init() {
        looper = Looper(self.fetchDelay, self)
    }

    func processTick() {
        print("processing tick")
    }
}

extension InflussClient: LooperDelegate {
    func apply() {
        self.processTick()
    }
}
