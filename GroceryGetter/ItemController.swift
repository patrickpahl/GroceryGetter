//
//  ItemController.swift
//  GroceryGetter
//
//  Created by Patrick Pahl on 8/26/16.
//  Copyright © 2016 Patrick Pahl. All rights reserved.
//swift c

import Foundation
import CoreData

class ItemController {
    
    static let sharedController = ItemController()
    
    var items: [Item]{
        let request = NSFetchRequest(entityName: "Item")
        let categorySortDescriptor = NSSortDescriptor(key: "category", ascending: true)
        request.sortDescriptors = [categorySortDescriptor]
        let moc = Stack.sharedStack.managedObjectContext
        return (try? moc.executeFetchRequest(request)) as? [Item] ?? []
    }
    
    //MARK: - Computed Property by Grocery Type
    
    var fruitItems: [Item]{
        var fruitArray = [Item]()
        for item in allItems.groceryItems {
            if item?.category == "fruit" {
                if let item = item {
                    fruitArray.append(item)
                }
            }
        }
        return fruitArray
    }
    
    var vegtableItems: [Item] {
        var vegtableArray = [Item]()
        for item in allItems.groceryItems {
            if item?.category == "vegtable" {
                if let item = item {
                    vegtableArray.append(item)
                }
            }
        }
        return vegtableArray
    }
    
    var meatItems: [Item] {
        
        var meatArray = [Item]()
        for item in allItems.groceryItems {
            if item?.category == "meat" {
                if let item = item {
                    meatArray.append(item)
                }
            }
        }
        return meatArray
    }
    
    var drinkItems: [Item] {
        var drinkArray = [Item]()
        for item in allItems.groceryItems {
            if item?.category == "drinks" {
                if let item = item {
                    drinkArray.append(item)
                }
            }
        }
        return drinkArray
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





