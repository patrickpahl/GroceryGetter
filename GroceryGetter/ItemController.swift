//
//  ItemController.swift
//  GroceryGetter
//
//  Created by Patrick Pahl on 8/26/16.
//  Copyright © 2016 Patrick Pahl. All rights reserved.

import Foundation
import CoreData

class ItemController {
    
    static let sharedController = ItemController()
    
    init() {
        
        let hasRan = NSUserDefaults.standardUserDefaults().boolForKey("hasRan")
        if hasRan == false {
            NSUserDefaults.standardUserDefaults().setBool(true, forKey: "hasRan")
            _ = Item(name: "broccoli", category: "vegtable")
            _ = Item(name: "carrots", category: "vegtable")
            _ = Item(name: "kale", category: "vegtable")
            
            _ = Item(name: "chicken", category: "meat")
            _ = Item(name: "pork", category: "meat")
            _ = Item(name: "beef", category: "meat")
            
            _ = Item(name: "coffee", category: "drinks")
            _ = Item(name: "tea", category: "drinks")
            _ = Item(name: "water", category: "drinks")
            
            _ = Item(name: "apple", category: "fruit")
            _ = Item(name: "orange", category: "fruit")
            _ = Item(name: "banana", category: "fruit")
            
            saveToPersistentStorage()
        }
    }
    
    var groceryItems: [Item] {
        let request = NSFetchRequest(entityName: "Item")
        let categorySortDescriptor = NSSortDescriptor(key: "category", ascending: true)
        let nameSortDescriptor = NSSortDescriptor(key: "name", ascending: true)
        request.sortDescriptors = [categorySortDescriptor, nameSortDescriptor]
        let moc = Stack.sharedStack.managedObjectContext
        
        return (try? moc.executeFetchRequest(request)) as? [Item] ?? []
    }
    
    //MARK: - Computed Property by Grocery Type
    
    var fruitArray: [Item] {
        return groceryItems.filter({$0.category == "fruit"})
    }
    
    var vegtableArray: [Item] {
        return groceryItems.filter({$0.category == "vegtable"})
    }
    
    var meatArray: [Item] {
        return groceryItems.filter({$0.category == "meat"})
    }
    
    var drinksArray: [Item] {
        return groceryItems.filter({$0.category == "drinks"})
    }
    
    
    //MARK: - Computed Properties
    
    //Picked
    var pickedItems: [Item] {
        return groceryItems.filter({$0.picked.boolValue})
    }
    
    var notPickedItems: [Item] {
        return groceryItems.filter({!$0.picked.boolValue})
    }
    
    //Got
    var gotItems: [Item] {
        return groceryItems.filter({$0.got.boolValue})
    }
    
    var notGotItems: [Item] {
        return groceryItems.filter({!$0.got.boolValue})
    }
    
    //MARK: - Funcs
    
    func saveToPersistentStorage(){
        let moc = Stack.sharedStack.managedObjectContext
        do {
            try moc.save()
        } catch {
            print("moc failed to save")
        }
    }
    
    func pickedValueToggle(item: Item){
        item.picked = !item.picked.boolValue
        saveToPersistentStorage()
    }
    
    func gotValueToggle(item: Item){
        item.got = !item.got.boolValue
        saveToPersistentStorage()
    }
}


