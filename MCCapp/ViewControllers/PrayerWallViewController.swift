//
//  PrayerWallViewController.swift
//  MCCapp
//
//  Created by Xcode Mac on 5/10/20.
//  Copyright © 2020 MCCTechMinistry. All rights reserved.
//

import UIKit
import Firebase
import FirebaseDatabase

class PrayerWallViewController: UIViewController,UITableViewDelegate,UITableViewDataSource  {
    @IBOutlet weak var prayIndicator: UIActivityIndicatorView!
    
@IBOutlet weak var composeButton: UIBarButtonItem!
    
    var prayerRef: DatabaseReference?
       var prayerDatabaseHandle:DatabaseHandle?
       
       var prayerRequest = [String]()
       var prayerTimestamps:[NSDate] = []
       var userName = [String]()
       var didLike = false
       
       
       @IBOutlet weak var tableView: UITableView!
       

    override func viewDidLoad() {
        super.viewDidLoad()
        
prayIndicator.startAnimating()
        
               prayerRef = Database.database().reference()
               
               tableView.reloadData()
               
               tableView.transform = CGAffineTransform(rotationAngle: -CGFloat.pi)
               
               
               tableView.delegate = self
               tableView.dataSource = self
               
               prayerDatabaseHandle = prayerRef?.child("Prayers").observe(.childAdded, with: { (snaphot) in
                   print(snaphot)
                   print(snaphot.value)
                   
                   let prayPost = snaphot.value as! [String: Any]
                   
                   
                   let praytimestamp = prayPost["praydate"] as! TimeInterval
                   let prayTimeDate:NSDate = NSDate(timeIntervalSince1970: praytimestamp/1000)
                   
                   self.prayerTimestamps.append(prayTimeDate)
                   
              
                   
                   self.userName.append(prayPost["username"] as! String)
                   
                   
               self.prayerRequest.append(prayPost["prayer"] as! String)
               
                self.prayIndicator.stopAnimating()
             self.tableView.reloadData()
                   
           })
           
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return prayerRequest.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Prayer") as! PrayerWallTableViewCell
        
     

        
    cell.prayerRequestLabel.lineBreakMode = .byWordWrapping
    cell.prayerRequestLabel.numberOfLines = 8
        
    cell.prayerRequestLabel.text = prayerRequest[indexPath.row]
        
    cell.userNameLabel.text! = userName[indexPath.row]
    
        
        let prayTempTimestamp:NSDate = prayerTimestamps[indexPath.row]
        let prayTimestampDate:Date = prayTempTimestamp as Date
        
        
        cell.wallTimeStamp.text = prayTimestampDate.timeAgoDisplay()
        
        cell.transform = CGAffineTransform(rotationAngle: CGFloat.pi)
        
        return cell
        
        
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        
    }
        
           
       }
    
    
             
    

