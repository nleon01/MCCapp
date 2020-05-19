//
//  Connected_ViewController.swift
//  MCCapp
//
//  Created by Xcode Mac on 5/14/20.
//  Copyright © 2020 MCCTechMinistry. All rights reserved.
//

import UIKit

class Connected_ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
   

    @IBOutlet weak var conneted_collection: UICollectionView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        var layout = self.conneted_collection.collectionViewLayout as! UICollectionViewFlowLayout
        layout.sectionInset = UIEdgeInsets(top: 0, left: 5, bottom: 0, right: 5)
        layout.minimumInteritemSpacing = 5
        layout.itemSize = CGSize(width:(self.conneted_collection.frame.size.width - 20)/2, height: self.conneted_collection.frame.size.height/3)
    }
    
let connectedTitles = ["Adults Sunday School","Childrens Church Live","Prayer Line","Youth Sunday School","Christian Enrichment","Morning Prayer"]
    

    
   let churchConnectImages: [UIImage] = [
        UIImage(named: "Adults Sunday School")!, UIImage(named: "Childrens Church Live")!, UIImage(named: "Prayer Line")!,UIImage(named: "Youth Sunday School")!,UIImage(named: "Christian Enrichment")!,UIImage(named: "Morning Prayer")!]
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return connectedTitles.count
       }
       
       func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "connectedcell", for: indexPath) as! Stay_Connected_CollectionViewCell
        
       cell.image.image = churchConnectImages[indexPath.item]
        
        cell.Title.text = connectedTitles[indexPath.item]
        
        cell.layer.borderColor = UIColor.lightGray.cgColor
        
        cell.layer.borderWidth = 0.5
        
        
        return cell
       }
       

}
