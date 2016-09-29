//
//  Item.swift
//  GroceryGetter
//
//  Created by Patrick Pahl on 8/26/16.
//  Copyright © 2016 Patrick Pahl. All rights reserved.
//

import Foundation
import CoreData

class Item: NSManagedObject {

    convenience init(name: String, category: String, context: NSManagedObjectContext = Stack.sharedStack.managedObjectContext){
        
         let entity = NSEntityDescription.entityForName("Item", inManagedObjectContext: context)!
        
        self.init(entity: entity, insertIntoManagedObjectContext: context)
        
        self.name = name
        self.category = category
        self.imageName = name.lowercaseString
        self.picked = false
        self.got = false
    }
}


//class Item: NSManagedObject {
//    
//    convenience init?(name: String, category: String, imageName: String, picked: Bool, got: Bool, context: NSManagedObjectContext = Stack.sharedStack.managedObjectContext){
//        
//        guard let entity = NSEntityDescription.entityForName("Item", inManagedObjectContext: context) else {return nil}
//        
//        self.init(entity: entity, insertIntoManagedObjectContext: context)
//        
//        self.name = name
//        self.category = category
//        self.imageName = name.lowercaseString
//        self.picked = false
//        self.got = false
//    }
//}