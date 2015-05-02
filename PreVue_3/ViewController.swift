import UIKit

class ViewController: UIViewController {
    
    @IBAction func getStarted(sender: AnyObject) {
        let settings = NSUserDefaults.standardUserDefaults()
        
        if (settings.stringForKey("fbToken") != nil) {
            let token = settings.stringForKey("fbToken")
            println("already have a token \(token)")
            
            self.performSegueWithIdentifier("getStarted", sender: self)
        
        } else {
        PFFacebookUtils.logInInBackgroundWithReadPermissions(["public_profile"], block: { (user, error) -> Void in
            if let user = user {
                let token = FBSDKAccessToken.currentAccessToken().tokenString
                
                settings.setObject(token, forKey: "fbToken")
                
                self.performSegueWithIdentifier("getStarted", sender: self)
                
                println("got new token \(token)")
            } else {
                println("user cancelled")
            }
        })
        }
    }
}


