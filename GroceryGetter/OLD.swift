//
//  Item.swift
//  GroceryGetter
//
//  Created by Patrick Pahl on 8/26/16.
//  Copyright © 2016 Patrick Pahl. All rights reserved.
//

import Foundation

class zzzItem {
    
    let name: String
    let imageName: String
    let category: String
    var picked: Bool
    var got: Bool
    
    init(name: String, imageName: String, category: String, picked: Bool, got: Bool){
        
        self.name = name
        self.imageName = name.lowercaseString
        self.category = category
        self.picked = false
        self.got = false
    }
}



