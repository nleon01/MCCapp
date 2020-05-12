//
//  PrayerWallTableViewCell.swift
//  MCCapp
//
//  Created by Xcode Mac on 5/10/20.
//  Copyright © 2020 MCCTechMinistry. All rights reserved.
//
    import UIKit
    import GoogleSignIn

    class PrayerWallTableViewCell: UITableViewCell {
        
        @IBOutlet weak var encouragement_Title: UILabel!
        @IBOutlet weak var prayingHands_Image: UIImageView!
        @IBOutlet weak var userNameLabel: UILabel!
        @IBOutlet weak var prayerRequestLabel: UILabel!
        @IBOutlet weak var wallTimeStamp: UILabel!
 
        
        override func awakeFromNib() {
            super.awakeFromNib()
            // Initialization code
        }

        override func setSelected(_ selected: Bool, animated: Bool) {
            super.setSelected(selected, animated: animated)

            // Configure the view for the selected state
        }
        

    }
