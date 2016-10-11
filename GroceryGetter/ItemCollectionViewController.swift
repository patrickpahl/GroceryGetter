//
//  ItemCollectionViewController.swift
//  GroceryGetter
//
//  Created by Patrick Pahl on 8/29/16.
//  Copyright © 2016 Patrick Pahl. All rights reserved.
//

import UIKit
import CoreData

///TO DO: CLEAR ALL BUTTON- all items go to 'not got'

private let reuseIdentifier = "imageCell"

class ItemCollectionViewController: UICollectionViewController, ImageCollectionViewCellDelegate, UICollectionViewDelegateFlowLayout {

    ///*Added: UICollectionViewDelegateFlowLayout
    
    override func viewDidLoad() {
        /// FIXED: Bug caused when casting cell as ImageCollectionViewCell bc we're using a custom cell. Just need to delete the code.
        //  super.viewDidLoad()
        //  self.collectionView!.registerClass(UICollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)
        self.navigationController?.navigationBar.tintColor = UIColor.whiteColor()
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */

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
        //        let item: Item
        //        guard let indexPath = collectionView?.cellForItemAtIndexPath(sender) else {return}
        //        ItemController.sharedController.gotValueToggle(item)
        //        self.collectionView?.reloadData()
        guard let indexPath = collectionView?.indexPathForCell(sender) else {return}
        let item = ItemController.sharedController.pickedItems[indexPath.item]
        ItemController.sharedController.gotValueToggle(item)
        self.collectionView?.reloadData()
    }
    
    // MARK: UICollectionViewDelegate

    /*
    // Uncomment this method to specify if the specified item should be highlighted during tracking
    override func collectionView(collectionView: UICollectionView, shouldHighlightItemAtIndexPath indexPath: NSIndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment this method to specify if the specified item should be selected
    override func collectionView(collectionView: UICollectionView, shouldSelectItemAtIndexPath indexPath: NSIndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
    override func collectionView(collectionView: UICollectionView, shouldShowMenuForItemAtIndexPath indexPath: NSIndexPath) -> Bool {
        return false
    }

    override func collectionView(collectionView: UICollectionView, canPerformAction action: Selector, forItemAtIndexPath indexPath: NSIndexPath, withSender sender: AnyObject?) -> Bool {
        return false
    }

    override func collectionView(collectionView: UICollectionView, performAction action: Selector, forItemAtIndexPath indexPath: NSIndexPath, withSender sender: AnyObject?) {
    
    }
    */

}




