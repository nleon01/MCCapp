//
//  CustomTableViewCell.swift
//  MCCapp
//
//  Created by Xcode Mac on 5/12/20.
//  Copyright © 2020 MCCTechMinistry. All rights reserved.
//

import UIKit

class CustomTableViewCell: UITableViewCell {

    @IBOutlet weak var borderView: UIView!
    
    @IBOutlet weak var timestampLabel: UILabel!
    
    @IBOutlet weak var mainTextLabel: UITextView!
    
    @IBOutlet weak var titleTextLabel: UILabel!
    
    
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
mainTextLabel.textContainer.lineBreakMode = .byCharWrapping
mainTextLabel.textContainer.maximumNumberOfLines = 5
    mainTextLabel.delegate = self
        
}

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
}


}
extension CustomTableViewCell : UITextViewDelegate {
    func textViewDidChange(_ textView: UITextView) {
        
        let size = CGSize(width: 345, height: 0.50)
        
        
        
        mainTextLabel.sizeThatFits(size)
        
    }
}
