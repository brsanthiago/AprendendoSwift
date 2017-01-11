//
//  ViewController.swift
//  eggplant-brownie
//
//  Created by Bruno Santiago on 09/01/17.
//  Copyright © 2017 Bruno Santiago. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, AddAItemDelegate {

    @IBOutlet var nameField : UITextField?;
    
    @IBOutlet var happinessField : UITextField?;
    
    var delegate : AddAMealDelegate?;
    
    var selected = Array<Item> ();
    
    var items = Array<Item>();
    
    @IBOutlet var tableView : UITableView?;
    
    func add(_ item: Item) {
        items.append(item);
        
        ItemDao().save(items);
        
        if let table = tableView{
            table.reloadData();
        }else{
            Alert(controller: self).show(message: "Unable to update items table!");
        }
        tableView?.reloadData();
    }
    
    override func viewDidLoad() {
        let newItemButton = UIBarButtonItem(title: "New Item", style: UIBarButtonItemStyle.plain, target: self, action: #selector(showNewItem));
        
        navigationItem.rightBarButtonItem = newItemButton;
        
        self.items = ItemDao().load();
    }
    
    func showNewItem(){
        let newItem = NewItemViewController(delegate: self);
        if let navigation = navigationController{
            navigation.pushViewController(newItem, animated: true);
        }else{
            Alert(controller: self).show();
        }
    }
    
    @IBAction
    func add(){
        
        if let meal = getMealFromFrom(){
            if let meals = delegate{
                meals.add(meal);
                if let navigation = navigationController{
                    navigation.popViewController(animated: true);
                } else {
                    Alert(controller: self).show(message: "Unable to go back, but the meal was added.");
                }
                return;
            }
        }
        
        Alert(controller: self).show();
    }
    
    func getMealFromFrom() -> Meal? {
        if let name = nameField?.text{
            if let happiness = parseToInt(happinessField?.text){
                let meal = Meal(name: name, happiness: happiness, items: selected);
                return meal;
            }
        }
        return nil;
    }
    
    func parseToInt(_ text:String?) -> Int? {
        if let number = text{
            return Int(number);
        }
        return nil;
    }
        
        
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count;
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) ->
        UITableViewCell {
            let row = indexPath.row;
            let item = items[row]
            let cell = UITableViewCell(style: UITableViewCellStyle.default, reuseIdentifier: nil);
            cell.textLabel!.text =  item.name
            return cell;
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let cell = tableView.cellForRow(at: indexPath){            if (cell.accessoryType == UITableViewCellAccessoryType.none){
                cell.accessoryType = UITableViewCellAccessoryType.checkmark;
                let item = items[indexPath.row];
                selected.append(item);
            }else{
                cell.accessoryType = UITableViewCellAccessoryType.none;
                let item = items[indexPath.row];
                if let position = items.index(of: item){
                    selected.remove(at: position);
                }
            
            }
        }
    }
    

}

