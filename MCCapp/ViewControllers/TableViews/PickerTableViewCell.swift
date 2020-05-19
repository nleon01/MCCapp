//
//  PickerTableViewCell.swift
//  MCCapp
//
//  Created by Xcode Mac on 5/17/20.
//  Copyright © 2020 MCCTechMinistry. All rights reserved.
//

import UIKit

class PickerTableViewCell: UITableViewCell {
    @IBOutlet weak var eventTitle: UITextView!
    
    @IBOutlet weak var datePosted: UILabel!
    @IBOutlet weak var flyerImages: UIImageView!
    @IBOutlet weak var eventDate: UITextView!
    @IBOutlet weak var eventLocation: UITextView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
