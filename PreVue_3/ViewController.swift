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
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        var tabBarController = segue.destinationViewController as! UITabBarController
        
        if let unwrappedViewcontrollers = tabBarController.viewControllers {
            
            var imageSelectionController = unwrappedViewcontrollers[0] as! ImageSelectionViewController
            imageSelectionController.tabBarItem.image = UIImage(named: "camera-7.png")
            
            var imageGradingController = unwrappedViewcontrollers[1] as! ImageGradingViewController
            imageGradingController.tabBarItem.image = UIImage(named: "character-a-7.png")
            
            var gradedImagesController = unwrappedViewcontrollers[2] as! GradedImagesViewController
            gradedImagesController.tabBarItem.image = UIImage(named: "emoticon-smile-7.png")
            
            var settingsController = unwrappedViewcontrollers[3] as! SettingsViewController
            settingsController.tabBarItem.image = UIImage(named: "gear-7.png")
        }
    }
    
}


