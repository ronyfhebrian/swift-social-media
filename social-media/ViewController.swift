//
//  ViewController.swift
//  social-media
//
//  Created by Rony Fhebrian on 5/21/16.
//  Copyright © 2016 Rony Fhebrian. All rights reserved.
//

import UIKit
import Firebase
import FBSDKLoginKit
import FBSDKCoreKit

class ViewController: UIViewController {
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func fbBtnPressed(sender: UIButton!) {
        let facebookLogin = FBSDKLoginManager()
        
        facebookLogin.logInWithReadPermissions(["email"]) { (facebookResult: FBSDKLoginManagerLoginResult!, facebookError: NSError!) in
            
            if facebookError != nil {
                print("Facebook login failed. Error \(facebookError)")
            } else {
                let credential = FIRFacebookAuthProvider.credentialWithAccessToken(FBSDKAccessToken.currentAccessToken().tokenString)
                print(credential)
                FIRAuth.auth()?.signInWithCredential(credential, completion: { (user, error) in
                    print("sucess")
                })
                
            }
        }
        
    }
    
    
    

}

