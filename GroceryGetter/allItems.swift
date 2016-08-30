//
//  allItems.swift
//  GroceryGetter
//
//  Created by Patrick Pahl on 8/26/16.
//  Copyright © 2016 Patrick Pahl. All rights reserved.
//

import Foundation


class allItems{
    
    let vegtableKey = "vegtable"
    let meatKey = "meat"
    let breadKey = "bread"
    let drinksKey = "drinks"
    let otherKey = "other"
    let snackKey = "snacks"
    let fruitKey = "fruit"
    let dairyKey = "dairy"
    let condimentsKey = "condiments"
    let breakfastKey = "breakfast"
    let pastaKey = "pasta"
    

static var groceryItems: [Item?]{
    
    var broccoli = Item(name: "broccoli", category: "vegtable")
    var carrots = Item(name: "carrots", category: "vegtable")
    var kale = Item(name: "kale", category: "vegtable")
    
    var chicken = Item(name: "chicken", category: "meat")
    var pork = Item(name: "pork", category: "meat")
    var beef = Item(name: "beef", category: "meat")
    
    var coffee = Item(name: "coffee", category: "drinks")
    var tea = Item(name: "tea", category: "drinks")
    var water = Item(name: "water", category: "drinks")
    
    var apple = Item(name: "apple", category: "fruit")
    var orange = Item(name: "orange", category: "fruit")
    var banana = Item(name: "banana", category: "fruit")
    
    return [broccoli, carrots, kale, chicken, pork, beef, coffee, tea, water, apple, orange, banana]

}

    
}
