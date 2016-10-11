//
//  ImageCollectionViewCell.swift
//  GroceryGetter
//
//  Created by Patrick Pahl on 9/29/16.
//  Copyright © 2016 Patrick Pahl. All rights reserved.

import UIKit

class ImageCollectionViewCell: UICollectionViewCell {
    
    //Outlet
    @IBOutlet weak var collectionImageView: UIImageView!
    @IBOutlet weak var collectionButton: UIButton!
    
    //Action
    @IBAction func collectionButtonTapped(sender: AnyObject) {
        if let delegate = delegate {
            delegate.buttonCollectionButtonTapped(self)
        }
    }
    
    var delegate: ImageCollectionViewCellDelegate?
    
    var item: Item? {
        didSet {
            // FIXED: "item?.name" will be Optional("coffee") because it isn't unwrapped
            //            collectionImageView.image = UIImage(named: "\(item?.name)")
            collectionImageView.image = UIImage(named: "\(item!.name)")
            // FIXED: Careful setting up outlets on didSet. There's a chance collectionImageView hasn't loaded yet and therefore it could be nil
        }
    }
    
    func updateCollectionButton(got: Bool){
        if got {
            collectionButton.setImage(UIImage(named: "picked"), forState: .Normal)
        } else {
            collectionButton.setImage(UIImage(named: "clear"), forState: .Normal)
        }
    }
    
    func updateWithCollectionItem(item: Item) {
        self.item = item
        updateCollectionButton(item.got.boolValue)
    }
}

protocol ImageCollectionViewCellDelegate {
    func buttonCollectionButtonTapped(sender: ImageCollectionViewCell)
}



