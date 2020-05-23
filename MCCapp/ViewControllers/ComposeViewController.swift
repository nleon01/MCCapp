//
//  ComposeViewController.swift
//  MCCapp
//
//  Created by Xcode Mac on 5/12/20.
//  Copyright © 2020 MCCTechMinistry. All rights reserved.
//

import UIKit
import FirebaseDatabase
import FirebaseAuth
import GoogleSignIn

class ComposeViewController: UIViewController, UITextViewDelegate {
    
    @IBOutlet weak var textView: UITextView!
    @IBOutlet weak var titleEvents: UITextView!
    
    var ref:DatabaseReference?
    
    struct postRef {
        var textView: UITextView?
}
    
    override func viewDidLoad() {
        super.viewDidLoad()
ref = Database.database().reference()
    
        
}
   

    
    
    @IBAction func addPost(_ sender: Any) {
        
    
        
        let objectToSave: [String: Any] = ["date": [".sv":"timestamp"], "text": textView.text,"title":titleEvents.text]
        
        
        
        ref?.child("Posts").childByAutoId().setValue(objectToSave)
        
        //Dismiss popover
        presentingViewController?.dismiss(animated: true, completion: nil)
}
    
    @IBAction func cancelPost(_ sender: Any) {
        //Dismiss popover
        presentingViewController?.dismiss(animated: true, completion: nil)
}
    
    
    
}
