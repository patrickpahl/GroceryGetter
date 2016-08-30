//
//  Item+CoreDataProperties.swift
//  GroceryGetter
//
//  Created by Patrick Pahl on 8/26/16.
//  Copyright © 2016 Patrick Pahl. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

import Foundation
import CoreData

extension Item {

    @NSManaged var name: String
    @NSManaged var category: String
    @NSManaged var imageName: String
    @NSManaged var picked: NSNumber
    @NSManaged var got: NSNumber

}
