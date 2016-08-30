//
//  ButtonTableViewCell.swift
//  GroceryGetter
//
//  Created by Patrick Pahl on 8/29/16.
//  Copyright © 2016 Patrick Pahl. All rights reserved.
//

import UIKit

class ButtonTableViewCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    var delegate: ButtonTableViewCellDelegate
    
    //MARK: - Outlets
    @IBOutlet weak var groceryImage: UIImageView!
    @IBOutlet weak var itemNameLabel: UILabel!
    @IBOutlet weak var pickedButton: UIButton!
    
    
    //MARK: - Action
    @IBAction func pickedButtonTapped(sender: AnyObject) {
        
        if let delegate = delegate {
            delegate.buttonCellButtonTapped(self)
        }
    }
    
    func updateButton(picked: Bool){
        if picked {
            pickedButton.setImage(UIImage(named: "picked"), forState: .Normal)
        } else {
            pickedButton.setImage(UIImage(named: "notpicked"), forState: .Normal)
        }
    }
    
    
    func updateWithItem(item: Item){
        
        itemNameLabel.text = item.name
        updateButton(item.picked.boolValue)
    }

}

protocol ButtonTableViewCellDelegate {
    func buttonCellButtonTapped(sender: ButtonTableViewCell)
}