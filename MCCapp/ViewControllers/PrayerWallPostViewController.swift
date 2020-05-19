//
//  PrayerWallPostViewController.swift
//  MCCapp
//
//  Created by Xcode Mac on 5/10/20.
//  Copyright © 2020 MCCTechMinistry. All rights reserved.
//

import UIKit
import FirebaseDatabase
import GoogleSignIn
import FirebaseAuth

class PrayerWallPostViewController: UIViewController, UITextViewDelegate {
    @IBOutlet weak var privacyFilter: UISwitch!
    
    @IBOutlet weak var prayerPostText: UITextView!
    var prayerRef:DatabaseReference?
    
    

    override func viewDidLoad() {
        super.viewDidLoad()

        prayerRef = Database.database().reference()
     
     

    }
 
    
//    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
//        if text == "\n" {
//            textView.resignFirstResponder()
//        }
//        return true
//    }

  
    
//////////////////////////////////
    @IBAction func didPostPrayerRequest(_ sender: Any) {
        
       
        var userInfo = Auth.auth().currentUser?.displayName
        
        
        if privacyFilter.isOn {
            userInfo? = "Anonymous"
        }
        
        let prayerPosted:[String: Any] = ["praydate": [".sv":"timestamp"], "prayer": prayerPostText.text!,"username":userInfo!]
        
        prayerRef?.child("Prayers").childByAutoId().setValue(prayerPosted)
        
        print("Any")
        
        //Dismiss popover
        presentingViewController?.dismiss(animated: true, completion: nil)
    
    }
    
    
    @IBAction func didCancelPrayerRequest(_ sender: Any) {
        
        //Dismiss popover
        presentingViewController?.dismiss(animated: true, completion: nil)
    }
    
 
}
