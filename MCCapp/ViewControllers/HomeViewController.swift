//
//  HomeViewController.swift
//  MCCapp
//
//  Created by Xcode Mac on 5/10/20.
//  Copyright © 2020 MCCTechMinistry. All rights reserved.
//

import UIKit
import MapKit
import FirebaseAuth
import GoogleSignIn

class HomeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

     
     @IBAction func churchLocation(_ sender: Any)
     {
         //Defining destination
         let latitude:CLLocationDegrees = 42.3284719
         let longitude:CLLocationDegrees = -71.097651
         
         let regionDistance:CLLocationDistance = 1000;
         let coordinates = CLLocationCoordinate2DMake(latitude, longitude)
         let regionSpan = MKCoordinateRegion(center: coordinates, latitudinalMeters: regionDistance, longitudinalMeters: regionDistance)
         
         let options = [MKLaunchOptionsMapCenterKey: NSValue(mkCoordinate: regionSpan.center), MKLaunchOptionsMapSpanKey: NSValue(mkCoordinateSpan: regionSpan.span)]
         
         let placemark = MKPlacemark(coordinate: coordinates)
         let mapItem = MKMapItem(placemark: placemark)
         mapItem.name = "Mission Church"
         mapItem.openInMaps(launchOptions: options)
     }
     

    @IBAction func Logout_IsTapped(_ sender: Any) {
        
        do {
            try Auth.auth().signOut()
        }catch let logoutError{
            print("logoutError")
        }
        
       let logoutStoryboard = UIStoryboard(name: "Main", bundle: nil)
        guard let SigninVC = storyboard?.instantiateViewController(withIdentifier: "SignInViewController") else { return }
        SigninVC.modalPresentationStyle = .fullScreen
        self.present(SigninVC, animated: true, completion: nil)
    }
    
     @IBAction func instagramDidGetTouch(_ sender: Any) {
    UIApplication.shared.openURL(URL(string: "https://www.instagram.com/fellowshipmissionchurch/?hl=en")!)
         
     }
     
     @IBAction func facebookDidGetTapped(_ sender: Any) {
      UIApplication.shared.openURL(URL(string: "https://www.facebook.com/fellowshipmission.church/")!)
     
     }
     
     @IBAction func churchSiteDidGetTapped(_ sender: Any) {
     
         UIApplication.shared.openURL(URL(string: "http://missionchurchcooljc.com")!)
     
     }
    
    @IBAction func youtubeDidGetTapped(_ sender: Any) {
       
           UIApplication.shared.openURL(URL(string: "http://www.youtube.com/channel/UC0clY7VjxRyRsfC6YWDlY6Q")!)
       
       }

}
