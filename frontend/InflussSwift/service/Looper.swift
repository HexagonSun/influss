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
        self.timer = Timer.scheduledTimer(timeInterval: self.intervalSeconds,
                                          target: self,
                                          selector: #selector(timerAction),
                                          userInfo: nil,
                                          repeats: true)
    }
    
    deinit {
        timer.invalidate()
    }
    
    @objc dynamic func timerAction() {
        self.delegate.apply()
    }

}
