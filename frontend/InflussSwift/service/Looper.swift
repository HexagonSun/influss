import Foundation

protocol LooperDelegate {
    func apply()
}

class Looper {
    let intervalSeconds: TimeInterval
    let delegate: LooperDelegate
    var timer: Timer!
    
    init(_ intervalSeconds: TimeInterval, _ delegate: LooperDelegate) {
        self.intervalSeconds = intervalSeconds
        self.delegate = delegate
        resume()
    }
    
    deinit {
        timer.invalidate()
    }
    
    func createTimer() -> Timer {
        return Timer.scheduledTimer(timeInterval: self.intervalSeconds,
                                    target: self,
                                    selector: #selector(timerAction),
                                    userInfo: nil,
                                    repeats: true)
    }
    
    @objc dynamic func timerAction() {
        self.delegate.apply()
    }

}

extension Looper: Pausable {

    func suspend() {
        timer.invalidate()
    }
    
    func resume() {
        self.timer = createTimer()
    }

}
