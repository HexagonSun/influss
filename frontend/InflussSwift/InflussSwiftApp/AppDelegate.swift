import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    var viewHandler: ViewHandler?
    
    func applicationWillResignActive(_ application: UIApplication) {
        viewHandler?.suspend();
    }
    
    func applicationDidEnterBackground(_ application: UIApplication) {
        viewHandler?.suspend();
    }
    
    func applicationWillEnterForeground(_ application: UIApplication) {
        viewHandler?.resume()
    }
    
    func applicationDidBecomeActive(_ application: UIApplication) {
        viewHandler?.resume()
    }
    
}
