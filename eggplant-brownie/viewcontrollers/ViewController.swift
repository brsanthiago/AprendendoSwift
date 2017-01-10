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
    
    var items = [Item(name: "Eggplant", calories:5) ,Item(name: "Brownie", calories:10) ,Item(name: "Açaí",calories: 8),Item(name: "Muffin", calories:15) ,Item(name: "Chocolate Branco", calories:12)];
    
    @IBOutlet var tableView : UITableView?;
    
    func add(_ item: Item) {
        items.append(item);
        if let table = tableView{
            table.reloadData();
        }else{
            let errorAlert = UIAlertController(title: "Sorry", message: "Unable to update the table", preferredStyle: UIAlertControllerStyle.alert);
            
            let actionUnderstood = UIAlertAction(title: "Understood", style: UIAlertActionStyle.cancel, handler: nil);
            
            errorAlert.addAction(actionUnderstood);
            
            present(errorAlert, animated: true, completion: nil);
            
        }
        tableView?.reloadData();
    }
    
    override func viewDidLoad() {
        let newItemButton = UIBarButtonItem(title: "New Item", style: UIBarButtonItemStyle.plain, target: self, action: #selector(showNewItem));
        
        navigationItem.rightBarButtonItem = newItemButton;
    }
    
    func showNewItem(){
        let newItem = NewItemViewController(delegate: self);
        if let navigation = navigationController{
            navigation.pushViewController(newItem, animated: true);
        }
    }
    
    @IBAction
    func add(){
        
        if(nameField == nil || happinessField == nil){
            return;
        }
        
        let name:String = nameField!.text!;
        
        if let happiness:Int = Int(happinessField!.text!){
            
            let meal = Meal(name: name,happiness:happiness, items: selected)
        
        print("Eaten \(meal.name) whith happiness \(meal.happiness) with \(meal.items)!")
            
            if (delegate == nil) {
                return;
            }
            
            delegate!.add(meal)
            
            if let navigation = navigationController{
                navigation.popViewController(animated: true);
            }
            
        }
        
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

