//
//  SignInViewController.swift
//  MCCapp
//
//  Created by Xcode Mac on 5/10/20.
//  Copyright © 2020 MCCTechMinistry. All rights reserved.
//

import UIKit
import GoogleSignIn
import Firebase

class SignInViewController: UIViewController, GIDSignInDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
GIDSignIn.sharedInstance()?.delegate = self
        // Do any additional setup after loading the view.
    }
    
    @IBAction func Gsign_In(_ sender: Any) {
        GIDSignIn.sharedInstance()?.presentingViewController = self
        GIDSignIn.sharedInstance()?.signIn()
        
    }
    
    func sign(_ signIn: GIDSignIn!, didSignInFor user: GIDGoogleUser!, withError error: Error!) {
         if error != nil{
             return
         }
         guard let authentication = user.authentication else {return}
         let credential = GoogleAuthProvider.credential(withIDToken: authentication.idToken, accessToken: authentication.accessToken)
        
        
        Auth.auth().signIn(with: credential) { (authResult, error) in
            if (error != nil){
                return
            }else{
           
            
            }
        }
        
        
        
        }
    
    
    
    
    
     func sign(_ signIn: GIDSignIn!, didDisconnectWith user: GIDGoogleUser!, withError error: Error!) {
     if let error = error {
         print("\(error.localizedDescription)")
     }
     }
    

}
