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
   
    
   

    @IBAction func signIn(_ sender: Any) {
        GIDSignIn.sharedInstance().signIn()
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        GIDSignIn.sharedInstance()?.presentingViewController = self
        GIDSignIn.sharedInstance().delegate = self
    }

    func sign(_ signIn: GIDSignIn!, didSignInFor user: GIDGoogleUser!, withError error: Error!) {
          if let error = error {
          print(error.localizedDescription)
          return
          }
          guard let auth = user.authentication else { return }
          let credentials = GoogleAuthProvider.credential(withIDToken: auth.idToken, accessToken: auth.accessToken)
          Auth.auth().signIn(with: credentials) { (authResult, error) in
          if let error = error {
          print(error.localizedDescription)
          } else {
            print("Login Successful")
            print(authResult?.user.displayName)
            self.performSegue(withIdentifier: "welcome", sender: nil)
            
          }
            
      }
}
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        if Auth.auth().currentUser != nil {
            self.performSegue(withIdentifier: "welcome", sender: nil)
        } else {
          // No user is signed in.
          // ...
        }
    }
}
