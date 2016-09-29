//
//  ItemTableViewController.swift
//  GroceryGetter
//
//  Created by Patrick Pahl on 8/26/16.
//  Copyright © 2016 Patrick Pahl. All rights reserved.
//

import UIKit
import CoreData

class ItemTableViewController: UITableViewController, ButtonTableViewCellDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        print(ItemController.sharedController.groceryItems.count)
    }
    
    enum grocerySection: Int {
        case fruit      //0
        case vegtable   //1
        case meat       //2
        case drinks     //3
        
        //*Change 'drinks' if more sections are added
        static var count: Int  {return grocerySection.drinks.hashValue + 1}
    }
    
    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return grocerySection.count
    }
    
    override func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        
        let _section = grocerySection(rawValue: section)!
        
        switch _section {
        case .fruit:
            return "Fruit"
        case .vegtable:
            return "Vegtables"
        case .meat:
            return "Meat"
        case .drinks:
            return "Drinks"
        }
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        let _section = grocerySection(rawValue: section)!
        switch _section {
        case .fruit:
            return ItemController.sharedController.fruitArray.count
        case .vegtable:
            return ItemController.sharedController.vegtableArray.count
        case .meat:
            return ItemController.sharedController.meatArray.count
        case .drinks:
            return ItemController.sharedController.drinksArray.count
        }
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("itemCell", forIndexPath: indexPath) as! ButtonTableViewCell
        
        var item: Item
        let section = grocerySection(rawValue: indexPath.section)!
        
        switch section {
        case .fruit:
            item = ItemController.sharedController.fruitArray[indexPath.row]
        case .vegtable:
            item = ItemController.sharedController.vegtableArray[indexPath.row]
        case .meat:
            item = ItemController.sharedController.meatArray[indexPath.row]
        case .drinks:
            item = ItemController.sharedController.drinksArray[indexPath.row]
        }
        
        cell.updateWithItem(item)
        cell.delegate = self
        
        return cell
    }
    
    //MARK: - ButtonTableViewCellDelegate
    
    func buttonCellButtonTapped(sender: ButtonTableViewCell) {
        guard let indexPath = tableView.indexPathForCell(sender) else {return}
        let item: Item
    
        switch indexPath.section {
        case 0:
            item = ItemController.sharedController.fruitArray[indexPath.row]
        case 1:
            item = ItemController.sharedController.vegtableArray[indexPath.row]
        case 2:
            item = ItemController.sharedController.meatArray[indexPath.row]
        default:
            item = ItemController.sharedController.drinksArray[indexPath.row]
        }
        ItemController.sharedController.pickedValueToggle(item)
        self.tableView.reloadData()
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
