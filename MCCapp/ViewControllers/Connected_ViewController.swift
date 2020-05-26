//
//  Connected_ViewController.swift
//  MCCapp
//
//  Created by Xcode Mac on 5/14/20.
//  Copyright © 2020 MCCTechMinistry. All rights reserved.
//

import UIKit

class Connected_ViewController: UIViewController {
   
    @IBOutlet weak var MB1: UIVisualEffectView!
    
    @IBOutlet weak var ML1: UILabel!
    
    @IBOutlet weak var MB2: UIVisualEffectView!
       
    @IBOutlet weak var ML2: UILabel!
    
    @IBOutlet weak var MB3: UIVisualEffectView!
       
    @IBOutlet weak var ML3: UILabel!
    
    @IBOutlet weak var MB4: UIVisualEffectView!
       
    @IBOutlet weak var ML4: UILabel!
    
    @IBOutlet weak var MB5: UIVisualEffectView!
       
    @IBOutlet weak var ML5: UILabel!
    
    @IBOutlet weak var MB6: UIVisualEffectView!
       
    @IBOutlet weak var ML6: UILabel!
    
    @IBOutlet weak var MB7: UIVisualEffectView!
       
    @IBOutlet weak var ML7: UILabel!
    
    @IBOutlet weak var MB8: UIVisualEffectView!
       
    @IBOutlet weak var ML8: UILabel!
    
    @IBOutlet weak var MB9: UIVisualEffectView!
       
    @IBOutlet weak var ML9: UILabel!
    
    @IBOutlet weak var MCC1: UIButton!
    @IBOutlet weak var MCC2: UIButton!
    @IBOutlet weak var MCC3: UIButton!
    @IBOutlet weak var MCC4: UIButton!
    @IBOutlet weak var MCC5: UIButton!
    @IBOutlet weak var MCC6: UIButton!
    @IBOutlet weak var MCC7: UIButton!
    @IBOutlet weak var MCC8: UIButton!
    @IBOutlet weak var MCC9: UIButton!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        radi()
        
    }

       
    // Childrens Church
    @IBAction func MC1(_ sender: Any) {
        
UIApplication.shared.openURL(URL(string: "https://us02web.zoom.us/j/842029288")!)
    }
    
    //Adult Sunday School
    @IBAction func MC2(_ sender: Any) {
        UIApplication.shared.openURL(URL(string: "https://us02web.zoom.us/j/86748738836")!)
       }
    
    
    // Tuesday Bible Study
    @IBAction func MC3(_ sender: Any) {
        UIApplication.shared.openURL(URL(string: "https://www.youtube.com/channel/UC0clY7VjxRyRsfC6YWDlY6Q")!)
       }
    
    // Teen Sunday School
   
    @IBAction func MC4(_ sender: Any) {
        UIApplication.shared.openURL(URL(string: "https://us02web.zoom.us/j/87281504685")!)
       }
    
     //friday Night Prayer
   
    @IBAction func MC5(_ sender: Any) {
        UIApplication.shared.openURL(URL(string: "https://www.youtube.com/channel/UC0clY7VjxRyRsfC6YWDlY6Q")!)
       }
    
     // Morning Prayer
   
    
    @IBAction func MC6(_ sender: Any) {
        UIApplication.shared.openURL(URL(string: "https://us02web.zoom.us/j/910302977")!)
       }
    
     // Junior Sunday School
   
    
    @IBAction func MC7(_ sender: Any) {
        UIApplication.shared.openURL(URL(string: "https://us02web.zoom.us/j/81562699398")!)
       }
     //Christian Enrighment
    
    @IBAction func MC8(_ sender: Any) {
        UIApplication.shared.openURL(URL(string: "https://us02web.zoom.us/j/723115841")!)
       }
     //Sunday Worship
    @IBAction func MC9(_ sender: Any) {
        UIApplication.shared.openURL(URL(string: "https://www.youtube.com/channel/UC0clY7VjxRyRsfC6YWDlY6Q")!)
       }
    
    override func viewDidAppear(_ animated: Bool) {
    radi()
    }
    
    
    func radi() {
     
        MCC1.layer.cornerRadius = 7
        MB1.layer.cornerRadius = 7
        ML1.layer.cornerRadius = 7
        
        
        MCC2.layer.cornerRadius = 7
        MB2.layer.cornerRadius = 7
        ML2.layer.cornerRadius = 7
        
        MCC3.layer.cornerRadius = 7
        MB3.layer.cornerRadius = 7
        ML3.layer.cornerRadius = 7
        
        MCC4.layer.cornerRadius = 7
        MB4.layer.cornerRadius = 7
        ML4.layer.cornerRadius = 7
        
        MCC5.layer.cornerRadius = 7
        MB5.layer.cornerRadius = 7
        ML5.layer.cornerRadius = 7
        
        MCC6.layer.cornerRadius = 7
        MB6.layer.cornerRadius = 7
        ML6.layer.cornerRadius = 7
        
        MCC7.layer.cornerRadius = 7
        MB7.layer.cornerRadius = 7
        ML7.layer.cornerRadius = 7
        
        MCC8.layer.cornerRadius = 7
        MB8.layer.cornerRadius = 7
        ML8.layer.cornerRadius = 7
        
        MCC9.layer.cornerRadius = 7
        MB9.layer.cornerRadius = 7
        ML9.layer.cornerRadius = 7
        
    }
    
    
}
