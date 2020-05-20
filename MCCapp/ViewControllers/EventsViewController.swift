//
//  EventsViewController.swift
//  MCCapp
//
//  Created by Xcode Mac on 5/17/20.
//  Copyright © 2020 MCCTechMinistry. All rights reserved.
//

import UIKit
import FirebaseAuth
import FirebaseDatabase
import Firebase
import Kingfisher
import KMPlaceholderTextView


class EventsViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
   
    var eventTimestamps:[NSDate] = []

    @IBOutlet weak var tableView: UITableView!
    
    var eventsRef: DatabaseReference?
    var eventsDatabaseHandle:DatabaseHandle?
    
    
    struct Event {
        let title, timestamp, location : String
        var imageURL : String
         
    }
    
    
    var events = [Event]()
    
    
    @IBOutlet weak var addEventsButton: UIBarButtonItem!
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
   // adminAuth()
        
    eventsRef = Database.database().reference()

    tableView.reloadData()
        
    tableView.transform = CGAffineTransform(rotationAngle: -CGFloat.pi)
        
    tableView.delegate = self
    tableView.dataSource = self
 
        
        
        eventsDatabaseHandle = eventsRef?.child("Church Events").observe(.childAdded, with: { (snaphot) in
            let eventPost = snaphot.value as! [String: Any]
            let event = Event(title: eventPost["eventtitle"] as! String,
                              timestamp: eventPost["eventdate"] as! String,
                              location: eventPost["eventlocation"] as! String,
                              imageURL: eventPost["ImageUrl"] as! String)
            
            
            
            

            let eventTimestamp = eventPost["postdate"] as! TimeInterval
            let eventTimeDate:NSDate = NSDate(timeIntervalSince1970: eventTimestamp/1000)
            
            self.eventTimestamps.append(eventTimeDate)
            
            
            
             self.events.append(event)


                        self.tableView.reloadData()


        })

     
}
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return events.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "picker", for: indexPath) as! PickerTableViewCell
        let event = events[indexPath.row]
        
        if let imgURL = URL(string:event.imageURL)
            {
                cell.flyerImages.kf.setImage(with:imgURL)
            }
            cell.eventTitle.text = event.title
            cell.eventDate.text =  event.timestamp
            cell.eventLocation.text = event.location
        
        
        let eventTempTimestamp:NSDate = eventTimestamps[indexPath.row]
        let eventTimestampDate:Date = eventTempTimestamp as Date
        
        
        cell.datePosted.text = eventTimestampDate.timeAgoDisplay()
        
        
        cell.transform = CGAffineTransform(rotationAngle: CGFloat.pi)
        
        
        return cell
    
    

}
    


}
