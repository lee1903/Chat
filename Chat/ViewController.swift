//
//  ViewController.swift
//  Chat
//
//  Created by Brian Lee on 2/11/16.
//  Copyright © 2016 brianlee. All rights reserved.
//

import UIKit
import Parse
import JVFloatLabeledTextField

class ViewController: UIViewController {

    
    @IBOutlet weak var signupButton: UIButton!
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var usernameLabel: JVFloatLabeledTextField!
    
    @IBOutlet weak var passwordLabel: JVFloatLabeledTextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: "dismissKeyboard")
        view.addGestureRecognizer(tap)
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func dismissKeyboard(){
        self.view.endEditing(true)
    }
    
    @IBAction func onSignUp(sender: AnyObject) {
        signUp()
    }
    
    @IBAction func onLogin(sender: AnyObject) {
        PFUser.logInWithUsernameInBackground(usernameLabel.text!, password:passwordLabel.text!) {
            (user: PFUser?, error: NSError?) -> Void in
            if user != nil {
                // Do stuff after successful login.
            } else {
                // The login failed. Check error to see why.
            }
        }
    }
    func signUp() {
        let user = PFUser()
        user.username = usernameLabel.text!
        user.password = passwordLabel.text!
        user.email = "12323232@gmail.com"
        
        user.signUpInBackgroundWithBlock {
            (succeeded: Bool, error: NSError?) -> Void in
            if let error = error {
                let errorString = error.userInfo["error"] as? NSString
                // Show the errorString somewhere and let the user try again.
            } else {
                // Hooray! Let them use the app now.
            }
        }
    }

}

