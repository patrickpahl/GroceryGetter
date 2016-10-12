//
//  ItemCollectionViewController.swift
//  GroceryGetter
//
//  Created by Patrick Pahl on 8/29/16.
//  Copyright © 2016 Patrick Pahl. All rights reserved.
//

import UIKit
import CoreData

///TO DO: CLEAR ALL BUTTON- all items go to NOT CHECKMARKED

private let reuseIdentifier = "imageCell"

class ItemCollectionViewController: UICollectionViewController, ImageCollectionViewCellDelegate, UICollectionViewDelegateFlowLayout {
    
    ///*Added: UICollectionViewDelegateFlowLayout
    
    override func viewDidLoad() {
        /// FIXED: Bug caused when casting cell as ImageCollectionViewCell bc we're using a custom cell. Just need to delete the code.
        //  super.viewDidLoad()
        //  self.collectionView!.registerClass(UICollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)
        self.navigationController?.navigationBar.tintColor = UIColor.whiteColor()
    }
    
    //Action
    @IBAction func clearAllButtonTapped(sender: AnyObject) {
        for item in ItemController.sharedController.pickedItems {
            if item.got.boolValue == true {
                item.got = !item.got.boolValue
                ItemController.sharedController.saveToPersistentStorage()
            }
        }
//        for items in ItemController.sharedController.pickedItems {
//        }
    }
    
    ///
    //collectionButton.setImage(UIImage(named: "clear"), forState: .Normal)
    ///
    
    // MARK: UICollectionViewDataSource
    
    override func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 1
    }
    
    override func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return ItemController.sharedController.pickedItems.count
    }
    
    override func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier(reuseIdentifier, forIndexPath: indexPath) as? ImageCollectionViewCell ?? ImageCollectionViewCell()
        
        let item = ItemController.sharedController.pickedItems[indexPath.item]
        
        cell.updateWithCollectionItem(item)
        cell.delegate = self
        return cell
    }
    
    //Size for item at indexPath
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
        
        let screenSize: CGRect = UIScreen.mainScreen().bounds
        let screenWidth = screenSize.width
        //let screenHeight = screenSize.height
        return CGSize(width: screenWidth/3, height: screenWidth/3)
    }
    
    //MARK: - ImageCollectionViewCellDelegate
    
    func buttonCollectionButtonTapped(sender: ImageCollectionViewCell) {
        // FIXED
        // guard let indexPath = collectionView?.cellForItemAtIndexPath(sender) else {return}
        guard let indexPath = collectionView?.indexPathForCell(sender) else {return}
        let item = ItemController.sharedController.pickedItems[indexPath.item]
        ItemController.sharedController.gotValueToggle(item)
        self.collectionView?.reloadData()
    }
    
}




