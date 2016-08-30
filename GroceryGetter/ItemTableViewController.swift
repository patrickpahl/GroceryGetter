//
//  ItemTableViewController.swift
//  GroceryGetter
//
//  Created by Patrick Pahl on 8/26/16.
//  Copyright © 2016 Patrick Pahl. All rights reserved.
//

import UIKit

class ItemTableViewController: UITableViewController, ButtonTableViewCellDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    enum Section: Int {
        
        case fruit      //0
        case vegtable   //1
        case meat       //2
        case drinks     //3
    }
    
    override func viewWillAppear(animated: Bool) {
        tableView.reloadData()
    }


    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 4
    }
    
    override func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        
        let _section = Section(rawValue: section)!
        switch _section {
            
        case .fruit:
            return "Fruit"
        case .vegtable:
            return "Vegtable"
        case .meat:
            return "Meat"
        case .drinks:
            return "Drinks"
        }
    }
    

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        let _section = Section(rawValue: section)!
        
        switch _section {
            
        case .fruit:
            return ItemController.sharedController.fruitItems.count
        case .vegtable:
            return ItemController.sharedController.vegtableItems.count
        case .meat:
            return ItemController.sharedController.meatItems.count
        case .drinks:
            return ItemController.sharedController.drinkItems.count
        }
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("itemCell", forIndexPath: indexPath) as! ButtonTableViewCell
        
        cell.delegate = self
        
        let item: Item
        
        let section = Section(rawValue: indexPath.row)!
        
        switch section {
        
        case .fruit:
            item = ItemController.sharedController.fruitItems[indexPath.row]
        case .vegtable:
            item = ItemController.sharedController.vegtableItems[indexPath.row]
        case .meat:
            item = ItemController.sharedController.meatItems[indexPath.row]
        case .drinks:
            item = ItemController.sharedController.drinkItems[indexPath.row]
        }
        
        cell.updateWithItem(item)
        cell.textLabel?.text = item.name

        return cell
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
