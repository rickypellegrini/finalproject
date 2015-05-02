import UIKit
import Parse

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        
        Parse.setApplicationId("oSQW4nl786x4z1DVGHMNcVvlGmFp6HFxNmbQsyAt", clientKey: "1jZ3CKMvBQfhfPs8kusvQ1xtsjxPJi5temdWWvOR")
        
        PFFacebookUtils.initializeFacebookWithApplicationLaunchOptions(launchOptions ?? [NSObject: AnyObject]())
        return true
    }

    func application(application: UIApplication, openURL url: NSURL, sourceApplication: String?, annotation: AnyObject?) -> Bool {
        return FBSDKApplicationDelegate.sharedInstance().application(application, openURL: url, sourceApplication: sourceApplication, annotation: annotation)
    }

}

