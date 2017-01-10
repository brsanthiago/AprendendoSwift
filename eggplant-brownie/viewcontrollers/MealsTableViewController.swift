//
//  MealsTableViewController.swift
//  eggplant-brownie
//
//  Created by Bruno Santiago on 10/01/17.
//  Copyright © 2017 Bruno Santiago. All rights reserved.
//

import UIKit

class MealsTableViewContoller : UITableViewController{
    
    
    
    var meals = [Meal(name:"eggplant browine", happiness: 5),Meal(name: "Açaí", happiness: 5),Meal(name: "Crepe", happiness: 3),Meal(name: "Sorvete", happiness: 4)];
   
    
    func add(meal:Meal){
        meals.append(meal);
        tableView.reloadData();
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let view = segue.destination as! ViewController;
        view.mealsTable = self;
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return meals.count;
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let row = indexPath.row;
        
        let meal = meals[row];
        
        let cell = UITableViewCell(style: UITableViewCellStyle.default, reuseIdentifier: nil);
        
        cell.textLabel!.text = meal.name;
        
        return cell;
        
    }
    
}
