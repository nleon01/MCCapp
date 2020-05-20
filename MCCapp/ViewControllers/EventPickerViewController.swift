//
//  EventPickerViewController.swift
//  MCCapp
//
//  Created by Xcode Mac on 5/17/20.
//  Copyright © 2020 MCCTechMinistry. All rights reserved.
//

import UIKit
import FirebaseDatabase
import Firebase
import FirebaseStorage
import KMPlaceholderTextView
import IQKeyboardManager

class EventPickerViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate,UITextViewDelegate {

    

        var eventsRef: DatabaseReference!
        var eventImagesRef : DatabaseReference!
        
       
        
        let imagePicker = UIImagePickerController()
        
        @IBOutlet weak var eventsTitleTextField: UITextView!
        @IBOutlet weak var eventDateSelector: UIDatePicker!
        
        @IBOutlet weak var eventTimePicker: UIDatePicker!
        @IBOutlet weak var eventsLocation: UITextView!
        
        @IBOutlet weak var bottomConstraint: NSLayoutConstraint!
        
        @IBAction func eventsDateSelector(_ sender: Any) {
            
            
            
            
        }
        @IBOutlet weak var eventsFlyerImagePicker:
          UIImageView!
        @IBAction func imageSelector(_ sender: Any) {
            

            
            let alert = UIAlertController(title: "Choose Image", message: nil, preferredStyle: .actionSheet)
            alert.addAction(UIAlertAction(title: "Camera", style: .default, handler: { _ in
                self.openCamera()
            }))
            
            alert.addAction(UIAlertAction(title: "Gallery", style: .default, handler: { _ in
                self.openGallery()
            }))
            
            alert.addAction(UIAlertAction.init(title: "Cancel", style: .cancel, handler: nil))
            
            self.present(alert, animated: true, completion: nil)
            
            
            
            
        }
        
        override func viewDidLoad() {
            super.viewDidLoad()
            
            
            eventsRef = Database.database().reference()
      
            eventImagesRef = Database.database().reference()
            
        
          
            imagePicker.delegate = self
            
            eventsLocation.dataDetectorTypes = (UIDataDetectorTypes.all)
            
            eventsTitleTextField.dataDetectorTypes = (UIDataDetectorTypes.all)
        
            
        }
    
        
        
        
        func adjustingHeight(show:Bool, notification:NSNotification) {
            // 1
            var userInfo = notification.userInfo!
            // 2
            let keyboardFrame:CGRect = (userInfo[UIResponder.keyboardFrameBeginUserInfoKey] as! NSValue).cgRectValue
            // 3
            let animationDurarion = userInfo[UIResponder.keyboardAnimationDurationUserInfoKey] as! TimeInterval
            // 4
            let changeInHeight = keyboardFrame.height
                
                //(CGRectGetHeight(keyboardFrame) + 40) * (show ? 1 : -1)
            //5
            UIView.animate(withDuration: animationDurarion, animations: { () -> Void in
                self.bottomConstraint.constant += changeInHeight
            })
            
        }
        
        

        
        
        @objc func keyboardWillShow(notification:NSNotification) {
            adjustingHeight(show: true, notification: notification)
        }
        
        @objc func keyboardWillHide(notification:NSNotification) {
            adjustingHeight(show: false, notification: notification)
        }
        
        
        
        
        func openCamera()
        {
            if UIImagePickerController.isSourceTypeAvailable(UIImagePickerController.SourceType.camera) {
                let imagePicker = UIImagePickerController()
                imagePicker.delegate = self
                imagePicker.sourceType = UIImagePickerController.SourceType.camera
                imagePicker.allowsEditing = true
                self.present(imagePicker, animated: true, completion: nil)
            }
            else
            {
                let alert  = UIAlertController(title: "Warning", message: "You don't have camera", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
                self.present(alert, animated: true, completion: nil)
            }
        }
        
        
        
        
        func openGallery()
        {
            if UIImagePickerController.isSourceTypeAvailable(UIImagePickerController.SourceType.photoLibrary){
                let imagePicker = UIImagePickerController()
                imagePicker.delegate = self
                imagePicker.allowsEditing = true
                imagePicker.sourceType = UIImagePickerController.SourceType.photoLibrary
                self.present(imagePicker, animated: true, completion: nil)
            }
            else
            {
                let alert  = UIAlertController(title: "Warning", message: "You don't have permission to access gallery.", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
                self.present(alert, animated: true, completion: nil)
            }
        }
        
        func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
            if let pickedImage = info[UIImagePickerController.InfoKey.editedImage] as? UIImage {
                eventsFlyerImagePicker.contentMode = .scaleAspectFit
                eventsFlyerImagePicker.image = pickedImage
            }
            dismiss(animated: true, completion: nil)
        }
        
        
        func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
            dismiss(animated: true, completion: nil)
        }
        
        @IBAction func dismissEventsOrganizer(_ sender: Any) {
            
            dismiss(animated: true, completion: nil)
        }
        
        
        
        
        
        @IBAction func saveEventsButton(_ sender: Any) {
            
            
            let randomID = UUID.init().uuidString
            let imageRef = Storage.storage().reference(withPath: "Events/\(randomID).jpg")
            guard let eventsImageData = eventsFlyerImagePicker.image?.jpegData(compressionQuality: 0.75) else {return}
            let uploadMetadata = StorageMetadata.init()
            uploadMetadata.contentType = "image/jpeg"
            
            imageRef.putData(eventsImageData, metadata: uploadMetadata) { (downloadMetadata, error) in
                if let error = error {
                    
                    print("Something went wrong! \(error.localizedDescription)")
                }
                
                imageRef.downloadURL(completion: { (url, error) in
                    if let error = error {
                        
                        print("Something went wrong! \(error.localizedDescription)")
                        
                       
                        
                        return
                    }
                    
                    if  let url = url?.absoluteString{
                         print(url)
                    
                
                        let A = DateFormatter.localizedString(from: self.eventDateSelector.date, dateStyle: DateFormatter.Style.full, timeStyle: DateFormatter.Style.none) as String
                        
                        let B = DateFormatter.localizedString(from: self.eventTimePicker.date, dateStyle: DateFormatter.Style.none, timeStyle: DateFormatter.Style.short) as String
                        
                        let eventsDates = "\(A) @\(B)"
                        
                        print(eventsDates.description)
                        
                        let eventSaved:[String: Any] = ["eventdate": eventsDates,"eventtitle":self.eventsTitleTextField.text!,"eventlocation":self.eventsLocation.text!,"ImageUrl":url, "postdate": [".sv":"timestamp"]]
                        
                        self.eventsRef.child("Church Events").childByAutoId().setValue(eventSaved)
                        
                        
                        
                    }
                })
            }
            
            
            self.dismiss(animated: true, completion: nil)
        
        }
}
