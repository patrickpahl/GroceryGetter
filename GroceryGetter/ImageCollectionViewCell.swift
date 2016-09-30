//
//  ImageCollectionViewCell.swift
//  GroceryGetter
//
//  Created by Patrick Pahl on 9/29/16.
//  Copyright © 2016 Patrick Pahl. All rights reserved.
//

import UIKit

class ImageCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var collectionImageView: UIImageView!
 
    func updateWith(image: UIImage){
        collectionImageView.image = image
    }
}



//@IBOutlet weak var myImageView: UIImageView!
//
//
//func updateWith(image: UIImage){
//    myImageView.image = image
//}